//: Playground - noun: a place where people can play

import UIKit

//Find all Backwards Read Primes between two positive given numbers (both inclusive), the second one being greater than the first one. The resulting array or the resulting string will be ordered following the natural order of the prime numbers.
//
//Example
//backwardsPrime(2, 100) => [13, 17, 31, 37, 71, 73, 79, 97] backwardsPrime(9900, 10000) => [9923, 9931, 9941, 9967]
//
//backwardsPrime(2, 100) => [13, 17, 31, 37, 71, 73, 79, 97]
//backwardsPrime(9900, 10000) => [9923, 9931, 9941, 9967]

func isPrime(_ number: Int) -> Bool {
    var multiples = 0
    
    for i in 1...number {
        if number % i == 0 {
            multiples += 1
        }
    }
    
    return multiples == 2
}

func reverseDigits(_ number: Int) -> Int {
    var returnThisString = ""
    let numberString = String(describing: number)
    var numberArray = [Character]()
    for i in numberString {
        numberArray.append(i)
    }
    numberArray.reverse()
    numberArray.forEach { (c) in
        returnThisString += String(describing: c)
    }
    return Int(returnThisString)!
}

func backwardsPrime(_ a: Int, _ b: Int) -> [Int] {
    var primes = [Int]()
    var n = 0
    for number in a...b {
        //is it prime?
        if isPrime(number) {
            //reverse digits
            n = reverseDigits(number)
            //is the number that was formed as a result of the reversed digits a prime number?
            //if so append to array, if not continue
            if isPrime(n) {
                primes.append(number)
            }
        }
    }
    
    return primes
}


print(backwardsPrime(9900, 10000))

