func caseInsensitive(sentence: String) -> String {
    let punctuations: [Character] = ["~", "`", "!", "@", "#", "$", "%", "^", "&", "*", "'", "\"", ":", ";", ",", ".", "?", "<", ">", "(", ")"]
    var clearedSentence = ""
    
    // Loop through each symbol in the sentence
    for symbol in sentence {
        // Append the symbol only if it's not a punctuation
        if !punctuations.contains(symbol) {
            clearedSentence.append(symbol)
        }
    }
    
    return clearedSentence
}

if let sentence = readLine() {
    // Remove punctuation from the sentence
    let clearedSentence = caseInsensitive(sentence: sentence.lowercased()) // Make the sentence lowercase for case insensitivity
    let listOfWords = clearedSentence.split(separator: " ")
    
    // Dictionary to store the frequency of words
    var frequency: [String: Int] = [:]
    
    // Loop through each word and update the frequency dictionary
    for word in listOfWords {
        let wordStr = String(word) // Convert Substring to String
        frequency[wordStr, default: 0] += 1
    }
    
    // Print the frequency of each word
    print(frequency)
    
} else {
    print("Incorrect input")
}
