//
//  ViewController.swift
//  ALKit
//
//  Created by Cem Olcay on 22/10/15.
//  Copyright © 2015 prototapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    // setup views

    let box = UIView.AutoLayout()
    box.backgroundColor = UIColor.greenColor()
    view.addSubview(box)

    let blue = UIView.AutoLayout()
    blue.backgroundColor = UIColor.blueColor()
    box.addSubview(blue)

    let red = UIView.AutoLayout()
    red.backgroundColor = UIColor.redColor()
    box.addSubview(red)

    let yellow = UIView.AutoLayout()
    yellow.backgroundColor = UIColor.yellowColor()
    box.addSubview(yellow)

    // setup constraints

    box.fill(toView: view)

    blue.pinTop(toView: box, withInset: 10)
    blue.fillHorizontal(toView: box, withInset: 10)
    blue.pinHeight(90)

    red.pinBottom(toView: box, withInset: 10)
    red.fillHorizontal(toView: box, withInset: 10)
    red.pinHeight(90)

    yellow.pinToTop(ofView: red, withOffset: 10)
    yellow.pinCenterX(toView: red)
    yellow.pinSize(width: 50, height: 50)
  }
}

