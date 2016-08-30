//
//  ViewController.swift
//  ball
//
//  Created by le ha thanh on 7/14/16.
//  Copyright © 2016 le ha thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var ball = UIImageView()
    var radians = CGFloat()
    var ballRadious = CGFloat()
    var time = NSTimer()
    var deltaAngle: CGFloat = 0.1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBall()
        time = NSTimer.scheduledTimerWithTimeInterval(0.02, target:  self, selector: Selector("rollBall"), userInfo:  nil, repeats:  true)
    }
    
    func addBall(){
        let mainViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ballRadious = 32.0
        ball.center = CGPointMake(ballRadious, mainViewSize.height*0.5)
        self.view.addSubview(ball)
        
    }
    var vacham = 0
    func rollBall() {
        
        
        if ball.center.x < view.bounds.width - ballRadious && vacham == 0 {
            radians += deltaAngle
            ball.center = CGPointMake(ball.center.x + ballRadious * deltaAngle, ball.center.y)
            if ball.center.x > view.bounds.width - ballRadious {
                vacham = 1
            }
        }
        
        
        
        if ball.center.y < view.bounds.height - ballRadious && vacham == 1 {
            radians += deltaAngle
            ball.center = CGPointMake(ball.center.x, ball.center.y + ballRadious * deltaAngle)
            if ball.center.y > view.bounds.height - ballRadious {
                vacham = 2
            }
        }
        
        if ball.center.x > ballRadious && vacham == 2 {
            radians += deltaAngle
            ball.center = CGPointMake(ball.center.x - ballRadious * deltaAngle, ball.center.y)
            if ball.center.x < ballRadious {
                vacham = 3
            }
        }
        
        if ball.center.y > ballRadious && vacham == 3 {
            radians += deltaAngle
            ball.center = CGPointMake(ball.center.x, ball.center.y - ballRadious * deltaAngle)
            if ball.center.y < ballRadious {
                vacham = 0
            }
            
        }
        ball.transform = CGAffineTransformMakeRotation(radians)
    }
    
}

