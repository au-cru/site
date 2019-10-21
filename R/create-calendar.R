library(tidyverse)
library(calendar)
library(assertr)
library(glue)

event_files <- fs::dir_ls(here::here("data/events"), glob = "*.yaml")
event_data <-
  event_files %>%
  map(yaml::read_yaml) %>%
  # Collapse multiple software values.
  map( ~ {
    .x$software <- str_c(.x$software, collapse = ", ")
    .x
  }) %>%
  map_dfr(as_tibble) %>%
  # TODO: Check for events that span multiple days.
  mutate(
    software = na_if(software, ""),
    software = case_when(
      !is.na(software) ~ str_c(" (", software, ")"),
      TRUE ~ ""
    ),
    description = description %>%
      str_remove("\n$") %>%
      str_replace_all("\n", "\\\\n")
  ) %>%
  transmute(
    UID = map_chr(1:n(), ~ ic_guid()),
    DTSTART = lubridate::as_datetime(start_date),
    DTEND = lubridate::as_datetime(end_date),
    DESCRIPTION = as.character(glue(
      "A {type} for {str_to_lower(level)}"
    )),
    SUMMARY = as.character(glue("{name}{software}")),
    LOCATION = location
  )

ic_write(ical(event_data), here::here("R/calendar.ics"))

# TODO: Fix this up so calendar is imported, results are compared to new schedule,
# and new events are added.
# public_calendar_link <- "https://calendar.google.com/calendar/ical/2ss4h917ttbik93jp4n7kkto5o%40group.calendar.google.com/public/basic.ics"
# ic_read(public_calendar_link) %>%
#   glimpse()
