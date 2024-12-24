// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SharedShoppingList {
    // Struct to represent a shopping list item
    struct ListItem {
        string name;
        uint256 quantity;
        address addedBy;
        bool isPurchased;
    }

    // Struct to represent a shared shopping list
    struct ShoppingList {
        string listName;
        address[] members;
        uint256 itemCount;
        mapping(uint256 => ListItem) items;
    }

    // Array to store multiple shopping lists
    ShoppingList[] public sharedLists;

    // Mapping to track list ownership and access
    mapping(uint256 => mapping(address => bool)) public listAccess;

    // Event to log when a new shopping list is created
    event ShoppingListCreated(
        uint256 indexed listId, 
        string listName, 
        address indexed creator
    );

    // Event to log when an item is added to a list
    event ItemAdded(
        uint256 indexed listId, 
        string itemName, 
        uint256 quantity, 
        address indexed addedBy
    );

    // Function to create a new shared shopping list
    function createShoppingList(string memory _listName, address[] memory _members) public returns (uint256) {
        // Require a list name and at least one member
        require(bytes(_listName).length > 0, "List name cannot be empty");
        require(_members.length > 0, "At least one member is required");

        // Create a new shopping list
        uint256 newListId = sharedLists.length;
        ShoppingList storage newList = sharedLists.push();
        newList.listName = _listName;
        
        // Add creator to members list
        newList.members.push(msg.sender);
        listAccess[newListId][msg.sender] = true;
        
        // Add additional members
        for (uint256 i = 0; i < _members.length; i++) {
            newList.members.push(_members[i]);
            // Grant access to each member
            listAccess[newListId][_members[i]] = true;
        }

        // Emit event for list creation
        emit ShoppingListCreated(newListId, _listName, msg.sender);

        return newListId;
    }

    // Function to add an item to a shared shopping list
    function addItemToList(
        uint256 _listId, 
        string memory _itemName, 
        uint256 _quantity
    ) public {
        // Validate list exists and user has access
        require(_listId < sharedLists.length, "Invalid list ID");
        require(listAccess[_listId][msg.sender], "You do not have access to this list");
        
        // Require valid item name and quantity
        require(bytes(_itemName).length > 0, "Item name cannot be empty");
        require(_quantity > 0, "Quantity must be greater than zero");

        // Get the list
        ShoppingList storage list = sharedLists[_listId];

        // Add item to the specified list
        list.items[list.itemCount] = ListItem({
            name: _itemName,
            quantity: _quantity,
            addedBy: msg.sender,
            isPurchased: false
        });

        // Increment item count
        list.itemCount++;

        // Emit event for item addition
        emit ItemAdded(_listId, _itemName, _quantity, msg.sender);
    }

    // Function to retrieve items for a specific list
    function getListItems(uint256 _listId) public view returns (ListItem[] memory) {
        require(_listId < sharedLists.length, "Invalid list ID");
        
        ShoppingList storage list = sharedLists[_listId];
        ListItem[] memory items = new ListItem[](list.itemCount);
        
        for (uint256 i = 0; i < list.itemCount; i++) {
            items[i] = list.items[i];
        }
        
        return items;
    }
}