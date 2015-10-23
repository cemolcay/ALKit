//
//  ALKit.swift
//  AutolayoutPlayground
//
//  Created by Cem Olcay on 22/10/15.
//  Copyright © 2015 prototapp. All rights reserved.
//
//  https://www.github.com/cemolcay/ALKit
//

import UIKit

extension UIEdgeInsets {
    init (inset: CGFloat) {
        top = inset
        bottom = inset
        left = inset
        right = inset
    }
}

extension UIView{

    convenience init (withAutolayout: Bool) {
        self.init(frame: CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
    }

    class func AutoLayout() -> UIView {
        let view = UIView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    func pin(
        inView inView: UIView? = nil,
        edge: NSLayoutAttribute,
        toEdge: NSLayoutAttribute,
        ofView: UIView?,
        withInset: CGFloat = 0) {
        let view = inView ?? ofView ?? self
        view.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: edge,
            relatedBy: .Equal,
            toItem: ofView,
            attribute: toEdge,
            multiplier: 1,
            constant: withInset))
    }

    // Pin

    func pinRight(inView inView: UIView? = nil, toView: UIView, withInset: CGFloat = 0) {
        pin(inView: inView, edge: .Right, toEdge: .Right, ofView: toView, withInset: -withInset)
    }

    func pinLeft(inView inView: UIView? = nil, toView: UIView, withInset: CGFloat = 0) {
        pin(inView: inView, edge: .Left, toEdge: .Left, ofView: toView, withInset: withInset)
    }

    func pinTop(inView inView: UIView? = nil, toView: UIView, withInset: CGFloat = 0) {
        pin(inView: inView, edge: .Top, toEdge: .Top, ofView: toView, withInset: withInset)
    }

    func pinBottom(inView inView: UIView? = nil, toView: UIView, withInset: CGFloat = 0) {
        pin(inView: inView, edge: .Bottom, toEdge: .Bottom, ofView: toView, withInset: -withInset)
    }

    // Pin To

    func pinToRight(inView inView: UIView? = nil, toView: UIView, withOffset: CGFloat = 0) {
        pin(inView: inView, edge: .Left, toEdge: .Right, ofView: toView, withInset: withOffset)
    }

    func pinToLeft(inView inView: UIView? = nil, toView: UIView, withOffset: CGFloat = 0) {
        pin(inView: inView, edge: .Right, toEdge: .Left, ofView: toView, withInset: -withOffset)
    }

    func pinToTop(inView inView: UIView? = nil, toView: UIView, withOffset: CGFloat = 0) {
        pin(inView: inView, edge: .Bottom, toEdge: .Top, ofView: toView, withInset: -withOffset)
    }

    func pinToBottom(inView inView: UIView? = nil, toView: UIView, withOffset: CGFloat = 0) {
        pin(inView: inView, edge: .Top, toEdge: .Bottom, ofView: toView, withInset: withOffset)
    }

    // Fill

    func fill(toView view: UIView, withInset: UIEdgeInsets = UIEdgeInsetsZero) {
        pinLeft(toView: view, withInset: withInset.left)
        pinRight(toView: view, withInset: withInset.right)
        pinTop(toView: view, withInset: withInset.top)
        pinBottom(toView: view, withInset: withInset.bottom)
    }

    func fillHorizontal(toView view: UIView, withInset: CGFloat = 0) {
        pinRight(toView: view, withInset: withInset)
        pinLeft(toView: view, withInset: withInset)
    }

    func fillVertical(toView view: UIView, withInset: CGFloat = 0) {
        pinTop(toView: view, withInset: withInset)
        pinBottom(toView: view, withInset: withInset)
    }

    // Size

    func pinSize(width width: CGFloat, height: CGFloat) {
        pinWidht(width)
        pinHeight(height)
    }

    func pinWidht(width: CGFloat) {
        pin(edge: .Width, toEdge: .NotAnAttribute, ofView: nil, withInset: width)
    }

    func pinHeight(height: CGFloat) {
        pin(edge: .Height, toEdge: .NotAnAttribute, ofView: nil, withInset: height)
    }

    // Center

    func pinCenter(toView view: UIView) {
        pinCenterX(toView: view)
        pinCenterY(toView: view)
    }

    func pinCenterX(toView view: UIView) {
        pin(edge: .CenterX, toEdge: .CenterX, ofView: view)
    }

    func pinCenterY(toView view: UIView) {
        pin(edge: .CenterY, toEdge: .CenterY, ofView: view)
    }
}

class ALScrollView: UIView {
    private var scrollView: UIScrollView!
    private var contentView: UIView!

    init () {
        super.init(frame: CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        scrollView = UIScrollView(withAutolayout: true)
        scrollView.fill(toView: self)
        addSubview(scrollView)
        contentView = UIView(withAutolayout: true)
        scrollView.addSubview(contentView)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func addSubview(view: UIView) {
        contentView.addSubview(view)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        var previousDeep: CGFloat = 0
        var previousFar: CGFloat = 0
        for subview in contentView.subviews {
            let deep = subview.frame.origin.y + subview.frame.size.height
            let far = subview.frame.origin.x + subview.frame.size.width
            if  deep > previousDeep {
                previousDeep = deep
            }
            if far > previousFar {
                previousFar = far
            }
        }
        contentView.frame.size = CGSize(width: previousFar, height: previousDeep)
        scrollView.contentSize = contentView.frame.size
    }
}

