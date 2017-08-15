//
//  CGGradientVC.swift
//  GradientView
//
//  Created by Harry Cao on 19/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

class CGGradientVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    setupRadialGradient()
  }
  
  func setupRadialGradient() {
    let gradientView = CGGradientView(frame: self.view.frame)
    self.view.addSubview(gradientView)
  }
}
