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
        
        makeView(true)
        goingMan()
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
    
    func animateToCorner(_ view: UIView, _ color: UIColor, _ position: Int, _ reverse: Bool) {
        let coord = returnCoord(position)
        UIView.animateKeyframes(
            withDuration: 3,
            delay: 0,
            options: .calculationModeLinear) {
                view.center = CGPoint(x: coord.0, y: coord.1)
                view.backgroundColor = color
        } completion: { use in
            if reverse {
                if position != 4 {
                    self.animateToCorner(view, self.returnColor(position), position + 1, reverse)
                } else {
                    self.animateToCorner(view, self.returnColor(position), position - 3, reverse)
                }
            } else {
                if position != 1 {
                    self.animateToCorner(view, self.returnColor(position), position - 1, reverse)
                } else {
                    self.animateToCorner(view, self.returnColor(position), position + 3, reverse)
                }
            }
        }
    }
    func viewToCorner(_ position: Int, _ reverse: Bool) {
        let coord = returnCoord(position)
        let view = UIView(frame: CGRect(x: coord.0, y: coord.1, width: 100, height: 100))
        view.backgroundColor = returnColor(position)
        self.view.addSubview(view)
        animateToCorner(view, returnColor(position), position, reverse)
    }
    
    func returnCoord(_ position: Int) -> (CGFloat, CGFloat) {
        let positions: Dictionary<Int, (CGFloat, CGFloat)> = [
            1 : (50, 50),
            2 : (50, self.view.bounds.height  - 50),
            3 : (self.view.bounds.width - 50, self.view.bounds.height  - 50),
            4 : (self.view.bounds.width  - 50, 50)]
        if let pos = positions[position] {
            return pos
        } else {
            return (0, 0)
        }
    }
    
    func returnColor(_ position: Int) -> UIColor {
        let colors = [ UIColor.blue, UIColor.orange, UIColor.red, UIColor.black ]
        return colors[position-1]
    }
    
    func makeView(_ reverse: Bool) {
        viewToCorner(1, reverse)
        viewToCorner(2, reverse)
        viewToCorner(3, reverse)
        viewToCorner(4, reverse)
    }
    
    func goingMan(){
        guard let img1 = UIImage(named: "img1.png") else {return}
        guard let img2 = UIImage(named: "img2.png") else {return}
        guard let img3 = UIImage(named: "img3.png") else {return}
        guard let img4 = UIImage(named: "img4.png") else {return}
        guard let img5 = UIImage(named: "img5.png") else {return}
        guard let img6 = UIImage(named: "img6.png") else {return}
        guard let img7 = UIImage(named: "img7.png") else {return}
        guard let img8 = UIImage(named: "img8.png") else {return}
        
        let imgArray: [UIImage] = [img1, img2, img3, img4, img5, img6 , img7, img8]
        let view = UIImageView(frame: CGRect(x: 0, y: 100, width: 50, height: 79))
        
        view.animationImages = imgArray
        
        view.startAnimating()
        self.view.addSubview(view)
        UIView.animate(withDuration: 5, delay: 1, options: .curveLinear) {
            view.center = CGPoint(x: self.view.bounds.width - view.frame.width / 2, y: 125)
        } completion: { cond in
            print(cond)
        }
    }
}

