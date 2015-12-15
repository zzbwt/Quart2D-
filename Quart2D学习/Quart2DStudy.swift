//
//  Quart2DStudy.swift
//  Quart2D学习
//
//  Created by bestseller on 15/12/11.
//  Copyright © 2015年 lord. All rights reserved.




/*
    第一种方法就是创建一个图片类型的上下文。调用UIGraphicsBeginImageContextWithOptions函数就可获得用来处理图片的图形上下文。利用该上下文，你就可以在其上进行绘图，并生成图片。调用UIGraphicsGetImageFromCurrentImageContext函数可从当前上下文中获取一个UIImage对象。记住在你所有的绘图操作后别忘了调用UIGraphicsEndImageContext函数关闭图形上下文
    UIGraphicsBeginImageContext(size: CGSize) 创建一个bitmap上下文
    可以通过 UIGraphicsGetCurrentContext() 获取当前的上下文
    
    第二种方法是利用cocoa为你生成的图形上下文。当你子类化了一个UIView并实现了自己的drawRect：方法后，一旦drawRect：方法被调用，Cocoa就会为你创建一个图形上下文，此时你对图形上下文的所有绘图操作都会显示在UIView上


*/


import Foundation
import UIKit


//第一种绘图形式：在UIView的子类方法drawRect：中绘制一个蓝色圆，使用UIKit在Cocoa为我们提供的当前上下文中完成绘图任务。
class firstDrawView:UIView {
    
    override func drawRect(rect: CGRect) {
        
        let path = UIBezierPath(ovalInRect: CGRectMake(100, 200, 100, 100))
        
        UIColor.cyanColor().setFill()
        
        path.fill()
        
    }
    
    
}
//第二种绘图形式：使用Core Graphics实现绘制蓝色圆。

class secondDrawView:UIView {
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextAddEllipseInRect(context, CGRectMake(100, 100, 100, 100))
        
        CGContextSetFillColorWithColor(context, UIColor.blueColor().CGColor)
        
        CGContextFillPath(context)
        
        
    }
}

/*第三种绘图形式：我将在UIView子类的drawLayer:inContext：方法中实现绘图任务。drawLayer:inContext：方法是一个绘制图层内容的代理方法。为了能够调用drawLayer:inContext：方法，我们需要设定图层的代理对象。但要注意，不应该将UIView对象设置为显示层的委托对象，这是因为UIView对象已经是隐式层的代理对象，再将它设置为另一个层的委托对象就会出问题。轻量级的做法是：编写负责绘图形的代理类。在MyView.h文件中声明如下代码：

@interfaceMyLayerDelegate:NSObject
@end
然后MyView.m文件中实现接口代码：

@implementationMyLayerDelegate
-(void)drawLayer:(CALayer*)layerinContext:(CGContextRef)ctx
{
    UIGraphicsPushContext(con);
    UIBezierPath*p=[UIBezierPathbezierPathWithOvalInRect:CGRectMake(0,0,100,100)];
    [[UIColor blueColor]setFill];
    [pfill];
    UIGraphicsPopContext();
}
@end
直接将代理类的实现代码放在MyView.m文件的#import代码的下面，这样感觉好像在使用私有类完成绘图任务（虽然这不是私有类）。需要注意的是，我们所引用的上下文并不是当前上下文，所以为了能够使用UIKit，我们需要将引用的上下文转变成当前上下文。

编写完代理类实现代码，接下来编写使用这个代理类的代码：

MyView*myView=[[MyViewalloc]initWithFrame:CGRectMake(0,0,320,480)];
CALayer *myLayer = [CALayer layer];
myLayer.delegate=self;
[myView.layeraddSublayer:myLayer];
[myView setNeedsDisplay];  // 调用此方法，<strong>drawLayer: inContext:</strong>方法才会被调用。
*/

/*
第四种绘图形式： 使用Core Graphics在drawLayer:inContext：方法中实现同样操作，代码如下：

-(void)drawLayer:(CALayer*)layinContext:(CGContextRef)con{
    CGContextAddEllipseInRect(con,CGRectMake(0,0,100,100));
    CGContextSetFillColorWithColor(con,[UIColorblueColor].CGColor);
    CGContextFillPath(con);
}

*/

/*
第五种形式 UIKit
UIGraphicsBeginImageContextWithOptions(CGSizeMake(100,100),NO,0);
UIBezierPath* p =[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0,100,100)];
[[UIColor blueColor]setFill];
[p fill];
UIImage*im=UIGraphicsGetImageFromCurrentImageContext();
UIGraphicsEndImageContext();
解释一下UIGraphicsBeginImageContextWithOptions函数参数的含义：第一个参数表示所要创建的图片的尺寸；第二个参数用来指定所生成图片的背景是否为不透明，如上我们使用YES而不是NO，则我们得到的图片背景将会是黑色，显然这不是我想要的；第三个参数指定生成图片的缩放因子，这个缩放因子与UIImage的scale属性所指的含义是一致的。传入0则表示让图片的缩放因子根据屏幕的分辨率而变化，所以我们得到的图片不管是在单分辨率还是视网膜屏上看起来都会很好。
*/
//第六种形式  使用Core Graphics实现

/*
    生成bitmap像位图，将bitmap像位图当做当前的上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100,100),NO,0);
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(con,CGRectMake(0,0,100,100));
    CGContextSetFillColorWithColor(con,[UIColorblueColor].CGColor);
    CGContextFillPath(con);
    UIImage* im=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
*/














// 当自定义view第一次显示出来的时候就会调用drawRect方法

class Quart2DLineView:UIView {

    override func drawRect(rect: CGRect) {
        
        // 1.取得和当前视图相关联的图形上下文(因为图形上下文决定绘制的输出目标)
        let context = UIGraphicsGetCurrentContext()
        
        // 2.设置起点
        
        CGContextMoveToPoint(context, 50, 200)
        
        // 3.设置终点
        CGContextAddLineToPoint(context, 100, 200)
        
        
        //设置绘图的状态
        
        // 4.设置线条颜色
        CGContextSetStrokeColorWithColor(context, UIColor.yellowColor().CGColor)
        
        // 5.设置线条宽度
        
        CGContextSetLineWidth(context, 10)
        
        // 6.设置起点圆角
        CGContextSetLineCap(context, .Round)
        
        
        CGContextStrokePath(context)
        
        
    }
    
}

class Quart2DLineViewProgress:UIView {

    
    var progess:CGFloat?
    
    var remeberProgress:CGFloat?
    
     func updateProgress(progress:CGFloat) {
        self.progess = progress
        setNeedsDisplay()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.yellowColor()
        self.progess = 0
        self.remeberProgress = 0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
     override func drawRect(rect: CGRect) {
        
        print("\(self.remeberProgress)\(self.progess)")
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextMoveToPoint(context, 0,0)
        
        CGContextAddLineToPoint(context, self.progess!, 0)
        
        //第二种设置颜色的方式
        
        UIColor.cyanColor().set()
        
        CGContextSetLineWidth(context, 2*rect.size.height)
        
        CGContextSetLineCap(context, .Butt)
        
        CGContextStrokePath(context)
        
        self.remeberProgress = self.progess
        
    }
    
}

//三角形
class Quart2DTriangleView:UIView {

    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextMoveToPoint(context, 100, 100)
        
        CGContextAddLineToPoint(context, 100, 200)
        
        CGContextAddLineToPoint(context, 50, 50)
        
        CGContextClosePath(context)
        
        //设置画笔颜色
        CGContextSetStrokeColorWithColor(context, UIColor.cyanColor().CGColor)
        
        CGContextStrokePath(context)
        
    }
}

//四边形

class Quart2DRectView: UIView {
    
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        
        CGContextAddRect(context, rect)
        
        CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)

        
        //设置填充颜色
        CGContextSetFillColorWithColor(context, UIColor.cyanColor().CGColor)
        
        //绘制空心方形 到layer
//        CGContextStrokePath(context)
        
        //绘制填充方形 到layer
        CGContextFillPath(context)
        
        
        //谁先绘制到layer上就呈现谁，不会被另外一种情况覆盖
    }
}

//绘制原型

class Quart2DRadiuView: UIView {
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextAddArc(context, 100, 100, 50, 0, 365, 0)
        
        
        
        //画笔方式，按路径来
//        CGContextStrokePath(context)
        
        
        //填充方式
        CGContextFillPath(context)
        
    }
}
