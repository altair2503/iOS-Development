func hasUniqueCharacters(_ text: String) -> Bool {
    // Create a set to store unique characters
    var uniqueCharacters: Set<Character> = []

    // Iterate through each character in the string
    for character in text {
        // Check if the character is already in the set
        if uniqueCharacters.contains(character) {
            return false // Character is not unique
        }
        // Add the character to the set
        uniqueCharacters.insert(character)
    }

    return true // All characters are unique
}

// Example usage
let testString1 = "Hello"
let testString2 = "World"
let testString3 = "Unique"

print("'\(testString1)' has unique characters: \(hasUniqueCharacters(testString1))") // false
print("'\(testString2)' has unique characters: \(hasUniqueCharacters(testString2))") // true
print("'\(testString3)' has unique characters: \(hasUniqueCharacters(testString3))") // true
