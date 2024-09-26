func fibonacci(_ n: Int) -> [Int] {
    // Case 1: less or equal than 0
    if n <= 0 {
        return []
    }
    
    // Case 2: equal to 1
    if n == 1 {
        return [0]
    }

    // Case 3: equal to 2
    if n == 2 {
        return [0, 1]
    }
    
    // Initial two numbers in fibonacci numbers
    var sequence: [Int] = [0, 1]
    
    // Calculate the rest of the Fibonacci numbers
    for _ in 2..<n {
        let nextNumber = sequence[sequence.count - 1] + sequence[sequence.count - 2]
        sequence.append(nextNumber)
    }
    
    return sequence
}

// Example usage
let n = 7 
let fibSequence = fibonacci(n)
print("The fibonacci number for \(n):")
print(fibSequence)
