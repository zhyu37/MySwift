//
//  main.swift
//  类
//
//  Created by 李南江 on 15/4/4.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

import Foundation

/*
类的基本定义
Swift中的结构体和类非常相似, 但是又有不同之处
类是具有相同属性和方法的抽象
格式:
class 类名称 {
    类的属性和方法
}
*/
class Rect {
    var width:Double = 0.0
    var height:Double = 0.0
    func show() -> Void{
        print("width = \(width) height = \(height)")
    }
}
// 类没有逐一构造器
//var r1 = Rect(width: 10.0, height: 10.0)
var r1 = Rect()
r1.show()
var r2 = r1
r2.show()
// 类是引用类型, 结构体之间的赋值其实是将r2指向了r1的存储控件, 所以他们是两个只想同一块存储空间, 修改其中一个会影响到另外一个
r1.width = 99
r1.show()
r2.show()


/*
恒等运算符, 用于判断是否是同一个实例, 也就是是否指向同一块存储空间
=== !==
*/
var r3 = Rect()
if r1 === r3
{
    print("指向同一块存储空间")
}
