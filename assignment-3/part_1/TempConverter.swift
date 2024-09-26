// The logic is to take temperature and then degree 
print("Please write your temperature:")
if let input = readLine(), let temperature = Double(input) {
    print("Temperature:", temperature)
    
    // Here logic of degree
    print("Please write temperature unit. \nYou can choose one of them: C, K, F")
    if let degree = readLine() {
        // function to convert temp to C, K or F 
        tempConverter(temperature: temperature, degree: degree)
    } else {
        print("The value can be only a string.")
    }
    
} else {
    print("The value can be only numeric.")
}

// The function itself with switch cases
func tempConverter(temperature: Double, degree: String) {
    switch degree {
        case "C":
            print(temperature + 273.15, "in Kelvin")
            print(temperature * 1.8 + 32, "in Fahrenheit")
        case "K":
            print(temperature - 273.15, "in Celsius")
            print((temperature - 273.15) * 1.8 + 32, "in Fahrenheit")
        case "F":
            print((temperature - 32) * 5/9, "in Celsius")
            print((temperature - 32) / 1.8 + 273.15, "in Kelvin")
        default:
            print("Unknown temperature unit. Please choose C, K, or F.")
    }
}
