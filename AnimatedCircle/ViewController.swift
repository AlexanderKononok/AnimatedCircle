//
//  ViewController.swift
//  AnimatedCircle
//
//  Created by Alexander Kononok on 10/4/20.
//

import UIKit

class ViewController: UIViewController {

  
  @IBOutlet weak var fieldView: UIView!
  @IBOutlet weak var startButton: UIButton!
  
  let circleSize: CGFloat = 100
  
  var circle: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //circle
    
    circle = UIView()
    circle.frame = CGRect(x: 0, y: 0, width: circleSize, height: circleSize)
    circle.layer.cornerRadius = CGFloat(circleSize / 2)
    circle.backgroundColor = .orange
    fieldView.addSubview(circle)
    
    startButton.layer.cornerRadius = startButton.frame.width / 6
  }

  @IBAction func startButtonPressed(_ sender: Any) {
    animateCircle(direction: .right, duration: 2) {
      self.animateCircle(direction: .down, duration: 4) {
        self.animateCircle(direction: .left, duration: 2) {
          self.animateCircle(direction: .up, duration: 4) {
            print("FINISH")
          }
        }
      }
    }
  }
  
  func animateCircle(direction: Direction, duration: Int, completion: @escaping () -> ()) {
    UIView.animate(withDuration: TimeInterval(duration), delay: 0, options: [.curveLinear], animations: {
      switch direction {
      case .up:
        self.circle.center = CGPoint(x: self.fieldView.frame.minX + self.circleSize / 2, y: self.fieldView.frame.minY)
      case .down:
        self.circle.center = CGPoint(x: self.fieldView.frame.maxX - self.circleSize / 2, y: self.fieldView.frame.maxY - self.circleSize)
      case .right:
        self.circle.center = CGPoint(x: self.fieldView.frame.width - self.circleSize / 2, y: self.fieldView.frame.minY)
      case .left:
        self.circle.center = CGPoint(x: self.fieldView.frame.minX + self.circleSize / 2, y: self.fieldView.frame.maxY - self.circleSize)
      }
    }) { (_) in
      completion()
    }
  }
  
}

