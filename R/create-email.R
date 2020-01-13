# Load packages -----------------------------------------------------------

library(tidyverse)
library(lubridate)
library(gmailr)
# Also uses blastula, glue, fs, and knitr

# Set receiver email and dates --------------------------------------------

send_to <- Sys.getenv("TINYLETTER_ADDRESS")

current_date <- today()
in_future_weeks <- current_date + weeks(3)
date_range <- seq(current_date, in_future_weeks, by = "days") %>%
  as.character()

# Extract only relevant event files ---------------------------------------

event_files <- fs::dir_ls(here::here("data/events"), glob = "*.yaml") %>%
  stringr::str_extract(str_c("^.*(", date_range, ").*.yaml$", collapse = "|")) %>%
  na.omit()

# Import event data and create table --------------------------------------

table_of_events <- event_files %>%
  map(yaml::read_yaml) %>%
  # Collapse multiple software values.
  map(~ {
    .x$software <- str_c(.x$software, collapse = ", ")
    .x
  }) %>%
  map_dfr(as_tibble) %>%
  mutate(
    software = if_else(!is.na(software) & software != "", glue::glue(" ({software})"), ""),
    What = glue::glue("{name}{software} for **{str_to_lower(level)}**"),
    When = as_datetime(start_date, tz = "Europe/Copenhagen"),
    When = stamp("March 1, 1999 at 22:10", quiet = TRUE)(When)
  ) %>%
  select(What, When, Where = location) %>%
  knitr::kable(format = "html") %>%
  kableExtra::kable_styling("condensed") %>%
  str_flatten("\n")

# Create email body and a draft in Gmail ----------------------------------

email_body <- read_lines(here::here("R/email-template.html")) %>%
  str_flatten(" \n") %>%
  glue::glue()

email <- gm_mime() %>%
  gm_to(send_to) %>%
  gm_from("lwjohnst@gmail.com") %>%
  gm_subject("[AU CRU] Three events in January to: Learn more about data wrangling, visualization, and a hacky-hour.") %>%
  gm_html_body(email_body)

gm_auth(path = Sys.getenv("GMAILR_APP"), scope = "compose")
gm_create_draft(email)
