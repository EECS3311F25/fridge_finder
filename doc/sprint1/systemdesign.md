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

| **abstract class DatabaseHelper<T>** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Future<Database> initDb() async</li><li>Future _onCreate(Database, int) async</li><li>Future<int> insert(T) async</li><li>Future<List<Map<String, dynamic>>>  queryAll() async</li><li>Future<int> update(T) async</li><li>Future<int> delete(int) async</ul></li> |
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
| **Responsibilities:** | <ul><li>Future<Database> initDb() async</li><li>Future _onCreate(Database, int) async</li><li>Future<int> insert(User) async</li><li>Future<List<Map<String, dynamic>>>  queryAll() async</li><li>Future<int> update(User) async</li><li>Future<int> delete(int) async</ul></li> |
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
| **Responsibilities:** | <ul><li>Future<Database> initDb() async</li><li>Future _onCreate(Database, int) async</li><li>Future<int> insert(Item) async</li><li>Future<List<Map<String, dynamic>>>  queryAll() async</li><li>Future<int> update(Item) async</li><li>Future<int> delete(int) async</ul></li> |
| **Collaborators:** | Item, DatabaseHelper |


---

## **Software Architecture Diagram**


**Diagram (Example):**

