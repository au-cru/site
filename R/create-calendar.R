library(tidyverse)
library(lubridate)
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
    DTSTART = ymd_hms(start_date, tz = "Europe/Copenhagen"),
    DTEND = ymd_hms(end_date, tz = "Europe/Copenhagen"),
    DESCRIPTION = as.character(glue(
      "A {type} for {str_to_lower(level)}"
    )),
    # For next round, add beginner level to summary
    SUMMARY = as.character(glue("{name}{software}")),
    LOCATION = location
  )

public_calendar_link <- "https://calendar.google.com/calendar/ical/2ss4h917ttbik93jp4n7kkto5o%40group.calendar.google.com/public/basic.ics"
current_calendar <- ic_read(public_calendar_link) %>%
  mutate(
    DTSTART = with_tz(ymd_hms(DTSTART), "Europe/Copenhagen"),
    DTEND = with_tz(ymd_hms(DTEND), "Europe/Copenhagen")
  ) %>%
  arrange(DTSTART) %>%
  select(DTSTART, DTEND, SUMMARY) %>%
  mutate_at(
    vars(SUMMARY),
    ~ str_replace_all(., "\\\\,", ",") %>%
      str_replace_all("\\\\", "")
  )

new_calendar_data <- anti_join(event_data, current_calendar)

ic_write(ical(new_calendar_data), here::here("R/calendar.ics"))
