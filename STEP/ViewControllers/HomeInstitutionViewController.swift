//
//  HomeInstitutionViewController.swift
//  STEP
//
//  Created by taima shrafi on 02/11/2021.
//

import UIKit

class HomeInstitutionViewController: UIViewController {

    @IBOutlet weak var testView: UIView!
    var tapGestureRecognizer: UITapGestureRecognizer!

       var firstPoint: CGPoint?
       var secondPoint: CGPoint?

       override func viewDidLoad() {
           super.viewDidLoad()

           tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.showMoreActions(touch:)))
           view.addGestureRecognizer(tapGestureRecognizer)
       }

     @objc func showMoreActions(touch: UITapGestureRecognizer) {
           let touchPoint = touch.location(in: self.view)

           guard let _ = firstPoint else {
               firstPoint = CGPoint(x: 0.0, y: self.testView.frame.size.height)
               return
           }

           guard let _  = secondPoint else {
               secondPoint = touchPoint
               addLine(fromPoint: firstPoint!, toPoint: secondPoint!)

               //firstPoint = nil
               secondPoint = nil

               return
           }
       }

       func addLine(fromPoint start: CGPoint, toPoint end:CGPoint) {
           let line = CAShapeLayer()
           let linePath = UIBezierPath()
           linePath.move(to: start)
           linePath.addLine(to: end)
           line.path = linePath.cgPath
           line.strokeColor = UIColor.red.cgColor
           line.lineWidth = 1
           line.lineJoin = CAShapeLayerLineJoin.round
           self.view.layer.addSublayer(line)
       }

}
