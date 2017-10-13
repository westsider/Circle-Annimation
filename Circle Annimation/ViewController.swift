//
//  ViewController.swift
//  Circle Annimation
//
//  Created by Warren Hansen on 10/12/17.
//  Copyright © 2017 Warren Hansen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var someView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = someView.bounds
        replicatorLayer.instanceCount = 30
        replicatorLayer.instanceDelay = CFTimeInterval(1 / 30.0)
        replicatorLayer.preservesDepth = false
        replicatorLayer.instanceColor = UIColor.white.cgColor
        
        replicatorLayer.instanceRedOffset = -0.5
        replicatorLayer.instanceGreenOffset = -0.5
        replicatorLayer.instanceBlueOffset = -0.5
        replicatorLayer.instanceAlphaOffset = 0.0
        
        let angle = Float(Double.pi * 2.0) / 30
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)
        someView.layer.addSublayer(replicatorLayer)
        
        let instanceLayer = CALayer()
        let layerWidth: CGFloat = 10.0
        let midX = someView.bounds.midX - layerWidth / 2.0
        instanceLayer.frame = CGRect(x: midX, y: 0.0, width: layerWidth, height: layerWidth * 3.0)
        instanceLayer.backgroundColor = UIColor.white.cgColor
        replicatorLayer.addSublayer(instanceLayer)
        
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.fromValue = 1.0
        fadeAnimation.toValue = 0.0
        fadeAnimation.duration = 1
        fadeAnimation.repeatCount = Float.greatestFiniteMagnitude
        
        instanceLayer.opacity = 0.0
        instanceLayer.add(fadeAnimation, forKey: "FadeAnimation")
        
    }
    
    
    @IBAction func animateAction(_ sender: Any) {
        
    }
    
}

