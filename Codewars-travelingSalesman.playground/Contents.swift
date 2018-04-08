//A traveling salesman has to visit clients. He got each client's address e.g. "432 Main Long Road St. Louisville OH 43071" as a list.
//
//The basic zipcode format usually consists of two capital letters followed by a white space and five digits. The list of clients to visit was given as a string of all addresses, each separated from the others by a comma, e.g. :
//
//"123 Main Street St. Louisville OH 43071,432 Main Long Road St. Louisville OH 43071,786 High Street Pollocksville NY 56432".
//
//To ease his travel he wants to group the list by zipcode.
//
//Task
//The function travel will take two parameters r (addresses' list of all clients' as a string) and zipcode and returns a string in the following format:
//
//zipcode:street and town,street and town,.../house number,house number,...
//
//The street numbers must be in the same order as the streets where they belong.
//
//If a given zipcode doesn't exist in the list of clients' addresses return "zipcode:/"

func getAddresses(word: String, _ words: [String]) -> [String] {
    let addresses = words.filter({ (logos) -> Bool in
        containsSubstring(word, logos)
    })
    
    return addresses.map({ (address) -> String in
        var counter = 0
        for char in address {
            if char != Character(" "){
                counter += 1
            } else {
                break
            }
        }
        print(counter)
        let indx = address.index(address.startIndex, offsetBy: counter)
        counter = 0
        let backwardsIndx = address.index(address.endIndex, offsetBy: -8)
        
        
        let addressNumber = address[..<indx]
        let adressWithoutZip = address[..<backwardsIndx]
        
        let streetAddress = adressWithoutZip[indx...]
        
        
        return "\(word):\(streetAddress)/\(addressNumber)"
    })
}

func containsSubstring(_ subString: String, _ word: String) -> Bool {
    var offset = 0
    var counter = 0
    
    for c in word {
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

var data = ["123 Main Street St. Louisville OH 43071", "432 Main Long Road St. Louisville OH 43071", "786 High Street Pollocksville NY 56432",
            "54 Holy Grail Street Niagara Town ZP 32908", "3200 Main Rd. Bern AE 56210", "1 Gordon St. Atlanta RE 13000",
            "10 Pussy Cat Rd. Chicago EX 34342", "10 Gordon St. Atlanta RE 13000", "58 Gordon Road Atlanta RE 13000",
            "22 Tokyo Av. Tedmondville SW 43098", "674 Paris bd. Abbeville AA 45521", "10 Surta Alley Goodtown GG 30654",
            "45 Holy Grail Al. Niagara Town ZP 32908", "320 Main Al. Bern AE 56210", "14 Gordon Park Atlanta RE 13000",
            "100 Pussy Cat Rd. Chicago EX 34342", "2 Gordon St. Atlanta RE 13000", "5 Gordon Road Atlanta RE 13000",
            "2200 Tokyo Av. Tedmondville SW 43098", "67 Paris St. Abbeville AA 45521", "11 Surta Avenue Goodtown GG 30654",
            "45 Holy Grail Al. Niagara Town ZP 32918", "320 Main Al. Bern AE 56215", "14 Gordon Park Atlanta RE 13200",
            "100 Pussy Cat Rd. Chicago EX 34345", "2 Gordon St. Atlanta RE 13222", "5 Gordon Road Atlanta RE 13001",
            "2200 Tokyo Av. Tedmondville SW 43198", "67 Paris St. Abbeville AA 45522", "11 Surta Avenue Goodville GG 30655",
            "2222 Tokyo Av. Tedmondville SW 43198", "670 Paris St. Abbeville AA 45522", "114 Surta Avenue Goodville GG 30655",
            "2 Holy Grail Street Niagara Town ZP 32908", "3 Main Rd. Bern AE 56210","77 Gordon St. Atlanta RE 13000"]

var word = "OH 43071"


print(getAddresses(word: word, data))





