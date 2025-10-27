# **System Design**

## **Cover Page**

**Project Title:** Fridge Finder
**Course:** EECS 3311 – Software Design
**Instructor:** Ilir Dema
**Team Members:**
- Ignacio Doria Oberman
- Noah Skinner
- Darren Drew
- Matthew Azuero

**Date:** October 2025

---

## **CRC Cards**

### **Model Classes**:

| **abstract class DatabaseHelper<T>** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Future<Database> initDb() async</li><li>Future _onCreate(Database, int) async</li><li>Future<int> insert(T) async</li><li>Future<List<Map<String, dynamic>>> queryAll() async</li><li>Future<int> update(T) async</li><li>Future<int> delete(int) async</ul></li> |
| **Collaborators:** | none |

| **class User** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Map<String, dynamic> toMap()</li><li>factory fromMap(Map<String, dynamic>)</ul></li> |
| **Collaborators:** | none |

| **class UserDatabaseHelper implements DatabaseHelper\<User>** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Future<Database> initDb() async</li><li>Future _onCreate(Database, int) async</li><li>Future<int> insert(User) async</li><li>Future<List<Map<String, dynamic>>> queryAll() async</li><li>Future<int> update(User) async</li><li>Future<int> delete(int) async</ul></li> |
| **Collaborators:** | User, DatabaseHelper |

| **class Fridge** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Map<String, dynamic> toMap()</li><li>factory fromMap(Map<String, dynamic>)</ul></li> |
| **Collaborators:** | User |

| **class FridgeDatabaseHelper implements DatabaseHelper\<Fridge>** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Future<Database> initDb() async</li><li>Future _onCreate(Database, int) async</li><li>Future<int> insert(Fridge) async</li><li>Future<List<Map<String, dynamic>>>  queryAll() async</li><li>Future<int> update(Fridge) async</li><li>Future<int> delete(int) async</ul></li> |
| **Collaborators:** | Fridge, DatabaseHelper |

| **class Item** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Map<String, dynamic> toMap()</li><li>factory fromMap(Map<String, dynamic>)</li></ul> |
| **Collaborators:** | Fridge |

| **class ItemDatabaseHelper implements DatabaseHelper\<Item>** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Future<Database> initDb() async</li><li>Future _onCreate(Database, int) async</li><li>Future<int> insert(Item) async</li><li>Future<List<Map<String, dynamic>>> queryAll() async</li><li>Future<int> update(Item) async</li><li>Future<int> delete(int) async</ul></li> |
| **Collaborators:** | Item, DatabaseHelper |

### Controller Classes:

| **class HomeController** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul></li>void createItem()</li><li>void deleteItem(Item)</li><li>List\<Item> searchItems(String)</li></ul> |
| **Collaborators:** | User, Fridge, Item |

| **class LoginController** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>User login(String, String)</li><li>void createUser(String, String)</li></ul> |
| **Collaborators:** | User, Fridge, Item |

### View Classes:

| **class HomeView** |  |
|------------------|--|
| **Parent Class:** | StatefulWidget |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul></li>State<HomeView> createState()</li></ul> |
| **Collaborators:** | none |

| **class _HomeViewState** |  |
|------------------|--|
| **Parent Class:** | State<HomeView> |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Widget build(BuildContext)</ul></li> |
| **Collaborators:** | HomeView |

| **class LoginView** |  |
|------------------|--|
| **Parent Class:** | StatefulWidget |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul></li>State<LoginView> createState()</li></ul> |
| **Collaborators:** | none |

| **class _LoginViewState** |  |
|------------------|--|
| **Parent Class:** | State<LoginView> |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Widget build(BuildContext)</ul></li> |
| **Collaborators:** | LoginView |

| **class CreateFoodView** |  |
|------------------|--|
| **Parent Class:** | StatefulWidget |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul></li>State<CreateFoodView> createState()</li></ul> |
| **Collaborators:** | none |

| **class _CreateFoodViewState** |  |
|------------------|--|
| **Parent Class:** | State<CreateFoodView> |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Widget build(BuildContext)</ul></li> |
| **Collaborators:** | CreateFoodView |


---

## **Software Architecture Diagram**


**Diagram (Example):**

