03/11/2025 - Sprint 1 Standup 3

1. **What did you work on since the last standup?:** Since the last standup I fixed some issues with the backend logic. Now the database should be instantiating properly and adding all the correct tables.
2. **What do you commit to next?:** Next I need to clean up the project so that the backend is properly interacting with the frontend. At the moment we have no persistence.
3. **When do you think you'll be done?:** Hopefully within about 3 days.
4. **Do you have any blockers?:** It's very difficult to manage asynchronous functions. The DB methods need to be async, but then any method that interacts with them needs to be async, but then any method that interacts with *those* needs to be async...