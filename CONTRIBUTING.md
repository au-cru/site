# Contributing guidelines

Want to contribute? Great! :tada: Thanks for taking the time to contribute! :clap::clap:  

The following is a set of guidelines for contributing to the AU CRU community,
whether it be by teaching a lesson, fixing the website, helping to plan and
organize our various events, or taking on a leadership role.

### Table of Contents

1. [About AU CRU](#about)
    - [Code of Conduct](#code-of-conduct)

2. [How You Can Contribute](#how-you-can-contribute)
    - [Leading a Lesson](#leading-a-lesson)
        - [Creating the Content](#creating-the-content)
        - [Teaching in Class](#teaching-in-class)
    - [Fixing and Updating the Website](#fixing-and-updating-the-website)
    - [Other Ways to Get Involved](#other-ways-to-get-involved)

-----

# About AU CRU {#about}

The AU CRU group was formed to share and learn about techniques and
best practices for working with and coding in open software languages. We hold frequent sessions
in the format of mainly short code-alongs, but also longer workshops.

## Code of Conduct

We adhere to a [Code of Conduct](CODE_OF_CONDUCT.md)
and by participating, you agree to also uphold this code.

-----

# How You Can Contribute {#how-to-contribute}

## Adding teaching material :pencil: :computer: {#add-material}

The lesson material and website are created using [blogdown](https://bookdown.org/yihui/blogdown/),
which renders the R Markdown documents and converts the source material into 
a static website. A few things to consider when contributing to the lesson 
material:

1. All lesson material that contains R code chunks needs to be in R Markdown
format. 
1. Lessons include a mix of code chunks and text, organized using Markdown
headers.
1. Participants should be able to follow the contents of the lesson from the
text alone; i.e. the file should contain _all_ conceptual explanations.
1. We teach the *[tidyverse][tidyverse] way of using R*, meaning we use
packages like dplyr, tidyr, rmarkdown, ggplot2, and so on. This also means making
use of the pipe `%>%` operator.
1. We follow the tidyverse [*way of writing and styling R code*](https://style.tidyverse.org/).
1. Try to make use of built-in sample datasets instead of requiring
attendees to download files.
1. Make as few assumptions as possible about the knowledge of the audience,
unless specified that this is an intermediate level lesson, requiring prior knowledge.
Keep it simple.
1. Keep slides to a minimum if your lesson involves coding. Focus on the interactive live-coding part.
1. The lesson material should be posted to GitHub along with a pull request to
[au-cru/site](https://github.com/au-cru/site) repository at
least 1 day before the lesson date so we can review it.

Anyone can contribute to the course repository via [pull requests][pull-requests].
Please use [the GitHub flow style][github-flow] to manage changes:

1. Create a [fork][fork-explanation] of this repository, and
[clone][clone-explanation] it to your local computer.
2. In your local copy of this repository, create a new
[branch][branch-explanation].
3. Commit your changes to that branch.
4. Push the edits on that branch to your fork of the course repository.
5. Submit a pull request to the master repository (`au-cru/site`).
7. If you receive feedback on your pull request, make further commits to the new
branch on your fork. These will automatically be added to your pull request.

## Teaching in class :information_desk_person: :speech_balloon:

The Mozilla Science Study Group
handbook [**here**](https://mozillascience.github.io/studyGroupHandbook/lessons.html#reuse)
and [**here**](https://mozillascience.github.io/studyGroupHandbook/event-types.html#workalong)
has several very good points about making a lesson. This section summarizes bits
of the handbook, but also adds pieces that are missing from it. Check out the
[lesson bank too](https://github.com/mozillascience/studyGroupLessons/issues).

Here are some steps and guidelines when you instruct a class:

- Arrive early by coming 10 minutes before the lesson starts to set up.
- Start by *introducing a bit about yourself* and perhaps why you're interested
in teaching R and data analysis.
- Keep mindful of the time and try to *stay on time*. The lead organizer will be
also be keeping track of time and wave to you to continue on or slow down.
- Try to assume the participants *know as little as possible*. This is actually
quite hard, but just try as best you can. The lead organizer may take notes and
provide feedback after your lesson or clarify concepts to the participants. Try
to (briefly) explain as much aspects as possible of what you are doing,
including how to open RStudio or how to run code (e.g. press `Shift+Enter` in RStudio)
- The majority of the lesson material is *participatory live-coding*, so use of
slides is minimal. The purpose of the course is to *type with the participants*,
to show by doing.
- **Check in with participants**: We distribute coloured sticky notes to each
participant so that they can flag problems with one colour and success with
another colour. Use these indicators to check your pacing and where the
class is at.
- We teach the *[tidyverse][tidyverse] way of using R*, meaning we use
packages like dplyr, tidyr, rmarkdown, ggplot2, and so on. This also means making
use of the pipe `%>%` operator.
- We follow the tidyverse [*way of writing and styling R code*](https://style.tidyverse.org/).
- Be kind, and remember, your words *matter a lot*. Try to avoid words like
"basically", "its just", "as simple as", and so on. This is difficult, but at least
try. :smile:

Note: The lead organizer may provide feedback on your teaching. It isn't
criticism, but rather are areas to improve and become a better teacher!
:smiley_cat:

### More on "Participatory Live-Coding"

Live-coding is a hands-on method of teaching coding to a group in which the
instructor shares their screen with the group and types all commands on their
computer while the group follows along. Live-coding is a very effective teaching
technique: it forces the instructor to go slowly and ensures that participants
get to try out every command being used. It allows learners to experience common
errors themselves and debug them in a supportive environment, to explore
variations on material as they go, and to immediately check their understanding
by trying things hands-on.

Live-coding is a technique used by [Software Carpentry](https://software-carpentry.org/about/). 
Software Carpentry has lots of great resources explaining the why and how of live-coding:

- [10 tips and tricks for instructing and teaching by means of live coding](https://software-carpentry.org/blog/2016/04/tips-tricks-live-coding.html)
- The Software Carpentry [instructor training manual](http://carpentries.github.io/instructor-training/) 
includes many resources about programming education.

## Being a helper :raising_hand: 

Being a helper is fairly simple! When you see a participant with a "help" sticky
on their laptop, go and see what help you can provide! A couple things to review
and to keep in mind when helping. 

- Review the curriculum the instructors will be teaching.
- We teach the [`tidyverse`][tidyverse] way of using R, meaning we use packages
like dplyr, tidyr, rmarkdown, ggplot2, and so on. 
- We follow the tidyverse way of [writing and styling R code](https://style.tidyverse.org/).
- Be kind, and remember, your words and how you help *matter a lot*. They can 
make participants feel better or worse. So be kind, considerate, and understanding!

Before coming to help, I would recommend taking a look at the tidyverse style
guide as well a quick skim through of the [R for Data Science book](https://r4ds.had.co.nz/).

-----

## Fixing and updating the website

There are two ways of fixing or adding to the website, either by:

- Creating an [Issue](https://github.com/au-cru/site/issues/new)
describing the problem or enhancement. This is technically not doing anything
yourself, just recommending something to be done.
- Submitting a Pull Request from a clone of this repo. This way takes a bit more
work and requires knowledge of Git and likely HTML. But we would appreciate any
help! No harm in giving it a try! That's a beauty of using Git, it's hard to
mess up and break something.

If you want to view the website before submitting a Pull Request to make sure
your changes are as you expect, you'll need to install blogdown and Hugo.

```r
# install.packages("blogdown")
blogdown::install_hugo()
blogdown::serve_site()
# To stop pre-viewing the site
# blogdown::stop_server()
```

----

## Other Ways to Get Involved

### Helping Out at Our Events

We hold various sessions that incorporate code-alongs, and having the help of
more advanced users to help out the beginners is very much appreciated.

- If you see a session topic that is more beginner than your current level, we
highly encourage you to attend anyway and help answer questions or provide more
one-on-one support during lessons.
- We do a call for helpers for all our other workshops, and we definitely
wouldn't be able to run these without the help of volunteers like you!

### Taking On A Leadership Role

We are still developing this group so if you are interested in taking on a larger
role, please contact us! Best way would be to come to one of our sessions and
talk to us!

-----

**Acknowledgements**:
Much of this contributing guideline came from the [UofTCoders](https://uoftcoders.github.io/studyGroup/CONTRIBUTING)

[tidyverse]: https://www.tidyverse.org/
[branch-explanation]: https://help.github.com/articles/about-branches/
[clone-explanation]: https://help.github.com/articles/cloning-a-repository/
[fork-explanation]: https://help.github.com/articles/fork-a-repo/
[github-flow]: https://guides.github.com/introduction/flow/
[pull-requests]: https://help.github.com/en/articles/about-pull-requests
