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

    let box = UIView()
    box.translatesAutoresizingMaskIntoConstraints = false
    box.backgroundColor = .green
    view.addSubview(box)

    let blue = UIView()
    blue.translatesAutoresizingMaskIntoConstraints = false
    blue.backgroundColor = .blue
    box.addSubview(blue)

    let red = UIView()
    red.translatesAutoresizingMaskIntoConstraints = false
    red.backgroundColor = .red
    box.addSubview(red)

    let yellow = UIView()
    yellow.translatesAutoresizingMaskIntoConstraints = false
    yellow.backgroundColor = .yellow
    box.addSubview(yellow)

    // setup constraints

    box.fill(to: view)

    blue.pinTop(to: box, inset: 10)
    blue.fillHorizontal(to: box, insets: 10)
    blue.pinHeight(height: 90)

    red.pinBottom(to: box, inset: 10)
    red.fillHorizontal(to: box, insets: 10)
    red.pinHeight(height: 90)

    yellow.pinToTop(of: red, offset: 10)
    yellow.pinCenterX(to: red)
    yellow.pinSize(width: 50, height: 50)
  }
}

