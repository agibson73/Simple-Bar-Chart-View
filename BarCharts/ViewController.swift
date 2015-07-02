//
//  ViewController.swift
//  BarCharts
//
//  Created by Steven Gibson on 7/2/15.
//  Copyright (c) 2015 OakmontTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var barChartsView: BezierBarCharts!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var valuesForChart : NSMutableArray = [0.5,0.9,0.6,0.3,0.97]
        var colorsForChart = [UIColor.redColor(),UIColor.blueColor(),UIColor.yellowColor(),UIColor.greenColor(),UIColor.purpleColor()]
        
        barChartsView.colors = colorsForChart
        barChartsView.chartValues = valuesForChart
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

