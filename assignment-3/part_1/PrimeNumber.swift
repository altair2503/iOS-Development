 func isPrime(_ number: Int) -> Bool {
    //check for corner cases 
    if(number <= 1) {
        return false
    }
    //go from 2 to number (not included)
    //  to check if it can be divided
    for i in 2..<number{
        // if it can be divided then it is not prime
        if(number % i == 0){
            return false
        }
    }
    // if the number will not be divided by any numbers till number
    // then return true that is prime
    return true
 }
//go form 1 to 100 to check if number is prime
for number in 1...100{
    print("is \(number) Prime -", isPrime(number))
}
 