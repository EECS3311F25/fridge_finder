Frontend Documentation
======================

Overview
--------
This document provides an overview of the main frontend components of the application.
Each file plays a specific role in how the app displays, updates, and manages user data in real time.

main.dart
----------
This is the **entry point** of the application.  
When the app runs, it executes the code in this file first.

It connects all the main parts of the app into a single screen display.  
To ensure that every page updates dynamically, it uses a **Home Wrapper**, which functions as a **stateful widget**.  
This structure allows the app to update each page in **real time**, reflecting changes instantly on the user interface.

home_view.dart
---------------
This file defines the **Home Page** of the application.  
It represents the user’s **inventory**, where items can be **added** or **removed**.

Because of its central role, the home view is connected to the other two views of the application — 
it communicates with both the *Add Item View* and the *Food Item View* to keep the inventory synchronized and up to date.

add_item_view.dart
------------------
This file defines the **interactive page** where users can **add a new item** to their inventory.

The page includes various input parameters such as:
- *Expiry Date*
- *Food Name*
- *Quantity* 

All these parameters are required to create a new **Item** object, which is then stored in the user’s inventory.

food_item_view.dart
-------------------
This file defines the **user interface** that displays detailed information about each item in the inventory.

It retrieves all the fields from the *Item* object, including:
- *Name*
- *Quantity*
- *Date Added*
- *Expiry Date*

Each item is displayed with its relevant data, and the view also includes a **Remove** button that allows the user to delete the item from their inventory.

Summary
-------
Together, these files define the structure, interactivity, and real-time behavior of the frontend.  
They ensure that users can seamlessly manage their inventory items within a responsive interface.
