# MySwift
Swift for me
====
##Swift05-构造方法

<p>知识点1
<pre>
/**
     注意：如果自定义了构造方法，并且没有重写父类默认的构造方法那么默认的构造方法就会失效
     */
    override init() {
        self.name = "老潘"
//        self.property = "逗逼"
        self.age = 2
    }
</pre>

<p>知识点2
<pre>
 /**
     自定义构造方法  
     Swift中有方法重载的概念。允许有同名的方法，只要形参或者返回值不一样即可
     */
    init(name:String, property:String) {
        self.name = name
//        self.property = property
        self.age = 3
 }
</pre>

<p>知识点3
<pre>
    /// 如果定义属性的时候没有初始化，那么必须在后面写上一个？。Swift要求，属性是必须有初始值得。只要在构造方法中对属性进行了初始化，那就不用写？。
    var name:String?
//    var property:String?
    /// 如果是定义一个“对象属性”那么后面可以写上？。
    如果定义一个“基本数据类型属性”，那么建议直接赋值为0.因为super.init()这个方法在分配储存空间的时候，
    如果发现属性是一个对象，并且是一个可选类型，那么会给这个这个属性分配储存空间。
    但是如果属性是一个基本数据类型，并且是可选类型，那么super.init()不会给该属性分配存储空间。
    var age:Int = 0
    
    
   init(dict:[String: NSObject]) {
        super.init()
        /**
        *  注意点：Swift中如果想在构造方法中使用KVC 给属性赋值。那么在使用KVC之前必须调用super.init()。调用super.init()的目的就是为了能在KVC赋值之前给属性分配储存空间
        */
        setValuesForKeysWithDictionary(dict)
    }
</pre>