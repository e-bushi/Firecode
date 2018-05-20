//: Playground - noun: a place where people can play

//Write a function that takes a string of braces, and determines if the order of the braces is valid. It should return true if the string is valid, and false if it's invalid.
//
//This Kata is similar to the Valid Parentheses Kata, but introduces new characters: brackets [], and curly braces {}. Thanks to @arnedag for the idea!
//
//    All input strings will be nonempty, and will only consist of parentheses, brackets and curly braces: ()[]{}.
//
//What is considered Valid?
//A string of braces is considered valid if all braces are matched with the correct brace.
//
//Examples
//"(){}[]"   =>  True
//"([{}])"   =>  True
//"(}"       =>  False
//"[(])"     =>  False
//"[({})](]" =>  False

var brackets = ["[":"]", "{":"}", "<":">", "(":")"]

func validbrackets(_ input: String, braces: [String:String]) -> Bool {
    let counter = input.count
    
    var downCounter = counter - 1
    
    if input.count % 2 != 0 {
        return false
    } else {
        let times = counter / 2
        for i in 0..<times {
            if !(braces[String(input[input.index(input.startIndex, offsetBy: i)])] == String(input[input.index(input.startIndex, offsetBy: downCounter)])) {
                return false
            } else {
                downCounter -= 1
            }
        }
    }
    
    
    return true
}

var s = "[]"

validbrackets(s, braces: brackets)





