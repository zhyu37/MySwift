# MySwift
Swift for me
====
##Swift02-闭包
>闭包 类似于 block
            block是C语言的, 类似于匿名函数
            闭包是定义函数的, Swift中函数就是一种特殊的闭包
            闭包的使用和block一样, 用于保存一段代码, 用作回调, 用作执行耗时操作
            
<p>闭包的基本使用方法(ViewController.swfit)
<pre>
1. 格式
	{
       (参数) -> 返回值类型
        in
       	执行语句
    }
    //示例
   loadData2 { () -> () in
            print("执行回调")
            }
2. 闭包简写
   1.如果没有参数, 没有返回值, in和in之前的东西可以省略
   2.如果闭包是函数的最后一个参数, 可以写在()后面  -- 尾随闭包
   3.如果只有一个闭包参数, 那么()也可以省略  -- 尾随闭包
   //示例
   loadData2 ({
   print("执行回调")
   })
   loadData2(){
   print("执行回调")
   }
   
   func loadData2(finished: () -> ()){
            print("耗时操作")
              // 回调
            finished()
 	}
   loadData2{
   print("执行回调")
   }
   
   
   loadData3("lnj") { () -> () in
   print("执行回调")
   }
   func loadData3(name: String, finished: () -> ()){
            print("name = \(name)")
            finished()
        }
   //在不会闭包之前 一般写耗时 操作的步骤
    func loadData(){
            dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
                print(NSThread.currentThread())
                print("耗时操作")
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    print(NSThread.currentThread())
                    print("回到主线程更新UI")
                })
            }
        }
</pre>

<p>闭包返回值得使用(ViewController2.swfit)
<pre>
 override func viewDidLoad() {
        super.viewDidLoad()
        /** 一般写法 但是可修改程度基本为0
        //1. 创建uiscrollview
        let scrollV = UIScrollView(frame: CGRect(x: 0, y: 200, width: 375, height: 200))
        scrollV.backgroundColor = UIColor.blueColor()
        
   //2. 创建N多UIButton
        let width1 = 50
        let count = 15
        for i in 0..<15
        {
        //3. 设置UIButton属性
        let btn = UIButton()
        btn.backgroundColor = UIColor.redColor()
        btn.setTitle("\(i)", forState: UIControlState.Normal)
        btn.frame = CGRect(x: i*width1, y: 0, width: width1, height: 200)
        //4. 将UIButton添加到 uiscrollView
        scrollV.addSubview(btn)
        
   }
        scrollV.contentSize = CGSize(width: count*width1, height: 200)
        //5. 将UIScrollview加到self.view
        view.addSubview(scrollV)
        */
        
  let sc = createScrollView({ () -> Int in
            return 15
            }) { (index) -> UIView in
                let width1 = 50
                //3. 设置UIButton属性
                let btn = UIButton()
                btn.backgroundColor = UIColor.redColor()
                btn.setTitle("\(index)", forState: UIControlState.Normal)
                btn.frame = CGRect(x: index*width1, y: 0, width: width1, height: 200)
                return btn
        }
        view.addSubview(sc)
        
}
    
   func createScrollView(Bcount: ()->Int, ButtonWithIndex: (index: Int)->UIView) -> UIScrollView
    {
        //1. 创建uiscrollview
        
   let scrollV = UIScrollView(frame: CGRect(x: 0, y: 200, width: 375, height: 200))
        scrollV.backgroundColor = UIColor.blueColor()
        
   //2. 创建N多UIButton
//        let width1 = 50
        let count = Bcount()
        for i in 0..<count
        {
            
   //4. 将UIButton添加到 uiscrollView
            let subView = ButtonWithIndex(index: i)
            scrollV.addSubview(subView)
            scrollV.contentSize = CGSize(width: CGFloat(count) * subView.bounds.width, height: 200)
            
}
        
   //5. 将UIScrollview加到self.view
        
//        view.addSubview(scrollV)
        return scrollV
    }
</pre>

<p>闭包循环引用(ViewController3.swfit)
<pre>
// Swift中定义属性, 必须在构造方法中初始化, 否则就必须加上?
    // 注意: 以下写法代表闭包的返回值可以为nil
    // var finished: ()->()?
    var finished: (()->())?
    override func viewDidLoad() {
        super.viewDidLoad()
        
   // OC中 __weak typeof(self) weakSelf = self
        /* 这句话 是重点 */weak var weakSelf = self
        loadData { () -> () in
            
 print("更新UI")
            // 闭包和block很像, 都是提前准备好代码, 在需要时执行
            // block会对外部变量进行copy, 保证执行代码时变量还在
            // block中用到self一定要非常小心
            // 闭包也一样, 为了能够准确定位到view, 所以需要写self
            // 提示: Swift开发中能不写self就不写self, 一看到self就想到闭包
//            self.view.backgroundColor = UIColor.redColor()
            weakSelf!.view.backgroundColor = UIColor.redColor()
        }
    }
    func loadData(finished: ()->()){
        print("耗时操作")
        // 保存闭包
        self.finished = finished
        finished()
    }
    
  // 类似于dealloc方法
    deinit
    {
        print("我滚了")
    }
</pre>
