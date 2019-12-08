# Aarhus University Community of Researchers Using Open Software

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/au-cru/site.svg?branch=master)](https://travis-ci.org/au-cru/site)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

<!-- TODO: Add link to Slack? -->

Reproducibility, open scientific practices, and analytic transparency are
increasingly being requested or required of scientists and researchers, but
training on these on topics is severely lacking. Nor has the culture around
sharing of code and skills, or even the recognition that these concepts are 
important for the health of science, dramatically changed. This community aims
to start bridging these gaps in knowledge and skills, and to hope start forming
a culture of sharing, openness, and improvement in scientific activities.

This specific repository contains the website source files, training material,
and event listings for the community. It also hosts some administrative material
for the community.

## Instructional Design

The most of the events hosted by this community are designed to be presented primarily
with a participatory live-coding approach. This involves an instructor typing
and running code in a code editor (e.g. [RStudio](https://www.rstudio.com/)) in front of the class,
while the class follows along using their own computers. Challenges are (optionally)
interspersed throughout the session, allowing participants to collaboratively
work on smaller coding problems for a few minutes. All session materials are
provided ahead of time on the [website](https://au-cru.github.io/site) for participants to refer to during
the sessions.

## Website structure and location of content

The structure of the website is based on the standards for generating websites with
[blogdown]. Folders to focus on are:

- `content/`: Contains stand alone pages for the website (such as "About").
- `content/material/`: Contains the code-along teaching material. Material is
written in R Markdown and generated into the website through [blogdown]. See the
contributing section below on adding material. 
TODO: Add information on creating new material.
- `data/events/`: Contains the `.yaml` files for individual events, 
both upcoming and past. Creating a new event is as simple as copying and pasting
an old one and updating the contents inside the new file.

[blogdown]: https://bookdown.org/yihui/blogdown/

## Contributing and conduct

If you are interested in contributing to the community, please refer to
the [contributing guidelines](CONTRIBUTING.md). We adhere to
[Code of Conduct](CODE_OF_CONDUCT.md), so by contributing to this community, 
you agree to abide by its terms.

-----

See the [license](content/license.md) file for details on (re-)use, on attribution,
and on acknowledgements.
