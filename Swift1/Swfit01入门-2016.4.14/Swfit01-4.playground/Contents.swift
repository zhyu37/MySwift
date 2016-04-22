//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let array = ["2","1"]

let dict = ["name":"hah", "age":30]

dict["age"]

for (k, v) in dict
{
    print(k)
    print(v)
}

var dict1 = ["name":"hah", "age":30]

dict1["home"] = "sjz"

dict1.removeValueForKey("home")
dict1


//字典合并
var dict2 = ["address":"hbei"]

for (k, v) in dict2
{
    dict1[k] = v
}

dict1

//字符串拼接
var str1 = "haha1 "

str1 += str


var str3 = "name = \(str1)"

var str4 = String(format: "%02d :%02d :%02d", arguments: [9, 8, 13])

var str5 = "woshi doubi" as NSString

var str6:NSString = "woshi doubi"

var sub = str5.substringWithRange(NSMakeRange(1, 3))


var str7 = "doubia1"

for c in str7.characters
{
    print(c)
}

func say() -> Void
{
    print("hah")
}

say()

func say1() -> ()
{
    print("hah")
}

say1()

func say2()
{
    print("hah")
}

say2()

func say3(a :Int, b :Int) -> Int
{
    return a+b
}

say3(1, b: 4)

