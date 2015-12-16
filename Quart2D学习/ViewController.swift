//
//  ViewController.swift
//  Quart2D学习
//
//  Created by bestseller on 15/12/11.
//  Copyright © 2015年 lord. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lineViewProgress:Quart2DLineViewProgress!
    var progress:CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()

      
        
        contextDisplay()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func contextDisplay () {
        let contextDisplayView = CTDisplayView(frame:self.view.bounds)
        contextDisplayView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(contextDisplayView)
    }
    
    func secondeDrawViewFunc () {
    
        let drawView = secondDrawView(frame:self.view.bounds)
        drawView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(drawView)
        
    }
    
    
    
    func firstDrawViewFunc () {
        let drawView = firstDrawView(frame:self.view.bounds)
        drawView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(drawView)
        
        
    }
    
    func addQuart2DRadiuView () {
    
        let radiuView = Quart2DRadiuView(frame:CGRectMake(100,100,200,200))
        radiuView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(radiuView)
        
    }
    
    func addQuart2DRectView() {
    
        let rectView = Quart2DRectView(frame:CGRectMake(100,100,200,200))
        rectView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(rectView)
    }
    
    func addQuart2DTriangleView () {
        let triangleView = Quart2DTriangleView(frame:self.view.bounds)
        
        self.view.addSubview(triangleView)
    }
    
    func addQuart2DLineViewProgess() {
        
        lineViewProgress = Quart2DLineViewProgress(frame:CGRectMake(100,200,100,10))
        self.view.addSubview(lineViewProgress)
        
        progress = 0;
        
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "dealProgress", userInfo: nil, repeats: true)
        
    }
    
    func dealProgress () {
        print("dealProgress")
        lineViewProgress.updateProgress(progress!++)
        
    }
    
    func  addQuart2DLineView() {
    
        let lineView = Quart2DLineView(frame:CGRectMake(100,100,100,10))
        
        self.view.addSubview(lineView)
        
    }
}

