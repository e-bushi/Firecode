//: A UIKit based Playground for presenting user interface
  
import UIKit

//You are given an m x n 2D image matrix (List of Lists) where each integer represents a pixel. Flip it in-place along its horizontal axis.


struct Matrix<T> {
    
    var matrix:[[T]]?
    var counter = 0
    
    public init(matrix: [[T]]) {
        self.matrix = matrix
        self.counter = matrix[0].count
    }
    
    public mutating func horizontalFlip() {
        let arrayIndx = 0
        var newMatrix = matrix!
        
        for i in 0..<self.counter {
            matrix![arrayIndx][i] = newMatrix[arrayIndx+1][i]
            matrix![arrayIndx+1][i] = newMatrix[arrayIndx][i]
        }
    }
    
    public func realSwap(_ one: inout T, _ two: inout T) {
        var first = one
        let holder = two
        var second = two
        
        second = first
        first = holder
        
        one = first
        two = second
    }
}

extension Matrix: CustomStringConvertible {
    var description: String {
        let text = "\(matrix!)"
        
        return text
    }
}


var d = [[0, 0], [1, 1]]
var matrix = Matrix(matrix: d)
matrix.horizontalFlip()
print(matrix)



