var application: Bool = true 
var shopList: [String] = []

while(application) {
    let menu = """
    Please choose one of these:
    1. Add item to shopping list 
    2. Remove item from shopping list
    3. Display current shopping list
    4. Exit from application
    """
    print(menu)
    print("Write the number: ")

    if let number = readLine() {
        switch number {
            case "1":
                print("Add item to shopping list:")
                if let item = readLine() {
                    shopList.append(item)
                    print("'\(item)' has been added to your shopping list.")
                } else {
                    print("Invalid item. Please try again.")
                }
            case "2":
                print("Remove item from shopping list:")
                if !shopList.isEmpty {
                    print("Your current list: \(shopList)")
                    print("Enter the item to remove:")
                    if let itemToRemove = readLine(), let index = shopList.firstIndex(of: itemToRemove) {
                        shopList.remove(at: index)
                        print("'\(itemToRemove)' has been removed from your shopping list.")
                    } else {
                        print("Item not found in the list.")
                    }
                } else {
                    print("Your shopping list is empty.")
                }

            case "3":
                print("Display current shopping list:")
                if shopList.isEmpty {
                    print("Your shopping list is empty.")
                } else {
                    print("Your shopping list: \(shopList)")
                }

            case "4":
                application = false
                print("Bye")
                
            default:
                print("Please write from 1 to 4 only")
        }
    } else {
        print("Invalid input. Please try again.")
    }
}
