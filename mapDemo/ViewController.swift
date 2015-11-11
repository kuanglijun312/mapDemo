//
//  ViewController.swift
//  mapDemo
//
//  Created by zm002 on 15/10/23.
//  Copyright © 2015年 zm002. All rights reserved.
//

import UIKit

class ViewController: UIViewController, QMapViewDelegate {

    var mapView:QMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        mapView = QMapView(frame: self.view.bounds)
        mapView.delegate = self
        self.view.addSubview(mapView)
        
        var annotations = [QPointAnnotation]()
        
        let red = QPointAnnotation()
        red.coordinate = CLLocationCoordinate2DMake(39.9042, 116.234)
        annotations.append(red)
        
        mapView.addAnnotations(annotations)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private let pointReuseIndetifier = "pointReuseIndetifier"
    func mapView(mapView: QMapView!, viewForAnnotation annotation: QAnnotation!) -> QAnnotationView! {
        guard let _ = annotation as? QPointAnnotation else {
            return nil
        }
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(pointReuseIndetifier)
        if annotationView == nil {
            annotationView = CustomCalloutView(annotation: annotation, reuseIdentifier: pointReuseIndetifier)
        }
        annotationView.canShowCallout = false
        
        return annotationView
    }
    
    
//    func mapView(mapView: QMapView!, didSelectAnnotationView view: QAnnotationView!) {
//        if let annotationView = view as? CustomCalloutView {
//            annotationView.setSelected(true, animated: true)
//        }
//    }
    
    
}

