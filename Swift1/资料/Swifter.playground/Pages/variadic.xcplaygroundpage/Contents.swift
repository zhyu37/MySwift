
import Foundation

func sum(input: Int...) -> Int {
    return input.reduce(0, combine: +)
}

print(sum(1,2,3,4,5))
// 输出：15

let name = "Tom"
let date = NSDate()
let string = NSString(format: "Hello %@. Date: %@", name, date)