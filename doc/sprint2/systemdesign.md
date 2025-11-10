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

**Date:** November 2025

---

## **CRC Cards**

**Note:** For existing classes, only changes to those classes will be listed here. Methods that already existed and continue to exist will not be listed.

### **Model Classes**:

| **abstract class DatabaseHelper<T>** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Future _oncreate(Database, int)</li></ul> |
| **Collaborators:** | none |

| **class User** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>User create({int?, String?, String?, String?})</li><li>static Future<User> createAndInsert(String, String, String)</li></ul> |
| **Collaborators:** | none |

| **class UserDatabaseHelper implements DatabaseHelper\<User>** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>static Future<Map<String, dynamic>> query(int)</li></ul> |
| **Collaborators:** | User, DatabaseHelper |

| **class Fridge** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Fridge create({int?, User?, List<Item>?})</li><li>static Future<Fridge> createAndInsert(User)</li><li>static Future<Fridge> getFromDb(int)</li><li>static Future<Fridge> fromMap(Map<String, dynamic>)</li></ul> |
| **Collaborators:** | User, Item |

| **class FridgeDatabaseHelper implements DatabaseHelper\<Fridge>** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>static Future<Map<String, dynamic>> query(int)</li></ul> |
| **Collaborators:** | Fridge, DatabaseHelper |

| **class Item** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Item create({int?, int?, String?, int?, DateTime?, DateTime?, Fridge?, Image?})</li><li>static Future<Item> createAndInsert(int?, String, int, DateTime, DateTime, Fridge, Image?)</li><li>static Future<Item> fromMap(Map<String, dynamic>)</li></ul> |
| **Collaborators:** | Fridge |

| **class ItemDatabaseHelper implements DatabaseHelper\<Item>** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>static Future<Map<String, dynamic>> query(int)</li><li>static Future<List<Map<String, dynamic>>> queryByFridge(int)</li></ul> |
| **Collaborators:** | Item, DatabaseHelper |

### Controller Classes:

| **class HomeController** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>List<Item> searchItems(List<Item>, String)</li><li>int getItemStatus(Item)</li></ul> |
| **Collaborators:** | User, Fridge, Item |

| **class LoginController** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Future<User> login(String, String)</li><li>void logout()</li><li>Future<User> createUser(String, String)</li></ul> |
| **Collaborators:** | User, Fridge, Item |

| **class CreateItemController** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Future<Item> createItem({int?, required String, required int, required DateTime, required DateTime, required Fridge, Image?})</li></ul> |
| **Collaborators:** | User, Fridge, Item |

| **class FoodItemController** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>void deleteItem()</li><li>void freezeItem()</li><li>int updateQuantity(int)</li></ul> |
| **Collaborators:** | Item |

| **class RecipePageController** |  |
|------------------|--|
| **Parent Class:** | n/a |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>List<String> searchRecipes(String)</li></ul> |
| **Collaborators:** | none |

### View Classes:

| **class LoginView** |  |
|------------------|--|
| **Parent Class:** | StatefulWidget |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul></li>State<LoginView> createState()</li></ul> |
| **Collaborators:** | LoginController |

| **class _LoginViewState** |  |
|------------------|--|
| **Parent Class:** | State<LoginView> |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Widget build(BuildContext)</ul></li> |
| **Collaborators:** | LoginView |

| **class RecipePageView** |  |
|------------------|--|
| **Parent Class:** | StatefulWidget |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul></li>State<RecipePageView> createState()</li></ul> |
| **Collaborators:** | RecipePageController |

| **class _RecipePageViewState** |  |
|------------------|--|
| **Parent Class:** | State<RecipePageView> |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul><li>Widget build(BuildContext)</ul></li> |
| **Collaborators:** | RecipePageView |

| **class RecipeView** |  |
|------------------|--|
| **Parent Class:** | StatelessWidget |
| **Subclasses:** | n/a |
| **Responsibilities:** | <ul></li>Widget build(BuildContext)</li></ul> |
| **Collaborators:** | none |


---

## **Software Architecture Diagram**
**Diagram:**
![Fridge Finder MVC Architecture](./mvc.png)

**Reference Link** : https://developer.mozilla.org/en-US/docs/Glossary/MVC


