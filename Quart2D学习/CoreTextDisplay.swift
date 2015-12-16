//
//  CoreTextDisplay.swift
//  Quart2D学习
//
//  Created by bestseller on 15/12/15.
//  Copyright © 2015年 lord. All rights reserved.
//

import Foundation
import CoreText
import UIKit
class CTDisplayView:UIView {
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let mubPath = CGPathCreateMutable()
        CGPathAddRect(mubPath, nil, rect)
        
        
        let mubString = NSAttributedString(string: "hello word every one")
        
//        let mubString = MarkUpParser().attrStringFromMarkup("Hello <font color=\"red\">core text <font color=\"blue\">world!")
        
        //绘制文本的区域
        let ctiframe = CTFramesetterCreateWithAttributedString(mubString)
        let range = CTFramesetterCreateFrame(ctiframe, CFRangeMake(0, mubString.length), mubPath, nil)
        
        
        //将坐标系上下翻转，对于底层的绘制引擎来说，屏幕的左下角是(0,0)坐标，而对于上层的UIKit来说，左上角是(0,0)坐标
        
        // TextMatrix 设置文字框的矩阵
        CGContextSetTextMatrix(context, CGAffineTransformIdentity)
        // TranslateCTM 变换矩阵
        CGContextTranslateCTM(context, 0, self.bounds.size.height)
        // 旋转
        CGContextScaleCTM(context, 1.0, -1.0)
        
        
        
        
        //开始绘制
        CTFrameDraw(range, context!)
    
//        CFRelese swift 中不必再调用此函数
        
        
        
    }
}