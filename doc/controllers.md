# `lib/controllers` - Documentation

## Table of contents
- `add_item_controller.dart`
- `debug_controller.dart`
- `filter_item_controller.dart`
- `food_item_controller.dart`
- `home_controller.dart`
- `login_controller.dart`
- `recipe_controller.dart`
- `register_controller.dart`


## `lib/controllers/add_item_controller.dart`

### Purpose
- Manage creation of new `Item` objects and persist them to the database; associate newly created items with a specific `Fridge` instance.

### `class AddItemController`
- Public attributes:
  - **`final User user`**: The user who owns the fridge where items are being added.
  - **`final Fridge fridge`**: The fridge that will receive newly created items.
- Public methods:
  - **`Future<Item> createItem({int? fdcId, required String name, required int quantity, required DateTime dateAdded, required DateTime expiryDate, required String imagePath})`**
    - **Purpose:** Create an `Item`, insert it into the database, and add it to the in-memory `fridge.items` list.
    - **Notes:** Uses `Item.createAndInsert(...)` to persist the item and then mutates `fridge.items` so views/controllers that use the fridge instance can see the new item immediately.


## `lib/controllers/debug_controller.dart`

### Purpose
- Provide lightweight database inspection utilities to support debugging and development tasks (e.g., verifying table contents and row counts).

### `class DebugDatabaseController`
- Public methods:
  - **`Future<Map<String, int>> getTableRowCounts()`**
    - **Purpose:** Inspect the database schema and return the row count for each user-defined table.
    - **Notes:** Queries `sqlite_master` for tables, skips internal tables like `sqlite_sequence`, and returns a map of table name → row count.

  - **`Future<List<Map<String, dynamic>>> getAllRows(String tableName)`**
    - **Purpose:** Return all rows for a specified table name as a list of maps (useful for inspection or dumping table contents).
    - **Notes:** Simply performs `db.query(tableName)` and returns the raw result.


## `lib/controllers/filter_item_controller.dart`

### Purpose
- Provide pure functions to filter and sort lists of `Item` objects for use by views and controllers; these helpers keep UI code simple and testable.

### `class FilterItemController`
- Public methods:
  - **`List<Item> filterByName(List<Item> items, String query)`**
    - **Purpose:** Return items whose `name` contains `query` (case-insensitive).
    - **Notes:** Returns the original list if `query` is empty; does not mutate the original elements but returns a new filtered list.

  - **`List<Item> filterByFrozen(List<Item> items, bool frozen)`**
    - **Purpose:** Select items by their `frozen` flag.
    - **Notes:** Useful for toggling UI views between frozen/unfrozen items.

  - **`List<Item> filterByStatus(List<Item> items, ItemStatus status)`**
    - **Purpose:** Filter items by an `ItemStatus` value (e.g., Fresh, NearExpiry, Expired).
    - **Notes:** Assumes `Item.status` exists and is comparable to the provided `status`.

  - **`List<Item> filterByExpiryStatus(List<Item> items)`**
    - **Purpose:** Return items sorted by ascending `expiryDate` (closest expiry first).
    - **Notes:** Sorts the provided list in-place and returns it; callers should clone the list if they need to preserve order.

  - **`List<Item> sortByDateAdded(List<Item> items, {bool ascending = true})`**
    - **Purpose:** Sort items by the `dateAdded` timestamp, ascending or descending.
    - **Notes:** Modifies the list in-place.

  - **`List<Item> sortByExpiryDate(List<Item> items, {bool ascending = true})`**
    - **Purpose:** Sort items by `expiryDate`, ascending or descending.
    - **Notes:** Modifies the list in-place.


## `lib/controllers/food_item_controller.dart`

### Purpose
- Provide actions that operate on a single `Item` instance (quantity changes, deletion, freeze/unfreeze) and persist those changes to the database; intended to be used by item detail views and contextual actions.

### `class FoodItemController`
- Public attributes:
  - **`final User user`**: The current user performing actions.
  - **`final Fridge fridge`**: The fridge holding the item.
  - **`final Item item`**: The item being managed by the controller.
- Public methods:
  - **`Future<void> increaseQuantity(Item item)`**
    - **Purpose:** Increment the `quantity` of the specified item by one and persist the change.
    - **Notes:** Calls `ItemDatabaseHelper.instance.update(item)` after mutating `item.quantity`.

  - **`Future<void> decreaseQuantity(Item item)`**
    - **Purpose:** Decrement the `quantity` (if greater than zero) and persist the change.
    - **Notes:** Prevents negative quantities; updates DB on change.

  - **`Future<void> deleteItem(Item item)`**
    - **Purpose:** Remove the item from persistent storage and from the `fridge.items` list.
    - **Notes:** Calls `ItemDatabaseHelper.instance.delete(item.id!)` and updates the in-memory list.

  - **`Future<void> freezeItem()`**
    - **Purpose:** Mark the item as frozen and update any frozen-specific metadata, then persist.
    - **Notes:** Sets `item.frozen = true`, computes `frozenDifferential` based on `expiryDate - dateAdded`, and updates DB.

  - **`Future<void> unfreezeItem()`**
    - **Purpose:** Unmark the item as frozen and persist the change.
    - **Notes:** Currently toggles the flag and updates DB; expiry-date adjustments are left for future refinement.


## `lib/controllers/home_controller.dart`

### Purpose
- Coordinate home-screen logic such as searching and sorting items shown to the user, and provide lightweight session actions (e.g., logout placeholder).

### `class HomeController`
- Public attributes:
  - **`final User user`**: The signed-in user.
  - **`final Fridge fridge`**: The fridge whose items are displayed on the home screen.
- Public methods:
  - **`List<Item> searchItems(List<Item> items, String query)`**
    - **Purpose:** Return items whose `name` contains `query` (case-insensitive), for use by the home search feature.
    - **Notes:** Trims and lowercases the query before matching; returns a shallow copy of matching items.

  - **`List<Item> sortItemsByDateAdded(List<Item> items)`**
    - **Purpose:** Sort items by `dateAdded` to present newest/oldest items.
    - **Notes:** Mutates the list in-place and returns it.

  - **`List<Item> sortItemsByExpiryDate(List<Item> items)`**
    - **Purpose:** Sort items by `expiryDate` to highlight soon-to-expire items.
    - **Notes:** Mutates the list in-place and returns it.

  - **`void logout()`**
    - **Purpose:** Clear local session state when the user logs out.
    - **Notes:** Implementation is a placeholder; view/navigation code is expected to handle actual routing.


## `lib/controllers/login_controller.dart`

### Purpose
- Authenticate users against the local SQLite database and manage an in-memory representation of the current session (the `_currentUser`).

### `class LoginController`
- Public attributes / accessors:
  - **`User? get currentUser`**: The currently authenticated user, or `null` if not authenticated.
  - **`bool get isLoggedIn`**: Convenience getter that returns whether a user is authenticated.
- Public methods:
  - **`Future<User> login(String username, String password)`**
    - **Purpose:** Authenticate provided credentials by querying the `user` table and set the `_currentUser` on success.
    - **Notes:** Validates non-empty username/password, queries for a matching row, throws an exception for invalid credentials, and returns the `User` instance when successful.

  - **`void logout()`**
    - **Purpose:** Clear the in-memory authentication state.
    - **Notes:** Sets `_currentUser` to `null`.


## `lib/controllers/recipe_controller.dart`

### Purpose
- Provide a simple in-memory catalog of recipes, support favorites, and supply filtering operations used by recipe-related UI (no persistent storage in current implementation).

### `class RecipeController`
- Notes:
  - Implemented as a singleton via `RecipeController._internal()` and `factory RecipeController()` to centralize recipe state.
  - Maintains an internal list of `Recipe` instances and a set of favorite recipe names.
- Public attributes / accessors:
  - **`List<Recipe> getRecipes()`**: Return a shallow copy of all known recipes.
  - **`List<Recipe> getFavorites()`**: Return recipes currently marked as favorites.
- Public methods:
  - **`bool isFavorite(Recipe recipe)`**
    - **Purpose:** Return whether the given recipe is in the favorites set.
    - **Notes:** Uses `_favoriteRecipeNames` (by recipe name) as the backing store.

  - **`void toggleFavorite(Recipe recipe)`**
    - **Purpose:** Toggle the favorite status of the given recipe.
    - **Notes:** Adds the name to the set when favoriting, removes when unfavoriting.

  - **`List<Recipe> filterRecipes({String? difficulty, int? maxPrepTime, bool onlyFavorites = false})`**
    - **Purpose:** Return recipes matching the provided criteria: difficulty, maximum prep time, and favorites-only filter.
    - **Notes:** Filters are applied in sequence and are case-insensitive for difficulty.


## `lib/controllers/register_controller.dart`

### Purpose
- Handle user registration by validating inputs and creating new `User` records in the local database.

### `class RegisterController`
- Public methods:
  - **`Future<User> createUser(String username, String password)`**
    - **Purpose:** Validate the provided username/password and create a new `User` persisted to the database.
    - **Notes:** Current implementation treats `username` as the user's email for the `email` field; throws an exception for empty inputs and returns the newly created `User`.
