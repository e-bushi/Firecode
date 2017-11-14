//: A UIKit based Playground for presenting user interface
  
import UIKit

class temperatureTracker {
    
    var temperatures = [Int]()
    
    var temperatureOccurences = [Int : Int]()
    
    init(temps: [Int]) {
        
        self.temperatures = temps
        
        for value in temps {
            self.temperatureOccurences[value] = 0
        }
    }
    
    func insert() -> Int {
        //:PURPOSE - records a new temperature
        return 0
    }
    
    func getMax() -> Int {
        //:PURPOSE - returns the highest temp we've seen so far
        return temperatures.max()!
    }
    
    func getMin() -> Int {
        //:PURPOSE - returns the lowest temp we've seen so far
        return temperatures.min()!
    }
    
    func getMean() -> Double {
        //:PURPOSE - returns the mean ↴ of all temps we've seen so far
        var value = 0
        
        temperatures.forEach { (temp) in
            value += temp
        }
        
        return Double(value / temperatures.count)
    }
    
    func getMode() -> [Int] {
        //:PURPOSE - returns a mode ↴ of all temps we've seen so far
        var highest = 0

        var mode = [Int]()

        for value in temperatures {
            temperatureOccurences[value]! += 1
        }

        for (_, value) in self.temperatureOccurences {
            if value > highest {
                highest = value
            }
        }

        for key in self.temperatureOccurences.keys {
            if temperatureOccurences[key] == highest {
                mode.append(key)
            }
        }

        return mode
    }
}

var temperatures = [12, 55, 82, 12, 98, 65]

var tracker = temperatureTracker(temps: temperatures)

print(tracker.getMode())



















