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
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let box = UIView.AutoLayout()
        box.backgroundColor = UIColor.greenColor()
        box.fill(toView: view, withInset: UIEdgeInsets(inset: 20))
        view.addSubview(box)

        let topPin = UIView.AutoLayout()
        topPin.backgroundColor = UIColor.redColor()
        topPin.pinSize(width: 50, height: 50)
        topPin.pinBottom(toView: box, withInset: 10)
        topPin.pinCenterX(toView: box)
        box.addSubview(topPin)

        let fillW = UIView.AutoLayout()
        fillW.backgroundColor = UIColor.blueColor()
        fillW.fillWidth(toView: box, withInset: 10)
        fillW.pinHeight(50)
        fillW.pinTop(toView: box, withInset: 10)
        box.addSubview(fillW)
    }
}

