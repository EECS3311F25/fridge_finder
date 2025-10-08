# Process Document (Sprint 0)

## Team Organization

Throughout sprint 0 our primary tool and method of communication was Discord. Beyond that, we created a product backlog on Trello. The project was setup on VS Code, as it is the recommended editor for creating cross-platform Flutter applications. Since sprint 0 was primarily pre-emptive organization, rather than technical implementation, not many other tools were needed.

Group members were not assigned strict roles, but rather tasks were delegated as part of a group consensus as to what each member could manage throughout the sprint. The tasks were delegated as follows:
- Nacho: team.md, summary.md, competition.md
- Matt: README.md, PB.md
- Darren: personas.pdf, ui/ux artifact
- Noah: done.md, process.md, project setup (and relevant section of README.md)

## Decision-Making

We made all our decisions using a group-consensus process, wherein we deliberated until reaching a conclusion that we all found to be satisfactory. We did not reach any deadlock scenarios, but we decided that in the event of a deadlock, we would resort to a majority vote. No disagreements or disputes occurred throughout sprint 0.

## Prioritizing User Stories

User stories were prioritized based on a number of criteria, notably how fundamental we determine a feature to be within our app, counterbalanced by its difficulty of implementation. For example, we determined a quick add feature to be a **should**, since it's easy to implement, but doesn't separate our project from existing apps. Similarly, applying dietary restrictions to recipe suggestions is a **could**, since it's both difficult to implement and isn't necessary to create the minimum viable product. Our prioritization philosophy is to focus on small, easily-implementable tasks that provide large value to the user by carrying out fundamental tasks.

## Meetings

We agreed to meet at least twice per week on Discord, as well as briefly after each EECS3311 lecture. During each meeting we discussed our progress on the tasks at hand, and laid out clear next steps. At the beginning of each sprint we intend to meet to assign point values to each product backlog item, and then delegate them to each team member according to their ability.

## Technical Implementation

During this sprint, the only technical implementation conducted was the project setup. It was done on VS Code using Flutter 3.35.5, which is the latest stable release. Android Studio was a necessary tool to download and install relevant dependencies, which include:
- Android 16.0 (API level 36.0)
- Android SDK Build-Tools
- Android SDK Command-line Tools (latest)
- Andorid SDK PLatform-Tools (36.0.0)
- Android Emulator (36.1.9)

After the installation of the Android SDK, it was necessary to point Flutter to the location of the SDK. Then, an empty Flutter project was created.

## Next Phase

- We must meet more frequently in order to clear up any confusion that may arise on any given day. Simple 10-minute standups would suffice.
- When more technical sprints roll around we will likely have to assign roles (ie. backend developer, UI developer, etc.). We also need a more concrete framework within which we divvy up the tasks for a given sprint.
- We further solidify the structure of our meetings
- We develop a strategy for facilitating implementation using things like CRC cards