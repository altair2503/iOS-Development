//Step 1: Declare Variables for Personal Informa&o
var firstName = "Altair"
var lastName = "Kabdrakhmanov"
let currentYear = 2024
let birthYear = 2003
var age = currentYear - birthYear
var isStudent = true
var height = 1.78

//Step 2: Create Variables for Your Hobbies and Interests
var hobby = "walking on the street and cooking"
var numberOfHobbies = 2
var favoriteNumber = 14
var isHobbyCreative = true


//Step 3: Create a Summary of Your Life Story
var summary = "My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). I am \(isStudent ? "" : "not")currently a student. I enjoy \(hobby), which is a\(isHobbyCreative ? "" : "not") creative hobby. I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber). "

//Step 4: Print Your Life Story
print(summary, "\n")

//BT
var goal = "cosmonaut"
summary += "In the future, I want to become a professional \(goal)."
print(summary)