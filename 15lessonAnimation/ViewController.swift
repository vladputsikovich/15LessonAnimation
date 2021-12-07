//
//  ViewController.swift
//  15lessonAnimation
//
//  Created by Владислав Пуцыкович on 6.12.21.
//

import UIKit

extension UIColor {
    func random() -> UIColor {
        return UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: CGFloat.random(in: 0...1)
        )
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        addView(x: 20, y: 20, width: 100, height: 100, option: UIView.KeyframeAnimationOptions.autoreverse)
//
//        addView(x: 20, y: 130, width: 100, height: 100, option: UIView.KeyframeAnimationOptions.allowUserInteraction)
//
//        addView(x: 20, y: 240, width: 100, height: 100, option: UIView.KeyframeAnimationOptions.allowUserInteraction)
//
//        addView(x: 20, y: 350, width: 100, height: 100, option: UIView.KeyframeAnimationOptions.allowUserInteraction)
//
//        addView(x: 20, y: 460, width: 100, height: 100, option: UIView.KeyframeAnimationOptions.allowUserInteraction)
        //let view = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        viewToCorner(x: 10, y: 10, width: 100, height: 100, position: 1)
        viewToCorner(x: 10, y: 10, width: 100, height: 100, position: 2)
        viewToCorner(x: 10, y: 10, width: 100, height: 100, position: 3)
        viewToCorner(x: 10, y: 10, width: 100, height: 100, position: 4)
        
    }
    
    func addView(x: Int, y: Int, width: Int, height: Int, option: UIView.KeyframeAnimationOptions) {
        let view = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        view.backgroundColor = UIColor.blue
        self.view.addSubview(view)
        
        UIView.animateKeyframes(
            withDuration: 5,
            delay: 1,
            options: option) {
                view.center = CGPoint(x: self.view.bounds.width - view.frame.width / 2, y: CGFloat(y) + view.frame.width / 2)
                view.backgroundColor = UIColor().random()
        } completion: { use in
            print(use)
        }
    }
    
    func animateToCorner(_ view: UIView, _ color: UIColor, _ position: Int) {
        let positions: Dictionary<Int, (CGFloat, CGFloat)> = [
            1 : (view.frame.width / 2, view.frame.height / 2),
            2 : (view.frame.width / 2, self.view.bounds.height  - view.frame.height / 2),
            3 : (self.view.bounds.width - view.frame.width / 2, self.view.bounds.height  - view.frame.height / 2),
            4 : (self.view.bounds.width  - view.frame.width / 2, view.frame.height / 2)]
        let colors = [ UIColor.blue, UIColor.orange, UIColor.red, UIColor.black]
        if let pos = positions[position] {
            print(pos.0)
            
            UIView.animateKeyframes(
                withDuration: 5,
                delay: 1,
                options: .allowUserInteraction) {
                    view.center = CGPoint(x: pos.0, y: pos.1)
                    view.backgroundColor = color
            } completion: { use in
                if position != 4 {
                    self.animateToCorner(view, colors[position - 1], position + 1)
                } else {
                    self.animateToCorner(view, colors[position - 1], position - 3)
                }
            }
        } else {
            print(position)
        }
    }
    func viewToCorner(x: Int, y: Int, width: Int, height: Int, position: Int) {
        let view = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        view.backgroundColor = UIColor.blue
        self.view.addSubview(view)
        animateToCorner(view, .blue, position)
    }
}

