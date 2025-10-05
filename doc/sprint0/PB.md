# Product Backlog - Fridge Finder

## Scope

Mobile app made for and by students, as well as families and anyone who wants to save money and reduce food waste by managing household food supplies, recording products with expiration dates, viewing inventory in real time, receiving reminders before products expire, getting suggestions for basic recipes using what you have on hand, and receiving alerts to avoid duplicate purchases.

## Conventions

User story format: As a. I want. so that. Each story includes clear, testable Satisfaction Criteria.

Priority: Must / Should / Could (ship MVP first).

## Personas

Students and/or families with limited budget and small storage space aming to avoid duplcaites/find simple recepies and avoid expiricy dates.

## User Stories

### PB 1 - Create food item with expiry date - MUST

#### Story

As a user, I want to add a food item with name, quantity, and expiration date so that I can track what I have and when it goes bad.

#### Satisfaction Criteria

- I can enter the name, quantity and expiration date
- If any of these fields are missing, there is a clear massage that the item is not complete
- After creating a new item, the item appears in the inventory with a initial status "Fresh"


### PB 2 View inventory by product status - MUST

#### Story

- As a user, I want to see my inventory in different griups that give a brief description of the product status (Fresh/Expiring Soon/ Expired) this way I can prioritze what products to use first


#### Satisfaction Criteria

- Items grouped by expiration date 
- Within each group, products are sorted by expiration date in which will expire first
- Visual color indicators that tell the status of the products Fresh (Green) Expiring soon (Yellow) Expired (Red)


### PB 3 Edit and delete items - MUST

#### Story

As a user, I wanto to edit and delete products so that I can update and clean up my inventory

#### Satisfaction Criteria

- From the user inventory, I can change name, quantity, date and update/change it on the inventory

- Deleting asks a confirmation and removes it from the Inventory

### PB 4 Expiration Reminders - MUST

#### Story

As a user, I wanto to receive a notification if a product is about to expire so that I dont forget to use it

#### Satisfaction Criteria

- There is a default schedule for when this notification is send (2 days before expiration)
- The user can enable and disable notifications globally or for a specific product

### PB 5 Label products as consumed or discarted - MUST

#### Story

As a user, I want to label procuts as entiher consumed or discared so the inventory can accurately keep track not only of the undiscared food, but of the waste too


#### Satisfaction Criteria

- There is a detail button for each prodcut "Consumed" or "discarted"

- If a item is label as either one of these descriptions, it is removed from the inventory

### PB 6 Duplicate detection on add - MUST

#### Story

As a user, I want to be warned if im adding a item that alreadt exists so that I dont keep on adding reapeated elements

#### Satisfaction Criteria

- While scanning the product, a warning will appear as "item already in fridge, sure to re-add it?"
- I can create a new record or add the existing quantity in the same product

### PB 7 Search and filter - MUST

#### Story

As a user I want to search by name and filter by status so that it is easier to find a specific product

#### Satisfaction Criteria

- The search bar filters the products by name
- Add filters (Status, Category)
- Seach uses filter so find products easier

### PB 8 - Basic recipe Suggestions - MUST

#### Story

As a user I want to see different simple recepies siggestions with the existing items so that I can use the soon to expire products before they go bad


#### Satisfaction Criteria
- View different at least 1 recepie suggestion that include one "expiring soon" item
- Each recepie shows required ingredients and to-by items

### PB 9 Shopping mode: alerts - MUST

#### Story
As a shopper, I want a "shopper mode: that lets me scan items and show if it already existis in inventory so that duplicates are avoided

#### Satisfaction Criteria

- A search field in "Shopping mode" that shows matches from inventory
- If products already existis, see quantity and expiration date
- If not, just add it to my inventory

### PB 10 Initital settings and "how to use" feature - MUST

#### Story

As a NEW user, I want to see a quick guide on how the app words so that I can learn the basics of the app features

#### Satisfaction Criteria

- 3 -4 tutorial screens with a "skip" button

### PB 11 Storage Location - SHOULD

#### Story
As a user, I want to record the storage of location so that I can find my items easier 

#### Satisfaction Criteria

- A locatition field offers with a custom value
- inventory can also be filtered by location

### PB 12 Categories and preservation tips - SHOULD

#### Story

As a user, I want to assign categories and get recommendations on how to preserve my food so that it lasts as long as possible

#### Satisfaction Criteria

- Suggested category list plus the ability to create new ones
- Selecting a category shows a quick preservation tip

### PB 13 Quick Add - SHOULD

#### Story

AS a user, I want to add items quickly using frequent items so that its easier to kick track of my items

#### Satisfaction Criteria

- A "recently added" with the last 10 items added
- I can duplicate a recent item and only change the quantity and date

### PB 14 Dietary preferences  for recipies - SHOULD

#### Story

As a user, I want to apply different dietary preferences so that recepies suggestions are fir for my own diet

#### Satisfaction Criteria

- Add dietary restrictions to user settings
- Suggestions respect preferences or clearly indicate when options are insufficient

### PB 15 Low-stock parameter - SHOULD

#### Story

As a user, I want to set a minimum quantity per item so that the app alerts me when to buy new

#### Satisfaction Criteria

- Add a option "when to by" feture on each item
- When quantity drops below the "when to buy" feature, it is added to the shopping list

### PB 16 - Export Inventory - SHOULD

#### Story

As a user, I want to export my inventory so that I can get a overall view of how I manage the food I byt

#### Satisfaction Criteria

 - A button that exports the inventary and downloads a file with name, quantity, expiration and status.

 ### PB 17 Household sharing - COULD

#### Story
As a roomate/household memeber, I can share my inventory with my famility so that everyone sees the same state

#### Satisfaction Criteria
- I can invite others to see the same fridge
- Changes from any member sync up on the same fridge

### PB 18 Freeze - COULD

#### Story

As a user I want suggestions on what can I freeze so that they wont expire and I can reduce waste

#### Satisfaction Criteria 

- For any "Freezable" item, there is a suggestion that is marked as "freeze suggestion"

- If the item is freezed, then a new expiration date is set

### PB 19 Saving and wate metrics - COULD

#### Story

As a user, I want a simple dashboard of consumed vs discarded so that I understand how much money am I acctually saving

#### Satisfaction Criteria
- Chart that compares the consumed vs the discared items over the past month
- Card that shows a estimate on how much money has being saved

### PB 20 Integrated Shopping List - COULD

#### Story

As a user, I want to create a shopping list that can tell me the missing or low stock items so that its easier for me to remember and keep track of what I buy

#### Satisfaction Criteria

- Items are manually added or added from the low-stock alerts
- In "Shopping Mode" I can mark what items are purchased and optionally added to the inventory


