=====
##Swift01-入门
>Swift，苹果于2014年WWDC（苹果开发者大会）发布的新开发语言，可与Objective-C*共同运行于Mac OS和iOS平台，用于搭建基于苹果平台的应用程序。
<p>常量&&变量
<pre>
//定义变量
//1. 语句末尾不用使用 ;
//2. let 定义常量，设置之后不可以修改
let i = 10
//3. var 定义变量，设置之后可以修改
var j = 20
//4. 在 Swift 中使用 print() 替代 OC 中的 NSLog
print("老潘又逗比了")
//5. print 的性能更好，而且会自动填写\n

//指定类型
let dValue: Double = 10.1
print(dValue)
/*
在Swift中值"永远不会"被隐式转换为其他类型, 必须显示转换
Swift中整数默认是Int64  == long
Swift中小数默认是Double
*/
let sum = Double(num) + value
print(sum)

let size = CGSize(width: 10, height: 10)
// Double和CGFloat也需要转换
let res = size.width + CGFloat(dValue)

//创建对象
/*
创建对象
OC:     alloc initWithXXX 方法
Swift:  (xxx:)

调用方法
OC:     [UIColor redColor];
Swift   UIColor.redColor()

枚举
OC:      UIButtonTypeContactAdd
Swift:   UIButtonType.ContactAdd
*/

let view = UIView(frame: CGRectMake(0, 0, 100, 100))
view.backgroundColor = UIColor.redColor()

let btn = UIButton(type: UIButtonType.ContactAdd)
btn.center = CGPoint(x: 50, y: 50)
view.addSubview(btn)

</pre>

<p>逻辑分支
<pre>
//if  语句
//1. 条件不需要加圆括号
//2. {}不能省略
let intValue = 10
if intValue > 5{
    print("OK")
}

//bool
// 1.Swift中没有C和OC中非零即真的概念
// 2.Swfit中逻辑值只有两个true/false
if intValue == 10 {
    print(intValue)
}


//三目运算符和OC中的一样
let result = intValue > 20 ? 20 : 10

//可选类型(Optional) ? 
//表示变量可以有值, 也可以没有值
//convenience init? 构造函数, ?表示不一定能够实例化出对象

// !表示告诉编译器一定有值, 编译能够通过, 如果运行时没有值就会直接崩溃
// 提示: ? 和 ! 是所有刚刚接触Swift的OC程序员最蛋疼的问题, 前期开发要注意多看文档和利用编译器提示解决

let url = NSURL(string: "http://www.520it.com/")
let url2 = NSURL(string: "http://www.520it.com/李南江")
// 需要考虑url是否有值
if url != nil{
    let request = NSURLRequest(URL: url!)
}

// 不需要考虑url是否有值, 能进入{}一定有值
if let url3 = NSURL(string: "http://www.520it.com/"){
    let request = NSURLRequest(URL: url3)
}
</pre>

<p>循环
<pre>
// 传统写法:
// 不需要()
// i没有类型, 使用的是var

for var i = 0; i < 10; i++
{
    print(i)
}


//Swift  0~9之间, 其中 0..< 中间不能有空格
// Swift1.0版本 0..10
*/

for i in 0..<10
{
    print(i)
}

// 0~10
for i in 0...10
{
    print(i)
}

// 不关心下标可以使用 _ 省略
// 在Swift中 _ 使用非常广泛
for _ in 0...10
{
    print("lnj")
}

// while循环
var n = 0
while n < 10
{
    print(n)
    n++
}

// do while
var m = 0
repeat{
    print(m)
    m++
}while m < 10
</pre>

<p>数组
<pre>
// 定义数组
let array = ["lnj", "lmj"]

// 遍历
for arr in array{
    print(arr)
}

// 获取元素
array[0]
array[1]

// 添加元素
// 不能像不可变数组中添加内容
//array.append("why")

// let不可变对象, var可变对象
var arrayM = ["lnj", "lmj"]
arrayM.append("why")

// 在Swift开发中数组可以存放任意类型
var arrayM2 = ["lnj", "lmj", 123]
arrayM2.append("456")

// 合并数组
var arrayM3 = ["zs", "ls", "ww", "zl"]
arrayM += arrayM3
//只有相同类型的数组才可以合并
//arrayM2 += arrayM3

// 删除
arrayM3.removeAtIndex(1)
arrayM3

// 删除所有
//arrayM3.removeAll()

// 删除并保留容量
arrayM3.removeAll(keepCapacity: true)
arrayM3.capacity
arrayM3.append("1")
arrayM3.capacity
arrayM3.append("2")
arrayM3.capacity
arrayM3.append("3")
arrayM3.capacity
arrayM3.append("4")
arrayM3.capacity
arrayM3.append("5")
// 超过容量, 容量会直接*2
arrayM3.capacity


// 初始化
var arrayM4: [String]
arrayM4 =  []String]()
// 数组没有初始化之前不允许做任何操作
arrayM4.append("lnj")
</pre>

<p>字典
<pre>
// 定义字典
// 最常见的字典类型[String : NSObject], 例如JSON
var dict = ["name":"lnj", "age": 30]

// 遍历字典
// k,v 可以随便写, 前面是key后面是value
for (k, v) in dict{
    print(k)
    print(v)
}

// 获取元素
dict["name"]

// 添加元素
// 如果key不存在会新增
dict["gender"] = "man"
dict

// 替换元素
// 如果key存在会替换
dict["name"] = "why"

// 删除元素
dict.removeValueForKey("name")
dict

// 合并字典
var dict2 = ["score": 123]
for (k, v) in dict2{
    dict[k] = v
}
dict

// 初始化
var dict3: [String: NSObject]
dict3 = [String: NSObject]()
dict3["name"] = "lnj"
dict3


</pre>

<p>字符串
<pre>
/*
Swift中使用String是一个结构体,  效率更高, 支持遍历
OC中是一个对象
Swift中的String和OC中的NSString可以很方便的进行转换
*/
var str = "南哥很帅"
//一定要加.characters
for c in str.characters
{
    print(c)
}


// 字符串拼接
var str2 = "cool"
str2 += str

let age = 30
let name = "lnj"
let str3 = "name = \(name), age = \(age)"

let frmStr = String(format: "%02d:%02d:%02d", arguments: [9, 23, 8])

// 字符串截取, 建议使用NSString
let str4 = "xmgcool"
let nsStr: NSString = str4
let subStr = nsStr.substringWithRange(NSMakeRange(0, 3))
let nsStr2 = str4 as NSString
let subStr2 = nsStr.substringWithRange(NSMakeRange(1, 3))
</pre>

<p>函数
<pre>
/*
格式:
func 函数名称(参数列表) -> 返回值
语义: 将前面的计算结果, 输出给后面的返回值
*/

// 没有参数没有返回值
/*
1. 可以写为 ->Void
2. 可以写为 ->()
3. 可以省略
*/
func say() -> Void{
    print("lnj")
}
say()
func say2() -> (){
    print("lnj")
}
say2()
func say3(){
    print("lnj")
}
say3()
// 有参数没有返回值
func sum(a: Int, b: Int){
    print(a + b)
}
sum(10, b: 20)

func summ(a: Int, _ b: Int){
    print(a + b)
}
summ(10, 20)

// xy外部参数, ab内部参数
// Swift2.0以前可以写#
func sum2(x a: Int, y b: Int){
    print(a + b)
}
sum2(x: 10, y: 20)

// 没有参数有返回值
func getNumer() ->Int{
    return 998
}
print(getNumer())

// 有参数有返回值
func sum3(a: Int, b: Int) ->Int{
    return a + b
}
print(sum3(10, b: 20))

</pre>