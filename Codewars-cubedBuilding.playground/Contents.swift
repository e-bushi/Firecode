

//: Playground - noun: a place where people can play

import UIKit

//Your task is to construct a building which will be a pile of n cubes. The cube at the bottom will have a volume of n^3, the cube above will have volume of (n-1)^3 and so on until the top which will have a volume of 1^3.
//
//You are given the total volume m of the building. Being given m can you find the number n of cubes you will have to build?
//
//The parameter of the function findNb (find_nb, find-nb, findNb) will be an integer m and you have to return the integer n such as n^3 + (n-1)^3 + ... + 1^3 = m if such a n exists or -1 if there is no such n.

func findNb(_ number: Int) -> Int {
    var x = 1
    var sum = 0.0
    repeat {
        sum += pow(Double(x), Double(3))
        print(sum)
        x += 1
    } while sum < Double(number)
    
    if sum == Double(number) {
        return x - 1
    } else {
        return -1
    }
}




