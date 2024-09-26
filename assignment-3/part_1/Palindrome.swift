func isPalindrome(_ text: String) -> Bool {
    // Define a set of punctuation and spaces to ignore
    let ignoredCharacters: Set<Character> = [" ", ",", ".", "!", "?", "'", "\"", ":", ";", "-", "_", "(", ")"]

    // Filter the string: ignore spaces, punctuation, and make it lowercase
    let filteredText = text.lowercased().filter { !ignoredCharacters.contains($0) }

    // Check if the filtered text is the same when reversed
    return filteredText == String(filteredText.reversed())
}

// Example usage
let text = "A man, a plan, a canal, Panama!"
if isPalindrome(text) {
    print("'\(text)' is a palindrome.")
} else {
    print("'\(text)' is not a palindrome.")
}
