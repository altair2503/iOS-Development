// Functions to perform basic operations
func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

func divide(_ a: Double, _ b: Double) -> Double? {
    if b == 0 {
        print("Error: Division by zero is not allowed.")
        return nil
    }
    return a / b
}

// Function to perform the calculation
func calculate(_ a: Double, _ b: Double, operation: String) -> Double? {
    switch operation {
    case "+":
        return add(a, b)
    case "-":
        return subtract(a, b)
    case "*":
        return multiply(a, b)
    case "/":
        return divide(a, b)
    default:
        print("Invalid operation.")
        return nil
    }
}

// Main calculator loop
var continueCalculating = true

while continueCalculating {
    // Prompt the user for two numbers
    print("Enter the first number:")
    if let input1 = readLine(), let number1 = Double(input1) {
        print("Enter the second number:")
        if let input2 = readLine(), let number2 = Double(input2) {
            
            // Ask the user to choose an operation
            print("Choose an operation: +, -, *, /")
            if let operation = readLine() {
                
                // Perform the calculation and display the result
                if let result = calculate(number1, number2, operation: operation) {
                    print("Result: \(result)")
                }
            } else {
                print("Invalid input for operation.")
            }
        } else {
            print("Invalid input for the second number.")
        }
    } else {
        print("Invalid input for the first number.")
    }
    
    // Ask the user if they want to continue
    print("Do you want to perform another calculation? (yes/no)")
    if let continueInput = readLine(), continueInput.lowercased() != "yes" {
        continueCalculating = false
        print("Exiting calculator. Goodbye!")
    }
}
