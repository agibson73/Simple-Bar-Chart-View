//
//  BezierBarCharts.swift
//  TestCircle
//
//  Created by Steven Gibson on 6/26/15.
//  Copyright (c) 2015 OakmontTech. All rights reserved.
//

import UIKit

class BezierBarCharts: UIView {

    var chartValues : NSMutableArray = []{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var colors : [UIColor]!
    var roundedCharts = false
   

    
    // just colors that are used to demonstrate
    let green = UIColor.greenColor()
    let blue = UIColor.blueColor()
    let red = UIColor.redColor()
    
    // empty state color
    var gray = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // just placeHolders
        chartValues = [0.75, 0.6, 0.8]
        colors = [red,blue,green]
        self.backgroundColor = UIColor.clearColor()
        
    }
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        var context = UIGraphicsGetCurrentContext();
        CGContextClearRect(context, rect);
        
        var height = self.bounds.size.height
        var count = 0;
        // space between graphs
        var spacer : CGFloat = CGFloat(self.frame.size.width * 0.10)
        // Find Midpoint of all bars and set position based on spacers and graphs
        var spaceAvailable = self.frame.width - CGFloat(spacer * CGFloat(chartValues.count + 1))
        var barWidth = spaceAvailable / CGFloat(chartValues.count)
        
        //rect of graphs views starting at 0,0
        var barR = CGRectMake(0, 0,barWidth, height)
        
        if roundedCharts == true{
        for var count = 0 ; count < chartValues.count ; count++ {
            
            var chartValue = chartValues[count] as! CGFloat
            
           
            
            if count > 0{
                
    
                var x = spacer * CGFloat(count + 1) + barWidth * CGFloat(count)
                // background
                var backGroundRect = CGRectMake(x, 0, barWidth, self.frame.height * (1 - chartValue))
              
                var barRect = CGRectMake(x, self.frame.height - chartValue * height, barWidth, self.frame.height * chartValue)
                var bezierPath = UIBezierPath(roundedRect: barRect, byRoundingCorners: UIRectCorner.BottomLeft | UIRectCorner.BottomRight, cornerRadii:CGSizeMake(barWidth * 2, barWidth * 2))
                CGContextSetFillColorWithColor(context, colors[count].CGColor);
                bezierPath.fill()
                
                
                 var topBezier = UIBezierPath(roundedRect: backGroundRect, byRoundingCorners: UIRectCorner.TopRight | UIRectCorner.TopLeft, cornerRadii:CGSizeMake(barWidth * 2, barWidth * 2))
                CGContextSetFillColorWithColor(context, gray.CGColor);
                topBezier.fill()
                
                
                
            }
            else
            {
                var x = spacer + barWidth * CGFloat(count)
               
                // background
                var backGroundRect = CGRectMake(x, 0, barWidth, self.frame.height * (1 - chartValue))
               var barRect = CGRectMake(x, self.frame.height - chartValue * height, barWidth, self.frame.height * chartValue)
                
                var bezierPath = UIBezierPath(roundedRect: barRect, byRoundingCorners: UIRectCorner.BottomLeft | UIRectCorner.BottomRight, cornerRadii:CGSizeMake(barWidth * 2, barWidth * 2))
                CGContextSetFillColorWithColor(context, colors[count].CGColor);
                bezierPath.fill()
                
                
                var topBezier = UIBezierPath(roundedRect: backGroundRect, byRoundingCorners: UIRectCorner.TopRight | UIRectCorner.TopLeft, cornerRadii:CGSizeMake(barWidth * 2, barWidth * 2))
                CGContextSetFillColorWithColor(context, gray.CGColor);
                topBezier.fill()
                
                
               
                
            }
        }
        
        
        }
        else
        {
            for var count = 0 ; count < chartValues.count ; count++ {
                
                var chartValue = chartValues[count] as! CGFloat
                
                
                
                if count > 0{
                    
                    
                    var x = spacer * CGFloat(count + 1) + barWidth * CGFloat(count)
                    // background
                    var backGroundRect = CGRectMake(x, 0, barWidth, self.frame.height * (1 - chartValue))
                    
                    var barRect = CGRectMake(x, self.frame.height - chartValue * height, barWidth, self.frame.height * chartValue)
                    
                    var bezierPath = UIBezierPath(rect: barRect)
                   
                    CGContextSetFillColorWithColor(context, colors[count].CGColor);
                    bezierPath.fill()
                    
                    var topBezier = UIBezierPath(rect: backGroundRect)
                    CGContextSetFillColorWithColor(context, gray.CGColor);
                    topBezier.fill()
                    
                    
                    
                }
                else
                {
                    var x = spacer + barWidth * CGFloat(count)
                    
                    // background
                    var backGroundRect = CGRectMake(x, 0, barWidth, self.frame.height * (1 - chartValue))
                    var barRect = CGRectMake(x, self.frame.height - chartValue * height, barWidth, self.frame.height * chartValue)
                    
                    var bezierPath = UIBezierPath(rect: barRect)
                    
                    CGContextSetFillColorWithColor(context, colors[count].CGColor);
                    bezierPath.fill()
                    
                    var topBezier = UIBezierPath(rect: backGroundRect)
                    CGContextSetFillColorWithColor(context, gray.CGColor);
                    topBezier.fill()
                    
                    
                    
                    
                }
            }
        }
    }
    
    
}



