# Product Backlog - Fridge Finder

## Scope

Mobile app made for and by students, as well as families and anyone who wants to save money and reduce food waste by managing household food supplies, recording products with expiration dates, viewing inventory in real time, receiving reminders before products expire, getting suggestions for basic recipes using what you have on hand, and receiving alerts to avoid duplicate purchases.

## Conventions

User story format: As a \_\_\_, I want \_\_\_, so that \_\_\_. Each story includes clear, testable satisfaction criteria.

Priority: Must / Should / Could (ship MVP first).

## Personas

Students and/or families with limited budget and small storage space aming to avoid duplicates/find simple recipes and avoid expiry dates.

## User Stories

### PB 1 - Create food item with expiry date (MUST)

#### Story

As a user, I want to add a food item with a name, quantity, and expiration date so that I can track what I have and when it goes bad.

#### Satisfaction Criteria

- I can enter the name, quantity and expiration date
- If any of these fields are missing, there is a clear massage that the item is not complete
- After creating a new item, the item appears in the inventory with a initial status "Fresh"


### PB 2 - View inventory by product status (MUST)

#### Story

As a user, I want to see my inventory in different groups that give a brief description of the product status (Fresh/Expiring Soon/Expired) this way I can prioritize what products to use first


#### Satisfaction Criteria

- Items grouped by expiration date 
- Within each group, products are sorted by expiration date in which will expire first
- Visual color indicators that tell the status of the products Fresh (Green), Expiring soon (Yellow), Expired (Red)


### PB 3 - Delete items (MUST)

#### Story

As a user, I want to to delete products so that I can update and clean up my inventory

#### Satisfaction Criteria

- Deleting asks a confirmation and removes it from the Inventory

### PB 4 - Expiration Reminders (MUST)

#### Story

As a user, I wanto to receive a notification if a product is about to expire so that I dont forget to use it

#### Satisfaction Criteria

- There is a default schedule for when this notification is send (ie. 3 days before expiration)
- The user can enable and disable notifications globally

### PB 5 - Label products as consumed or discarded (MUST)

#### Story

As a user, I want to label products as either consumed or discarded so the inventory can accurately keep track not only of the undiscared food, but of the waste too


#### Satisfaction Criteria

- There is a button for each product to label it as "consumed" or "discarded"

- If a item is labelled as either one of these descriptions, it is removed from the inventory

### PB 6 - Search and filter (MUST)

#### Story

As a user I want to search by name and filter by status so that it is easier to find a specific product

#### Satisfaction Criteria

- The search bar filters the products by name
- Add filters (status, category)
- Seach uses filter so products can be found easier

### PB 7 - Basic Recipe Suggestions (MUST)

#### Story

As a user I want to see different simple recipe suggestions with items in my inventory so that I can use the soon-to-expire products before they go bad


#### Satisfaction Criteria
- View different (at least 1) recipe suggestions that include one "expiring soon" item
- Each recipe shows required ingredients and "to-buy" items

### PB 8 - Freeze (MUST)

#### Story

As a user I want suggestions on what items I can freeze so that they wont expire and I can reduce waste

#### Satisfaction Criteria 

- For any "freezable" item, there is a suggestion that is marked as "freeze suggestion"
- If the item is freezed, then a new expiration date is set

### PB 9 - Duplicate detection on add (SHOULD)

#### Story

As a user, I want to be warned if I am adding a item that already exists so that I don't keep on adding repeated elements

#### Satisfaction Criteria

- While scanning the product, a warning will appear. Ie. "That item is already in your fridge, are you sure you want to re-add it?"
- I can create a new record or add the existing quantity in the same product

### PB 10 - Initital settings and "how to use" feature (SHOULD)

#### Story

As a new user, I want to see a quick guide on how the app words so that I can learn the basics of the app features

#### Satisfaction Criteria

- 3-4 tutorial screens with a "skip" button

### PB 11 - Storage Location (SHOULD)

#### Story

As a user, I want to record the storage location  of my items so that I can find them easier

#### Satisfaction Criteria

- A location field is offered with a custom value
- Inventory can also be filtered by location

### PB 12 - Categories and preservation tips (SHOULD)

#### Story

As a user, I want to assign categories and get recommendations on how to preserve my food so that it lasts as long as possible

#### Satisfaction Criteria

- Suggested category list plus the ability to create new ones
- Selecting a category shows a quick preservation tip

### PB 13 - Quick Add (SHOULD)

#### Story

As a user, I want to add items quickly using frequent items so that its easier to keep track of my items

#### Satisfaction Criteria

- Implement a "recently added" list with the last 10 items added
- I can duplicate a recent item and only change the quantity and date

### PB 14 - Low-stock parameter (SHOULD)

#### Story

As a user, I want to set a minimum quantity per item so that the app alerts me when to buy more

#### Satisfaction Criteria

- Add a "when-to-buy" feature on each item
- When quantity drops below the "when-to-buy" feature, it is added to the shopping list

### PB 15 - Export Inventory (SHOULD)

#### Story

As a user, I want to export my inventory so that I can get a overall view of how I manage the food I buy

#### Satisfaction Criteria

- A button that exports the inventory and downloads a file with name, quantity, expiration and status

### PB 16 - Shopping mode: alerts (COULD)

#### Story

As a shopper, I want a "shopper mode" that lets me scan items and show if it already exists in my inventory so that duplicates are avoided

#### Satisfaction Criteria

- A search field in "shopping mode" that shows matches from my inventory
- If products already exists, see its quantity and expiration date
- If not, add it to my inventory

### PB 17 - Dietary preferences for recipes (COULD)

#### Story

As a user, I want to apply different dietary preferences so that recipe suggestions are fit for my own diet

#### Satisfaction Criteria

- Add dietary restrictions to user settings
- Suggestions respect preferences or clearly indicate when options are insufficient

### PB 18 - Household sharing (COULD)

#### Story

As a roomate/household memeber, I can share my inventory with my family so that everyone sees the contents of our fridge

#### Satisfaction Criteria

- I can invite others to see the same fridge
- Changes from any member sync up on the same fridge

### PB 19 - Saving and waste metrics (COULD)

#### Story

As a user, I want a simple dashboard of consumed vs discarded food so that I understand how much money I am acctually saving

#### Satisfaction Criteria

- Chart that compares the consumed vs the discared items over the past month
- Card that shows a estimate on how much money has being saved

### PB 20 - Integrated Shopping List (COULD)

#### Story

As a user, I want to create a shopping list that can tell me the missing or low stock items so that its easier for me to remember and keep track of what I buy

#### Satisfaction Criteria

- Items are manually added or added from the low-stock alerts
- In "shopping mode" I can mark what items are purchased and optionally add them to the inventory


