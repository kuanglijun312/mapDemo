//
//  ViewController.swift
//  mapDemo
//
//  Created by zm002 on 15/10/23.
//  Copyright © 2015年 zm002. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        let mapView = QMapView(frame: self.view.bounds)
        self.view.addSubview(mapView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

