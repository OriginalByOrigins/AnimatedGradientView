//
//  CGGradientView.swift
//  GradientView
//
//  Created by Harry Cao on 19/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

class CGGradientView: UIView {
  
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
      // create CFArray of color
      let colors = [UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.cyan.cgColor] as CFArray
      
      // get center point
      let center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
      
      // create outer radius
      let endRadius = sqrt(pow(self.bounds.width/2, 2) + pow(self.bounds.height/2, 2))
      
      // create gradient object
      guard
        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: [0, 0.3, 1]),
        let context = UIGraphicsGetCurrentContext()
      else { return }
      
      // - 2 circle can have 2 different centers
      // - circle can be a circle with radius or 1 point (cicle with radius = 0)
      // - .drawBeforeStartLocation: draw inside startCircle
      //   .drawAfterEndCircle : draw outside of the endCircle
      context.drawRadialGradient(gradient, startCenter: center, startRadius: 0, endCenter: center, endRadius: endRadius, options: .drawsBeforeStartLocation)
    }

}
