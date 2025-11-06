# Product Backlog - Fridge Finder

## Scope

Mobile app made for and by students, as well as families and anyone who wants to save money and reduce food waste by managing household food supplies, recording products with expiration dates, viewing inventory in real time, receiving reminders before products expire, getting suggestions for basic recipes using what you have on hand, and receiving alerts to avoid duplicate purchases.

## Conventions

User story format: As a \_\_\_, I want \_\_\_, so that \_\_\_. Each story includes clear, testable satisfaction criteria.

Priority: Must / Should / Could (ship MVP first).

## Personas

Students and/or families with limited budget and small storage space aming to avoid duplicates/find simple recipes and avoid expiry dates.

## User Stories

### PB 1 - Create Food Item (MUST)

#### Story

As a user, I want to add a food item with a name, quantity, and expiration date so that I can track what I have in my fridge

#### Satisfaction Criteria

- I can create a food item with a name, quantity, and expiration date
- I can view the item in the fridge
- I can see the items attributes after creating it


### PB 2 - View Product Status (MUST)

#### Story

As a user, I want to see my inventory in different groups that give a brief description of the product status fresh or expired this way I can prioritize what products to use first


#### Satisfaction Criteria

- Items are categorized by status such as fresh or expired
- I can filter items by when they expire
- Expiration dates are shown on the home page and on the food item description


### PB 3 - Delete Items (MUST)

#### Story

As a user, I want to to delete products so that I can update and clean up my inventory

#### Satisfaction Criteria

- The user can delete items from their fridge

### PB 4 - Expiration Reminders (SHOULD)

#### Story

As a user, I want to receive a notification if a product is about to expire so that I don't forget to use it

#### Satisfaction Criteria

- The user can receive notifications on product statuses such as expiring soon
- The user can enable and disable notifications on the account page

### PB 5 - Change Quantity (MUST)

#### Story

As a user, I want to be able to change the quantity of an item so that whenI buy more or use some, the app will track what I have


#### Satisfaction Criteria

- The user can click a (-) or (+) button to change the quantity of an item
- After a user changes the quantity of an item, this change will reflect across all relevant screens

### PB 6 - Search Items (MUST)

#### Story

As a user I want to search by name and filter by status so that it is easier to find a specific product

#### Satisfaction Criteria

- The search bar allows users to type an item name, and those items will appear below

### PB 7 - Recipe Suggestions (SHOULD)

#### Story

As a user I want to see different recipe suggestions with items in my inventory so that I can use the products I have for new recipes


#### Satisfaction Criteria
- The app will recommend recipes based on the items that are in my fridge
- The recipes will detail what items to use, how much, and further cooking instructions

### PB 8 - Freeze (MUST)

#### Story

As a user I want to be able to mark items as frozen so they don’t expire and I can save them for later

#### Satisfaction Criteria 

- There is a freeze button the user can click to freeze an item
- The freeze button pauses the expiry date until the item is unfrozen

### PB 9 - Duplicate Detection (MUST)

#### Story

As a user, I want to avoid adding duplicate items so that my fridge stays organized

#### Satisfaction Criteria

- When the user adds a new item, if an item already exists with the same name, a pop up will appear informing the user, letting them either continue or cancel
- If the user decides to add a duplicate item, the new item will be named with “Item Name (n)”, and n is the number of duplicates

### PB 10 - Storage Info (SHOULD)

#### Story

As a user, I want to learn how to store an item so that I know how to store it properly

#### Satisfaction Criteria

- Each item will have storage info on their respective page
- The storage info will be specialized per item, detailing where to store it and how long

### PB 11 - Track Added Dates (MUST)

#### Story

As a user, I want to know when I added an item so that I can know the last time I bought it

#### Satisfaction Criteria

- On the item page, I can see when the item was added
- I can filter items on the home screen by how recently they were added

### PB 12 - Filter Items (MUST)

#### Story

As a user, I want to filter items in my fridge so that I can find them easier

#### Satisfaction Criteria

- The user can filter items by product status, and use the search bar in tandem
- As the user changes filters, they update automatically on the home screen
- The default filter is items that expire soon

### PB 13 - Icons (MUST)

#### Story

As a user, I want to select an icon of the item in my fridge so that I can look through my fridge easier instead of reading a bunch of names

#### Satisfaction Criteria

- All items have an icon attribute
- The user can select an icon when creating an item, and that Icon is then shown on the home page and food item page

### PB 14 -  Bookmark Recipes (SHOULD)

#### Story

As a user, I want to bookmark recipes so that I can save them for later

#### Satisfaction Criteria

- There is a bookmark tab on the recipes page
- When the user clicks the bookmark on a recipe, the recipe is then saved in the bookmarked section

### PB 15 - Account Creation (MUST)

#### Story

As a user, I want to be able to create an account so that I can log into my account from any device

#### Satisfaction Criteria

- The user can create an account using an email, username, password
- The user can sign in/out of the account

### PB 16 - Sort and Delete Recipes (SHOULD)

#### Story

As a user, I want to delete recipes from my suggestions so that I can only keep the recipes that I like

#### Satisfaction Criteria

- The user can re-order the recipes in the suggestions list
- The user can delete recipes from the suggestions list

### PB 17 - Scan Items (COULD)

#### Story

As a user, I want to quickly scan items so that I don’t have to manually enter it’s information

#### Satisfaction Criteria

- The user can scan barcodes with their camera to add new food items to their inventory
- The information of the item is automatically filled out after scanning the item

### PB 18 - Share Recipes (COULD)

#### Story

As a user, I want to copy and paste recipes so that I can share them with my peers

#### Satisfaction Criteria

- A copy button allows the user to copy and paste the suggested recipe in a shareable format

### PB 19 - Shopping List (COULD)

#### Story

As a user, I want to create a shopping list so that I can keep track of what I need to purchase

#### Satisfaction Criteria

- There is a shopping list section, which allows the user to add and remove items from the list
- The user can sort the shopping list

### PB 20 - Minimum Quantity of Item (COULD)

#### Story

As a user, I want to set a minimum quantity of an item so that when the item runs low, I know when to buy more

#### Satisfaction Criteria

- For each item, the user can set a minimum quantity
- When the item reaches the minimum quantity, a warning will appear to buy more
