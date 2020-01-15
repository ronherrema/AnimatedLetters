//
//  ViewController.swift
//  AnimatedLetters
//
//  Created by R J Herrema on 15/01/2020.
//  Copyright © 2020 R J Herrema. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var racetrack: CAShapeLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // instantiate a button and add it to the view
        let button = UIButton(type: .roundedRect)
        view.addSubview(button)
        
        // configure and locate the button
        button.setTitle("A", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 60)
        button.sizeToFit()
        button.setTitleColor(UIColor(red: CGFloat.random(in: 0.0 ... 1.0), green: CGFloat.random(in: 0.0 ... 1.0), blue: CGFloat.random(in: 0.0 ... 0.1), alpha: 1.0), for: .normal)
        button.center = CGPoint(x: CGFloat.random(in: 0.0 ... view.bounds.size.width),y: CGFloat.random(in: 0.0 ... view.bounds.size.height))
        
        // give the button an action to perform
        button.addTarget(self, action: #selector(displayLines), for: .touchUpInside)
        

    }
    
    @objc func displayLines() {
        
        // make a path
        let trackPath = UIBezierPath()
        trackPath.move(to: CGPoint(x: CGFloat.random(in: 0.0 ... view.bounds.size.width),y: CGFloat.random(in: 0.0 ... view.bounds.size.height)))
        trackPath.addCurve(to: CGPoint(x: CGFloat.random(in: 0.0 ... view.bounds.size.width),y: CGFloat.random(in: 0.0 ... view.bounds.size.height)),
                           controlPoint1: CGPoint(x: CGFloat.random(in: 0.0 ... view.bounds.size.width),y: CGFloat.random(in: 0.0 ... view.bounds.size.height)),
                           controlPoint2: CGPoint(x: CGFloat.random(in: 0.0 ... view.bounds.size.width),y: CGFloat.random(in: 0.0 ... view.bounds.size.height)))
        trackPath.addCurve(to: CGPoint(x: CGFloat.random(in: 0.0 ... view.bounds.size.width),y: CGFloat.random(in: 0.0 ... view.bounds.size.height)),
                           controlPoint1: CGPoint(x: CGFloat.random(in: 0.0 ... view.bounds.size.width),y: CGFloat.random(in: 0.0 ... view.bounds.size.height)),
                           controlPoint2: CGPoint(x: CGFloat.random(in: 0.0 ... view.bounds.size.width),y: CGFloat.random(in: 0.0 ... view.bounds.size.height)))
        
        // make a layer for drawing
        racetrack = CAShapeLayer()
        
        // add the path to the layer and configure it
        racetrack?.path = trackPath.cgPath
        racetrack?.strokeColor = UIColor(red: CGFloat.random(in: 0.0 ... 1.0), green: CGFloat.random(in: 0.0 ... 1.0), blue: CGFloat.random(in: 0.0 ... 0.1), alpha: 1.0).cgColor
        racetrack?.fillColor = UIColor.clear.cgColor
        racetrack?.lineWidth = 3.0
        
        // add the layer to the view
        view.layer.addSublayer((racetrack ?? nil)!)
        
        // create an animation and add it to the path
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 3.0
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        racetrack?.add(pathAnimation, forKey: "strokeEnd")

    }

}

