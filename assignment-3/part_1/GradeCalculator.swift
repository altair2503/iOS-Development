// Function to calculate average, highest, and lowest scores
func StudentScoreCalculator(students: [String: Int]) {
    // Check if there are any students
    guard !students.isEmpty else {
        print("No students data provided.")
        return
    }

    // Calculate the total score. Int.min and Int.max for comparison
    var totalScore = 0
    var highestScore = Int.min
    var lowestScore = Int.max
    
    for (_, score) in students {
        totalScore += score
        if score > highestScore {
            highestScore = score
        }
        if score < lowestScore {
            lowestScore = score
        }
    }

    // Calculate the average score
    let averageScore = Double(totalScore) / Double(students.count)

    // Display each student’s name, score, and comparison to average
    print("\nStudent Scores and Comparison to Average:")
    for (student, score) in students {
        let comparison = score >= Int(averageScore) ? "above" : "below"
        print("\(student): \(score) - \(comparison) average")
    }

    // Display the average, highest, and lowest scores
    print("\nAverage Score: \(averageScore)")
    print("Highest Score: \(highestScore)")
    print("Lowest Score: \(lowestScore)")
}

// Accept student names and scores
var students: [String: Int] = [:]

print("Enter student names and their corresponding test scores (type 'done' to finish):")

// if done is entered application stopped 
while true {
    print("Enter student name:")
    if let name = readLine(), name.lowercased() != "done" {
        print("Enter score for \(name):")
        if let scoreInput = readLine(), let score = Int(scoreInput), score >= 0 {
            students[name] = score
        } else {
            print("Invalid score, please enter a valid number.")
        }
    } else {
        break
    }
}

// Process and display student data
StudentScoreCalculator(students: students)
