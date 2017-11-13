//
//  ViewController.swift
//  ButtonView
//
//  Created by farheen banu on 11/8/17.
//  Copyright © 2017 Farheen Banu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  

  @IBOutlet weak var btnView: ButtonView!
  
  @IBOutlet weak var secondBtn: ButtonView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
   
//    secondBtn.didPressBigButton = {
//      print("second btn pressed BIG BUTTON")
//    }
  
//    secondBtn.didPressSmallButton = {
//      print("smol second btn")
//    }
//
//    btnView.didPressSmallButton = {
//      print("smol btnview")
//    }
  }
  
  @IBAction func viewActionTouchUPOutside(_ sender: ButtonView) {
    print("heyyyyyy")
  }
  @IBAction func viewAction(_ sender: ButtonView) {
    print("ugh")
    
    
//    btnView.didPressBigButton = {
//      print("btnView BIG BUTTON")
//    }
 
  }
  
  
  @IBAction func bigButtonTouchInside(_ sender: ButtonView) {
    print("big button")
  }
  
  
  @IBAction func smallButtonOutside(_ sender: ButtonView) {
    print("small button")
  }
  
  // MARK:- tiniest button
  
  @IBAction func longerSideBtn(_ sender: ButtonView) {
    print("long side ha")
  }
  
  
  @IBAction func smallSide(_ sender: ButtonView) {
    print("the other side")
  }
  
  
  
}

