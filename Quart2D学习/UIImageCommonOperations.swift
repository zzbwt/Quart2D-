//
//  UIImageCommonOperations.swift
//  Quart2D学习
//
//  Created by bestseller on 15/12/14.
//  Copyright © 2015年 lord. All rights reserved.
//

import Foundation
import UIKit



class UIImageCommonViewController: UIViewController {
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.whiteColor()
        
//        horizontalMoving ()
        
//        scaleView ()
        
        rightSideView ()
        
        
    }
    
    func rightSideView () {
    
        let rightImage = UIImage(named: "girl.png")
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(rightImage!.size.width*0.5, rightImage!.size.height), false, 0)
        
        rightImage?.drawAtPoint(CGPointMake(-rightImage!.size.width*0.5, 0))
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        let showImageView = UIImageView(image: img)
        
        self.view.addSubview(showImageView)
        
        showImageView.center = self.view.center
        
    }
    
    
    func scaleView () {
        
        let scaleImage = UIImage(named: "girl.png")
        
        let scaleImageSize = scaleImage?.size
        
        //位图的绘制面积
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(scaleImageSize!.width*2, scaleImageSize!.height*2), false, 0)
        
        //Multiply至少有一个图像是暗色调的
        scaleImage?.drawInRect(CGRectMake(50, 50, scaleImageSize!.width*2, scaleImageSize!.height*2), blendMode:.Multiply, alpha: 1)
        
        scaleImage?.drawInRect(CGRectMake(200 , 200, scaleImageSize!.width*0.5, scaleImageSize!.height*0.5))
        
        
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        let showImageView = UIImageView(image: img)
        
        self.view.addSubview(showImageView)
        
        showImageView.center = self.view.center
        
    }
    
    func horizontalMoving () {
    
        
        let horizontalImage = UIImage(named: "girl.png")
        
        let horizontalSize = horizontalImage!.size
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(horizontalSize.width*2, horizontalSize.height), false, 0)
        
        //第一次绘制
        horizontalImage?.drawAtPoint(CGPointMake(0, 0))
        
        //第二次绘制
        horizontalImage?.drawAtPoint(CGPointMake(horizontalSize.width, 0))
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        let showImageView = UIImageView(image: img)
        
        self.view.addSubview(showImageView)
        
        showImageView.center = self.view.center
        
    }
}