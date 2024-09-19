//task 1 - Set Intersec4on
var firstSet: Set<Int> = [1, 2, 3, 4]
var secondSet: Set<Int> = [3, 4, 5, 6]
var intersection: Set<Int>  = firstSet.intersection(secondSet)
print(intersection)

//task 2 - Dic4onary Update
var studentsScore: [String: Int] = [
    "Manarbek": 95,
    "Azat": 100,
    "Marat": 85
]
studentsScore["Manarbek"] = 100
print(studentsScore)

//task 3 - Array Merge
var firstArr: Array<String> = ["apple", "banana"]
var secondArr: Array<String> = ["cherry", "date"]
var thirdArr: Array<String> = firstArr + secondArr
print(thirdArr)
