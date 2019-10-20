library(tidyverse)
# Also use glue and datapasta.

# Code-along --------------------------------------------------------------

# Paste from Google Sheets into Excel/Calc using datapaste package.
events <- tibble::tribble(
               ~Date,                                        ~Topic,                  ~Level,
   "1 November 2019",     "Data visualization with ggplot2, part 1",              "Beginner",
  "15 November 2019",           "Data wrangling with dplyr, part 1",              "Beginner",
  "29 November 2019",                          "Creating functions", "Beginner-Intermediate",
  "13 December 2019",        "Reproducible reports with R Markdown",              "Beginner",
   "17 January 2020",      "Reproducibility and project management",              "Beginner",
   "31 January 2020",              "Data wrangling with data.table",          "Intermediate",
  "14 February 2020",                    "Version control with Git",              "Beginner",
  "28 February 2020",         "Efficient coding and best practices", "Beginner-Intermediate",
     "13 March 2020",     "Data visualization with ggplot2, part 2", "Beginner-Intermediate",
     "27 March 2020",          "Learning how to learn/finding help",              "Beginner",
     "10 April 2020",          "First steps in creating R packages",          "Intermediate",
     "24 April 2020",           "Create websites with R (blogdown)",          "Intermediate",
        "8 May 2020",        "Creating interactive apps with Shiny",          "Intermediate",
       "22 May 2020", "Data wrangling with dplyr and tidyr, part 2", "Beginner-Intermediate"
  )

# Do some data wrangling of the pasted in schedule.
events_prep <- events %>%
  rename(name = Topic) %>%
  mutate(
    date_ymd = lubridate::dmy(Date),
    start_date = str_c(date_ymd, "T13:00:00+01:00"),
    type = "code-along",
    level = str_remove(Level, "-"),
    location = "AU Library, Main Floor, Nobelparken, Universitetsparken 461, 8000 Aarhus",
    software = "R"
  )

# Template for the events.
events_template <- '
type: "{type}"
name: "{name}"
description: >
  FILL IN
location: "{location}"
start_date: {start_date}
level: "{level}"
software: ["{software}"]
'

# All new file names to be created.
event_files <- here::here("data", "events", str_c(events_prep$date_ymd, "-code-along.yaml"))

# Fill in the template with the contents of the events.
event_file_contents <- events_prep %>%
  glue::glue_data(events_template)

# Create the event files.
walk2(event_file_contents, event_files, write_lines)

# Hacky hours -------------------------------------------------------------

hacky_dates <- events_prep %>%
  filter(as.numeric(str_extract(Date, "^\\d+")) > 20)

hacky_hours_template <- '
type: "coworking"
name: "Hacky hour hang out"
description: >
  Come to this informal hangout to ask for feedback on problems you are experiencing,
  to give advice or help others out with their problems, or just co-work with
  other likeminded researchers who also use (open) research software for their work.
location: "Studiecaféen, Studenterhus, Nordre Ringgade 3, 8000 Aarhus"
start_date: {date}T14:30:00+01:00
# Must be array for with []
software: [""]
level: "everyone"
'

# All new file names to be created.
hacky_files <- here::here("data", "events", str_c(hacky_dates$date_ymd, "-hacky-hour.yaml"))

# Fill in the template with the contents of the events.
hacky_file_contents <- hacky_dates %>%
  glue::glue_data(hacky_hours_template)

# TODO: Finish these up.
# Create the event files.
# walk2(hacky_file_contents, hacky_files, write_lines)
