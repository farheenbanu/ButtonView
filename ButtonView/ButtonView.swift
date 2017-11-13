//
//  ButtonView.swift
//  ButtonView
//
//  Created by farheen banu on 11/8/17.
//  Copyright © 2017 Farheen Banu. All rights reserved.
//

import UIKit
extension UIView {
  // MARK:- bezier path for left side curve in the small button
  func curveLeft(targetView: UIView) {
    let myBezier = UIBezierPath()
    myBezier.move(to: CGPoint(x: targetView.frame.size.width / 7, y: 0))
    myBezier.addQuadCurve(to: CGPoint(x: targetView.frame.size.width/7, y: targetView.frame.size.height) , controlPoint: CGPoint(x: -targetView.frame.size.width / 7, y: targetView.frame.size.height / 2 ) )
    myBezier.addLine(to: CGPoint(x: targetView.frame.size.width, y: targetView.frame.size.height))
    myBezier.addLine(to: CGPoint(x: targetView.frame.size.width, y: 0))
    myBezier.close()
    let mask = CAShapeLayer()
    mask.path = myBezier.cgPath
    targetView.layer.mask = mask
    targetView.layer.masksToBounds = true
  }
}

class ButtonView: UIControl {
  //inspectable in the interface builder, circle on makes the button view circular
  @IBInspectable var circle : Bool = false {
    didSet{
      self.setNeedsDisplay()
    }
  }
  
  // MARK:- left side slight curve
  @IBInspectable var leftCurveSmallButton: Bool = true {
    didSet{
      self.setNeedsDisplay()
    }
  }
  
  //corner radius default is set to 10.0 you can give any value to it according to your requirements
  @IBInspectable var viewCornerRadius : CGFloat = 0.0 {
    didSet{
      self.setNeedsDisplay()
    }
  }
  // MARK:- title for long button inside a view
  @IBInspectable var titleForLB : String = ""{
    didSet{
      self.labelTitle.text =  titleForLB
     // self.longButton.setTitle(titleForLB, for: .normal)
      self.setNeedsDisplay()
    }
  }
  // MARK:- title text color
  @IBInspectable var titleColor : UIColor = UIColor.white {
    didSet{
       self.labelTitle.textColor = titleColor
       self.setNeedsDisplay()
    }
  }
   // MARK:- title font
 // custom font with sizes varying with devices
//    @IBInspectable var textFont : Int = FontType.Default.rawValue{
//      didSet{
//        self.labelTitle.font = FontType.getFont(rawValue: textFont)
//        setNeedsDisplay()
//      }
//    }
  
  // MARK:- image for small button
  @IBInspectable var imageForSB : UIImage? = nil {
    didSet{
      smallButton.setImage(imageForSB, for: .normal)
      smallButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
      self.setNeedsDisplay()
    }
  }
  // MARK:- bg color for small button
  @IBInspectable var smallBtnBackgroundColor : UIColor = UIColor.clear{
    didSet{
      self.setNeedsDisplay()
    }
  }
  //add color to button border
  @IBInspectable var viewBorderColor : UIColor = UIColor.clear{
    didSet{
      self.setNeedsDisplay()
    }
  }
  //add border width
  @IBInspectable var viewBorderWidth : CGFloat = 0.0{
    didSet{
      self.setNeedsDisplay()
    }
  }

  let longButton : UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  let smallButton : UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  let labelTitle : UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    createSubViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    createSubViews()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupLongBtn()
  }
  
  
  // MARK:- draw rect
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    if circle == true{
      self.layer.cornerRadius = self.frame.height/2
    }else{
      self.layer.cornerRadius = viewCornerRadius
    }
    self.layer.borderWidth = viewBorderWidth
    self.layer.borderColor = viewBorderColor.cgColor
    self.smallButton.backgroundColor = smallBtnBackgroundColor
    if leftCurveSmallButton {
      smallButton.curveLeft(targetView: self.smallButton)
    }
    self.layer.masksToBounds = true
  }

  func createSubViews() {
    self.addSubview(longButton)
    self.addSubview(labelTitle)
    self.addSubview(smallButton)
    longButton.addTarget(self, action: #selector(btnBig(_:)), for: .touchUpInside)
    smallButton.addTarget(self, action: #selector(btnSmall(_:)), for: .touchUpInside)
  }
  
  @objc func btnBig(_ sender: UIButton){
    sendActions(for: .touchUpInside)
  }
  
  @objc func btnSmall(_ sender: UIButton){
    sendActions(for: .touchUpOutside)
  }
  
  func setupLongBtn() {
    longButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    longButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    longButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    longButton.trailingAnchor.constraint(equalTo: smallButton.leadingAnchor).isActive = true
    smallButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    smallButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    smallButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    smallButton.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/1).isActive = true
    labelTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    labelTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
  }
  

  
}


