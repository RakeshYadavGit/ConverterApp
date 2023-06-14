//
//  ViewController.swift
//  DemoProject
//
//  Created by Rakesh Yadav on 13/06/23.
//

import UIKit

extension Double{
    func convertToFahrnhite() -> Double {
        return ((self * 1.8000) + 32)
    }
    
    func convertCelsius() -> Double {
        return ((self - 32) / 1.8000)
    }
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    var appMessageLabel: UILabel!
    var conversionMessage: UILabel!
    var celsiusTextField: UITextField!
    var fahrenheitTextField: UITextField!
    var rightArrow: UILabel!
    var leftArrow: UILabel!
    var calculationMessage: UILabel!
    var clickButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = UIColor.lightGray
        appMessageLabel = UILabel()
        appMessageLabel.text = "This is example of Extension"
        appMessageLabel.font = UIFont.systemFont(ofSize: 20)
        appMessageLabel.textColor = UIColor.red
        appMessageLabel.textAlignment = .center
        appMessageLabel.frame = CGRect(x: 60, y: 100, width: 250, height: 20)
        view.addSubview(appMessageLabel)
        
        conversionMessage = UILabel()
        conversionMessage.text = String()
        conversionMessage.textColor = UIColor.blue
        conversionMessage.textAlignment = .center
        conversionMessage.frame = CGRect(x: 80, y: 150, width: 200, height: 20)
        view.addSubview(conversionMessage)
        
        celsiusTextField = UITextField()
        celsiusTextField.placeholder = "Celsius"
        celsiusTextField.textColor = UIColor.black
        celsiusTextField.borderStyle = .roundedRect
        celsiusTextField.delegate = self
        celsiusTextField.frame = CGRect(x: 25 , y: 250, width: 130, height: 40)
        view.addSubview(celsiusTextField)
        
        fahrenheitTextField = UITextField()
        fahrenheitTextField.placeholder = "Fahrenheit"
        fahrenheitTextField.textColor = UIColor.black
        fahrenheitTextField.borderStyle = .roundedRect
        fahrenheitTextField.delegate = self
        fahrenheitTextField.frame = CGRect(x: 240, y: 250, width: 130, height: 40)
        view.addSubview(fahrenheitTextField)
        
        rightArrow = UILabel()
        rightArrow.textColor = UIColor.black
        rightArrow.font = UIFont.systemFont(ofSize: 18)
        rightArrow.text = "\u{2501}\u{2192}"
        rightArrow.frame = CGRect(x: 180, y: 270, width: 76, height: 20)
        view.addSubview(rightArrow)
        
        leftArrow = UILabel()
        leftArrow.textColor = UIColor.black
        leftArrow.font = UIFont.systemFont(ofSize: 18)
        leftArrow.text = "\u{2190}\u{2501}"
        leftArrow.frame = CGRect(x: 180, y: 250, width: 60, height: 20)
        view.addSubview(leftArrow)
        
        calculationMessage = UILabel()
        calculationMessage.text = String()
        calculationMessage.textColor = UIColor.black
        calculationMessage.textAlignment = .center
        calculationMessage.frame = CGRect(x:75 , y: 300, width: 250, height: 40)
        view.addSubview(calculationMessage)
        
        clickButton = UIButton(type: .system)
        clickButton.setTitle("Convert", for: .normal)
        clickButton.layer.cornerRadius = 8
        clickButton.layer.borderColor = UIColor.black.cgColor
        clickButton.layer.borderWidth = 1.0
        clickButton.frame = CGRect(x: 120, y: 350, width: 150, height: 50)
        clickButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(clickButton)
    
    }
    
    @objc func buttonTapped(){
        
        if let celsiusText = celsiusTextField.text, let doubleCelsius = Double(celsiusText){
            fahrenheitTextField.text = String(doubleCelsius.convertToFahrnhite().rounded())
            calculationMessage.text = celsiusText + " °C is equal to " + String(doubleCelsius) + " °F"
        }
        
        if let fahrenheitText = fahrenheitTextField.text, let doubleFahrenheit = Double(fahrenheitText){
            celsiusTextField.text = String(doubleFahrenheit.convertCelsius().rounded())
            calculationMessage.text = fahrenheitText + " °F is equal to " + String(doubleFahrenheit) + " °C"
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if(textField == celsiusTextField){
            conversionMessage.text = String("Celsius to Fahrenheit")
            fahrenheitTextField.text = ""
        }
        if(textField == fahrenheitTextField){
            conversionMessage.text = String("Fahrenheit to Celsius")
            celsiusTextField.text = ""
                    }
    }
}

