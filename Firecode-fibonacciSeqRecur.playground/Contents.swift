//The Fibonacci Sequence is the series of numbers: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ... The next number is found by adding up the two numbers before it.
//Write a recursive method fib(n) that returns the nth Fibonacci number. n is 0 indexed, which means that in the sequence 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ..., n == 0 should return 0 and n == 3 should return 2.
//Assume n is less than 15.
//Even though this problem asks you to use recursion, more efficient ways to solve it include using an Array, or better still using 3 volatile variables to keep a track of all required values. Check out this blog post to examine better solutions for this problem.

func fibonacci(_ n: Int) -> Int {
    
    var sequence = [0, 1]
    
    var indx = 0
    
    for _ in 0..<(n - 1) {
        let first = sequence[indx]
        let sec = sequence[indx+1]
        sequence.append(first+sec)
        
        indx += 1
    }
    
    return sequence.last!
}


func fibonacciRecursive(_ n: Int) -> [Int] {
    
    var sequence = [0]
    
    
    
    if n > 0 {
        
        sequence.append(fibonacci(n-1) + fibonacci(n - 2))
    }
    
    return sequence
    
}

print(fibonacci(10))
