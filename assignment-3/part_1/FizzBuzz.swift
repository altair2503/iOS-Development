// Problem 1: FizzBuzz
// The logic to use for loop to go from 1 till 100 (included).
// then goes first check if the number multiples of 3 and 5
// if above condition doesn't work it will check to 5
// if it is not multiple of 5 check for being multiplication 4 
for number in 1...100{
    if(number % 3 == 0 && number % 5 == 0){
        print("FizzBuzz")
    } else if(number % 5 == 0){
        print("Buzz")
    } else if(number % 3 == 0){
        print("Fizz")
    } else {
        print(number)
    }
}