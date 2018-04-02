//: Playground - noun: a place where people can play

//The idea for this Kata came from 9gag today.here
//
//You'll have to translate a string to Pilot's alphabet (NATO phonetic alphabet) wiki.
//
//Like this:
//
//Input: If you can read
//
//Output: India Foxtrot Yankee Oscar Uniform Charlie Alfa November Romeo Echo Alfa Delta
//
//Some notes
//
//Keep the punctuation, and remove the spaces.
//Use Xray without dash or space.

let nato = ["A": "Alfa", "B": "Bravo", "C": "Charlie", "D": "Delta", "E": "Echo", "F": "Foxtrot", "G": "Golf", "H": "Hotel", "I": "India", "J": "Juliett", "K": "Kilo", "L": "Lima", "M": "Mike", "N": "November", "O":"Oscar", "P":"Papa", "Q":"Quebec", "R":"Romeo", "S":"Sierra", "T":"Tango", "U":"Uniform", "V":"Victor", "W":"Whiskey", "X":"Xray", "Y":"Yankee", "Z":"Zulu", "1":"One", "2":"Two", "3":"Three", "4":"Four", "5":"Five", "6":"Six", "7":"Seven", "8":"Eight", "9":"Niner", "0":"zero"]

func deconstruct(input: String) -> [String] {
    var this = [String]()
    input.forEach { (c) in
        if c != " " {
            this.append(String(describing: c).uppercased())
        }
    }
    return this
}



func toNato(input: String) -> String {
    let inputArray = deconstruct(input: input)
    var thisString = ""
    inputArray.forEach { (s) in
        thisString += "\(nato[s]!) "
    }
    
    return thisString
}

var inp = "if you can read 129"

print(toNato(input: inp))
