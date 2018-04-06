//Write a method that will search an array of strings for all strings that contain another string, ignoring capitalization. Then return an array of the found strings.
//
//The method takes two parameters, the query string and the array of strings to search, and returns an array.
//
//If the string isn't contained in any of the strings in the array, the method returns an array containing a single string: "Empty" (or Nothing in Haskell, or "None" in Python)
//
//Examples
//If the string to search for is "me", and the array to search is ["home", "milk", "Mercury", "fish"], the method should return ["home", "Mercury"].

func stringComparator(word: String, _ words: [String]) -> [String] {
    return words.filter({ (logos) -> Bool in
        containsSubstring(word, logos.lowercased())
    })
}

func containsSubstring(_ subString: String, _ word: String) -> Bool {
    var offset = 0
    var counter = 0
    
    for c in word.lowercased() {
        if c == subString[subString.index(subString.startIndex, offsetBy: offset)] {
            offset += 1
            counter += 1
            
            if counter == subString.count {
                counter = 0
                offset = 0
                return true
            }
        }
    }
    
    return false
}

var data = ["home", "milk", "Mercury", "fish"]
var word = "me"


print(stringComparator(word: word, data))


