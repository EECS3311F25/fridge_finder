# `lib/views` - Documentation

## Table of contents
- `add_item_view.dart`
- `debug_view.dart`
- `food_item_view.dart`
- `home_view.dart`
- `login_view.dart`
- `recipe_page_view.dart`
- `recipe_view.dart`
- `register_view.dart`


## `lib/views/add_item_view.dart`

### Purpose
- Provide a full-screen form UI that collects item information (name, icon, expiry date, quantity) and calls `AddItemController.createItem(...)` to persist and return the created `Item`.

### `class AddItemView` (StatefulWidget)
- Public constructor:
  - **`const AddItemView({Key? key, required AddItemController controller})`**: Requires an `AddItemController` to perform item creation.
- Behavior / callbacks:
  - Presents UI components for name input, icon selection (modal bottom sheet), expiry date picker, and quantity controls.
  - On **Add** button press: calls `controller.createItem(...)` with collected values and `Navigator.pop(context, newItem)` to return the created `Item` to the caller.
  - Notes: Validates/normalizes inputs minimally (trims name, defaults expiry to 7 days if not chosen).


## `lib/views/debug_view.dart`

### Purpose
- UI for inspecting low-level database information; lists table row counts and allows viewing raw rows for any table.

### `class DebugView` (StatelessWidget)
- Behavior:
  - Instantiates `DebugDatabaseController` and uses `FutureBuilder` to show `getTableRowCounts()` results.
  - Displays each table as a `ListTile` with name and row count; tapping a tile fetches and displays raw rows via `getAllRows(...)` in a modal dialog.


## `lib/views/food_item_view.dart`

### Purpose
- Item detail view that displays an `Item`'s properties (name, status badge, quantities, added/expires dates, storage info) and provides actions (increase/decrease quantity, freeze/unfreeze, delete).

### `class FoodItemView` (StatefulWidget)
- Public constructor:
  - **`const FoodItemView({Key? key, required Item item, required Function(Item) onDelete, required Function() onReturn, required FoodItemController controller})`**
    - **`item`**: Item to display
    - **`onDelete`**: Callback invoked after successful deletion
    - **`onReturn`**: Callback invoked when navigating back
    - **`controller`**: `FoodItemController` performing item operations
- Behavior / callbacks:
  - UI exposes quantity controls that call `controller.increaseQuantity(...)` and `controller.decreaseQuantity(...)`.
  - Delete button calls `controller.deleteItem(...)`, then invokes `onDelete(item)` and pops the view.
  - Freeze/Unfreeze button toggles via `controller.freezeItem()` / `controller.unfreezeItem()` and refreshes UI.
  - Private helpers `_getStatusColor` and `_getStatusText` map `ItemStatus` to UI text/color.


## `lib/views/home_view.dart`

### Purpose
- Primary app home UI showing a searchable, filterable grid of `Item` cards and navigation actions (add item, open recipes, open an item detail).

### `class HomeWrapper` (StatefulWidget)
- Purpose: Thin stateful wrapper that owns `HomeController`, search/filter state, and passes filtered results to `HomeView`.
- Behavior:
  - Maintains `_filteredItems`, `_searchQuery`, and `_currentFilter`.
  - Listens to a `TextEditingController` to update search results and applies sorting/filtering via `FilterItemController` and `HomeController` methods.

### `class HomeView` (StatelessWidget)
- Public constructor fields:
  - **`List<Item> items`**: Items to display
  - **`Function(Item) onAddItem`**, **`Function(Item) onDeleteItem`**, **`Function() onBackToHomeView`**: Callbacks for parent
  - **`TextEditingController searchController`**: Search input controller
  - **`HomeController homeController`**: Business logic provider for searches and session
  - **`Function(String?) onFilterChanged`**, **`String currentFilter`**: Filter controls
- Behavior / UI:
  - Header contains account button that shows logout dialog and navigates to `LoginView` on confirmation.
  - Search bar wired to `searchController` (state owned by `HomeWrapper`).
  - Filter dropdown controls which sorting/filtering is applied.
  - Grid view renders item cards; tapping a card navigates to `FoodItemView` with a `FoodItemController` created from the `homeController`'s user & fridge and the tapped item.
  - Floating action buttons: recipe button opens `RecipePageView`; add button opens `AddItemView` and returns newly created `Item` to `onAddItem`.


## `lib/views/login_view.dart`

### Purpose
- Login screen UI for user authentication; collects username and password, calls `LoginController.login(...)`, and navigates to the home screen on success.

### `class LoginView` (StatelessWidget)
- Behavior / UI:
  - Provides text fields for username and password and a `Sign in` button.
  - `Sign in` handler shows a loading dialog, uses `LoginController.login(...)`, then ensures the user has a `Fridge` (create if missing) and navigates to `HomeWrapper` with a `HomeController`.
  - App bar action (bug icon) opens a debug dialog listing all users by querying `UserDatabaseHelper.instance.queryAll()` — useful for development.
  - Link to `RegisterView` via navigation.


## `lib/views/recipe_page_view.dart`

### Purpose
- Display a list of recipes with filtering controls (difficulty, max prep time, favorites) and navigation into each recipe's detail view.

### `class RecipePageView` (StatefulWidget)
- Behavior:
  - Uses `RecipeController` singleton to fetch recipes and favorites.
  - Maintains `_selectedDifficulty`, `_maxPrepTime`, and `_showFavoritesOnly` filter state.
  - `_applyFilters()` updates `_filteredRecipes` by calling `RecipeController.filterRecipes(...)`.
  - Recipe list uses `_buildRecipeContainer(...)` to render tappable recipe tiles that navigate to `RecipeView`.


## `lib/views/recipe_view.dart`

### Purpose
- Show full details for a single `Recipe` (image, description, prep time, difficulty) and allow toggling favorite status.

### `class RecipeView` (StatefulWidget)
- Public constructor:
  - **`const RecipeView({Key? key, required Recipe recipe})`**
- Behavior:
  - Reads favorite status from `RecipeController` and renders a star action button to toggle favorite via `_controller.toggleFavorite(recipe)`.
  - Displays large image, description text, and info row with prep time and difficulty.


## `lib/views/register_view.dart`

### Purpose
- Registration UI that collects username and password, calls `RegisterController.createUser(...)` to create a new user, creates a `Fridge` for them, and navigates to the home screen.

### `class RegisterView` (StatelessWidget)
- Behavior / UI:
  - Provides username and password inputs and a `Sign up` button.
  - On sign-up: shows a loading dialog, calls `RegisterController.createUser(...)`, creates a `Fridge` via `Fridge.createAndInsert(newUser)`, then navigates to `HomeWrapper` with a new `HomeController`.
  - Links back to `LoginView` for existing users.
