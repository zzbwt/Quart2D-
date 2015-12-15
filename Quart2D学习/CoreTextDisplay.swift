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
        
    }
}