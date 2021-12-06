//
//  ViewController.swift
//  15lessonAnimation
//
//  Created by Владислав Пуцыкович on 6.12.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = addView(x: 20, y: 20, width: 100, height: 100, option: UIView.KeyframeAnimationOptions.calculationModeDiscrete)
        
        _ = addView(x: 20, y: 130, width: 100, height: 100, option: UIView.KeyframeAnimationOptions.allowUserInteraction)
        
        _ = addView(x: 20, y: 240, width: 100, height: 100, option: UIView.KeyframeAnimationOptions.allowUserInteraction)
        
        _ = addView(x: 20, y: 350, width: 100, height: 100, option: UIView.KeyframeAnimationOptions.allowUserInteraction)
        
        _ = addView(x: 20, y: 460, width: 100, height: 100, option: UIView.KeyframeAnimationOptions.allowUserInteraction)
    }
    
    func addView(x: Int, y: Int, width: Int, height: Int, option: UIView.KeyframeAnimationOptions) -> UIView {
        let view = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        view.backgroundColor = UIColor.blue
        self.view.addSubview(view)
        
        UIView.animateKeyframes(
            withDuration: 5,
            delay: 1,
            options: option) {
                view.center = CGPoint(x: self.view.bounds.width - view.frame.width / 2, y: CGFloat(y) + view.frame.width / 2)
                view.backgroundColor = UIColor(
                    red: CGFloat.random(in: 0...1),
                    green: CGFloat.random(in: 0...1),
                    blue: CGFloat.random(in: 0...1),
                    alpha: 1.0
                )
        } completion: { use in
            print(use)
        }
        return view
    }
}

