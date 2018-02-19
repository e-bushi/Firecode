//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

//class MyViewController : UIViewController {
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//        
//        view.addSubview(label)
//        self.view = view
//    }
//}
// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()

func isNumberMissing(numbers: [Int]) -> (Bool, Int, Int) {
    
    //get length of array
    let length = numbers.count
    
    //first element value in array
    let value = numbers[0]
    
    //output sum variable
    var output = value
    
    //assuming that the array is sorted, we are adding each item in the array (except the first item) to output
    //to get the sum of all the elements in the array
    for i in numbers {
        if i == output {
            continue
        } else {
            output += i
        }
    }
    
    var counter = 1
    var checkValue = numbers[0]
    var addthis = checkValue + 1
    
    ///we are using the a counter to iterate length number of times minus one, to get what array is suppose to sum up to
    while counter < length {
        checkValue += addthis
        print(checkValue)
        addthis += 1
        counter += 1
    }
    
    ///check the sum of the array against what the sum is suppose to be and return tuple, that signifies if a number is missing
    if checkValue == output {
        return (true, checkValue, output)
    } else {
        return (false, checkValue, output)
    }

}


var list = [5, 6, 7, 8, 9, 10]

print(isNumberMissing(numbers: list))

func findMissingNumber(numbers: [Int]) -> (Int, String) {
    
    let resultTuple = isNumberMissing(numbers: numbers)
    
    if resultTuple.0 == false {
        let difference = resultTuple.2 - resultTuple.1
        let missingNumber = numbers.last! - difference
        return (missingNumber, "Sorry, the number that is missing is \(missingNumber)")
    } else {
        return (0, "Great, there are no missing numbers")
    }
    
}


print(findMissingNumber(numbers: list))
