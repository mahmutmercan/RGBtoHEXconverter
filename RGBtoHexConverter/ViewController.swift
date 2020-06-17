//
//  ViewController.swift
//  RGBtoHexConverter
//
//  Created by Sirius on 17.06.2020.
//  Copyright © 2020 Jaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textRed: UITextField!
    @IBOutlet weak var textGreen: UITextField!
    @IBOutlet weak var textBlue: UITextField!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var buttonConvert: UIButton!
    @IBOutlet weak var labelSelectedColor: UILabel!
    var secilenIndex : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        secilenIndex = sender.selectedSegmentIndex
        if secilenIndex == 0 {
            buttonConvert.setTitle("RGB - HEX Cevir", for: UIControl.State.normal)
        
        } else {
            buttonConvert.setTitle("HEX - RGB Cevir", for: UIControl.State.normal)
            labelResult.text?.removeAll()
            textRed.text?.removeAll()
            textBlue.text?.removeAll()
            textGreen.text?.removeAll()
            labelSelectedColor.backgroundColor = UIColor.white
        }


    }
    
    @IBAction func buttonConvertClicked(_ sender: Any) {
        
        if secilenIndex == 0 {
            // RGB to HEX
            convertRGBtoHEX()
        } else {
            // HEX to RGB
            convertHEXtoRGB()
            
            
        }
        
    }
    func convertRGBtoHEX() {
        if let redValue = UInt8(textRed.text!) {
            if let greenValue = UInt8(textGreen.text!) {
                if let blueValue = UInt8(textBlue.text!) {
                    //buraya kadar gelindiyse herşey yolunda.
                    let redHex = String(format: "%2X" , redValue)
                    let greenHex = String(format: "%2X", greenValue)
                    let blueHex = String(format: "%2X", blueValue)
                    labelResult.text = "(HEX Color : #\(redHex)\(greenHex)\(blueHex))"
                    labelSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                }
            }
        }
        
    }
    func convertHEXtoRGB() {
        
        if let redValue = UInt8(textRed.text!, radix: 16) {
            if let greenValue = UInt8(textGreen.text!, radix: 16) {
                if let blueValue = UInt8(textBlue.text!, radix: 16) {
                    
                    labelResult.text = " Red : \(redValue) \n Green : \(greenValue) \n Blue : \(blueValue)"
                    labelSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                    
                }
            }
        }
    }
}

