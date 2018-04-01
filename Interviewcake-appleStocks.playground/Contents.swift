//: A UIKit based Playground for presenting user interface
  
import UIKit


//Write an efficient function that takes stock_prices_yesterday and returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.

let prices = [10, 7, 5, 8, 11, 9]
func StockPriceYesterday(prices: [Int]) -> String {

    let minimum = prices.min()
    let minIndx = prices.index(of: minimum!)

    let maximum = prices.max()
    let maxIndx = prices.index(of: maximum!)

    if minIndx! < maxIndx! {
        return "$\(maximum! - minimum!)"
    } else {
        let val = prices.index(of: minimum!)
        let array = prices[val!...]
        
        return StockPriceYesterday(prices: Array(array))
    }
}

StockPriceYesterday(prices: prices)
