# `lib/models` - Documentation

## Table of contents
- `databasehelper.dart`
    - `abstract class DatabaseHelper<T>`
        - `initDb()`
        - `insert(T)`
        - `queryAll()`
        - `update(T)`
        - `delete(int)`
- `user.dart`
    - `class User`
        - `toMap()`
        - `fromMap(Map<String, dynamic>)`
    - `class UserDatabaseHelper extends DatabaseHelper<User>`
        - `insert(User)`
        - `queryAll()`
        - `update(User)`
        - `delete(int)`
- `fridge.dart`
    - `class Fridge`
        - `toMap()`
        - `fromMap(Map<String, dynamic>)`
    - `class FridgeDatabaseHelper extends DatabaseHelper<Fridge>`
        - `insert(Fridge)`
        - `queryAll()`
        - `update(Fridge)`
        - `delete(int)`
- `item.dart`
    - `class Item`
        - `toMap()`
        - `fromMap(Map<String, dynamic>)`
    - `class ItemDatabaseHelper extends DatabaseHelper<Item>`
        - `insert(Item)`
        - `queryAll()`
        - `update(Item)`
        - `delete(int)`



## `lib/models/databasehelper.dart`

### Purpose
Database helpers exist in this project's model files to provide methods that facilitate database operations for a given object. This file defines an abstract class to serve as a blueprint for the DB helpers, as well as to implement some common operations.

### `abstract class DatabaseHelper<T>`
- Public methods:
    - `initDb() => Future<Database>`
        - Purpose: Initialises, opens, and returns the database
        - Returns (`Future<Database>`): Instance of the database
        - Example:
            ```dart
            // defines a getter that returns the db
            Future<Database> get db async {
                _database ??= await initDb();
                return _database!;
            }
            ```
        - Notes:
            - Must be async due to call to async sqflite library methods
            - Gets database from system default DB location
        - TODO:
            - No known issues
    - `insert(T t) => Future<int>`
        - Purpose: Not implemented, but defines the need for a *create* operation in a DB helper
        - Params:
            - `T t`: Object to be inserted to the database
        - Returns (`Future<int>`): ID of the inserted row
    - `queryAll() => Future<List<Map<String, dynamic>>>`
        - Purpose: Not implemented, but defines the need for a *read* operation in a DB helper
        - Returns (`Future<List<Map<String, dynamic>>>`): List of all objects in DB, represented as maps
    - `update(T t) => Future<int>`
        - Purpose: Not implemented, but defines the need for an *update* operation in a DB helper
        - Params:
            - `T t`: Object to be updated
        - Returns (`Future<int>`): Number of changes made
    - `delete(int id) => Future<int>`
        - Purpose: Not implemented, but defines the need for a *delete* operation in a DB helper
        - Params:
            - `int id`: ID of the object to be deleted
        - Returns (`Future<int>`): Number of rows affected by deletion



## `lib/models/user.dart`

### Purpose
Devices come and go, but data needs to persist. The `User` object establishes a set of common attributes that allow a user to login and track their fridge on multiple devices.

### `class User`
- Public attributes:
    - `final int? id`: User's ID value
    - `final String username`: User's username
    - `final String email`: User's email
    - `final String password`: User's password
- Public methods:
    - `toMap() => Map<String, dynamic>`
        - Purpose: Represents the current User's account information as a map
        - Returns (`Map<String, dynamic>`): Map containing the User's id, username, email, and password
        - Example:
            ```dart
            // method to store user's info in a .json file
            void storeInJson(User u) {
                uMap = u.toMap();
                // store to .json file
            }
            ```
        - TODO:
            - No known issues
    - `fromMap(Map<String, dynamic> map) => User`
        - Purpose: Constructs a User object from a supplied map
        - Params:
            - `Map<String, dynamic> map`: Map representing a User object
        - Returns (`User`): New User object
        - Example:
            ```dart
            // method to get all users from the db
            Future<List<User>> getAllUsers() async {
                final db = await _dbHelper.db;
                final users = await db.query('user');
                return users.map((u) => User.fromMap(u)).toList();
            }
            ```
        - TODO:
            - No known issues

### `class UserDatabaseHelper extends DatabaseHelper<User>`
- Public attributes:
    - `static final UserDatabaseHelper instance`: Instance of the DB helper
- Public methods:
    - `insert(User user) => Future<int>`
        - Purpose: Implementation of the *create* operation for a User in the DB, as defined in `DatabaseHelper<T>`
        - TODO:
            - No known issues
    - `queryall() => Future<List<Map<String, dynamic>>>`
        - Purpose: Implementation of the *read* operation for a User in the DB, as defined in `DatabaseHelper<T>`
        - TODO:
            - No known issues
    - `update(User user) => Future<int>`
        - Purpose: Implementation of the *update* operation for a User in the DB, as defined in `DatabaseHelper<T>`
        - TODO:
            - No known issues
    - `delete(int id) => Future<int>`
        - Purpose: Implementation of the *delete* operation for a User in the DB, as defined in `DatabaseHelper<T>`
        - TODO:
            - No known issues



## `lib/models/fridge.dart`

### Purpose
The core object of our application, the Fridge defines the container in which the user stores their food items.

### `class Fridge`
- Public attributes:
    - `final int? id`: Fridge's ID value
    - `final User user`: User to which the Fridge belongs
    - `final List<Item> items`: The items contained within the Fridge
- Public methods:
    - `toMap() => Map<String, dynamic>`
        - Purpose: Represents the current Fridge's information as a map
        - Returns (`Map<String, dynamic>`): Map containing the Fridge's id, user, and items
        - Example: *See `user.dart`*
        - TODO:
            - No known issues
    - `fromMap(Map<String, dynamic> map) => Fridge`
        - Purpose: Constructs a Fridge object from a supplied map
        - Params:
            - `Map<String, dynamic> map`: Map representing a Fridge object
        - Returns (`Fridge`): New Fridge object
        - Example: *See `user.dart`*
        - TODO:
            - No known issues

### `class FridgeDatabaseHelper extends DatabaseHelper<Fridge>`
- Public attributes:
    - `static final FridgeDatabaseHelper instance`: Instance of the DB helper
- Public methods:
    - `insert(Fridge fridge) => Future<int>`
        - Purpose: Implementation of the *create* operation for a Fridge in the DB, as defined in `DatabaseHelper<T>`
        - TODO:
            - No known issues
    - `queryall() => Future<List<Map<String, dynamic>>>`
        - Purpose: Implementation of the *read* operation for a Fridge in the DB, as defined in `DatabaseHelper<T>`
        - TODO:
            - No known issues
    - `update(Fridge fridge) => Future<int>`
        - Purpose: Implementation of the *update* operation for a Fridge in the DB, as defined in `DatabaseHelper<T>`
        - TODO:
            - No known issues
    - `delete(int id) => Future<int>`
        - Purpose: Implementation of the *delete* operation for a Fridge in the DB, as defined in `DatabaseHelper<T>`
        - TODO:
            - No known issues



## `lib/models/item.dart`

### Purpose
The Item class defines the object that represents a food item in a user's fridge.

### `class Item`
- Public attributes:
    - `final int? id`: Item's ID value
    - `final int? fdcId`: ID of the FDC API object to which this food item corresponds
        - For later implementation
    - `String name`: Item's name
    - `int quantity`: Quantity of given Item in user's fridge
    - `final DateTime dateAdded`: Date the Item was added to user's fridge
    - `final DateTime expiryDate`: Date the Item will expire
    - `final Image? imageIcon`: Icon for the Item
- Public methods:
    - `toMap() => Map<String, dynamic>`
        - Purpose: Represents the current Item's information as a map
        - Returns (`Map<String, dynamic>`): Map containing the Item's ID, FDC ID, name, quantity, date added, expiry date, and icon
        - Example: *See `user.dart`*
        - TODO:
            - Currently attemps to pass Dart Image to database, which won't work
    - `fromMap(Map<String, dynamic> map) => Item`
        - Purpose: Constructs an Item object from a supplied map
        - Params:
            - `Map<String, dynamic> map`: Map representing an Item object
        - Returns (`Item`): New item object
        - Example: *See `user.dart`*
        - TODO:
            - No known issues

### `class ItemDatabaseHelper extends DatabaseHelper<Item>`
- Public attributes:
    - `static final ItemDatabaseHelper instance`: Instance of the DB helper
- Public methods:
    - `insert(Item item) => Future<int>`
        - Purpose: Implementation of the *create* operation for an Item in the DB, as defined in `DatabaseHelper<T>`
        - TODO:
            - No known issues
    - `queryall() => Future<List<Map<String, dynamic>>>`
        - Purpose: Implementation of the *read* operation for an Item in the DB, as defined in `DatabaseHelper<T>`
        - TODO:
            - No known issues
    - `update(Item item) => Future<int>`
        - Purpose: Implementation of the *update* operation for an Item in the DB, as defined in `DatabaseHelper<T>`
        - TODO:
            - No known issues
    - `delete(int id) => Future<int>`
        - Purpose: Implementation of the *delete* operation for an Item in the DB, as defined in `DatabaseHelper<T>`
        - TODO:
            - No known issues