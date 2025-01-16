//
//  ViewController.swift
//  PractiseSwift
//
//  Created by LUIS GONZALEZ on 11/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myProgressView: UIProgressView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    // variables
    private let myPickerViewValues = ["Uno","Dos","Tres","Cuatro","Cinco"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // buttons
        myButton.setTitle("Mi nuevo boton", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        
        //pickers
        myPickerView.backgroundColor = .lightGray
        myPickerView.dataSource = self // ayuda a cargar datos en la vista
        myPickerView.delegate = self // delegado sobre el view controller
        myPickerView.isHidden = true
        
        // page controls
        myPageControl.numberOfPages = myPickerViewValues.count
        myPageControl.currentPageIndicatorTintColor = .blue
        myPageControl.pageIndicatorTintColor = .lightGray
        
        // segmented control
        mySegmentedControl.removeAllSegments()
        for (index, value) in myPickerViewValues.enumerated(){
            mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        
        // sliders
        mySlider.minimumTrackTintColor = .red
        mySlider.minimumValue = 1
        mySlider.maximumValue = Float(myPickerViewValues.count)
        mySlider.value = 1
        
        // Stepper
        myStepper.minimumValue = 0
        myStepper.maximumValue = Double(myPickerViewValues.count)
        
        // Stepper
        mySwitch.onTintColor = .purple
        mySwitch.isOn = false
        
        // Progress Indicator
        
        myProgressView.progress = 0
        
        // activity indicator
        myActivityIndicator.color = .green
        myActivityIndicator.startAnimating()
        myActivityIndicator.hidesWhenStopped = true
    }
    
    
    
    @IBAction func mySwitchAction(_ sender: Any) {
        
        if mySwitch.isOn {
            myPickerView.isHidden = false
            myActivityIndicator.stopAnimating()
          
        }else{
            myPickerView.isHidden = true
            myActivityIndicator.startAnimating()
        }
    }
    
    
    @IBAction func myStepperAction(_ sender: Any) {
        let value = myStepper.value
        mySlider.value = Float(value)
    }
    
    
    @IBAction func mySliderAction(_ sender: Any) {
        
        var progress : Float = 0
       
        switch mySlider.value {
        case 1..<2:
            mySegmentedControl.selectedSegmentIndex = 0
            myPickerView.selectRow(Int(mySlider.value), inComponent: 0, animated: true)
            myButton.setTitle(String(mySlider.value), for: .normal)
            progress = 0.2
        case 2..<3:
            mySegmentedControl.selectedSegmentIndex = 1
            myPickerView.selectRow(Int(mySlider.value), inComponent: 0, animated: true)
            myButton.setTitle(String(mySlider.value), for: .normal)
            progress = 0.4
        case 3..<4:
            mySegmentedControl.selectedSegmentIndex = 2
            myPickerView.selectRow(Int(mySlider.value), inComponent: 0, animated: true)
            myButton.setTitle(String(mySlider.value), for: .normal)
            progress = 0.6
        case 4..<5:
            mySegmentedControl.selectedSegmentIndex = 3
            myPickerView.selectRow(Int(mySlider.value), inComponent: 0, animated: true)
            myButton.setTitle(String(mySlider.value), for: .normal)
            progress = 0.8
        default:
            mySegmentedControl.selectedSegmentIndex = 4
            myPickerView.selectRow(Int(mySlider.value), inComponent: 0, animated: true)
            myButton.setTitle(String(mySlider.value), for: .normal)
            progress = 1
        }
        
        myProgressView.progress = progress
    }
    
    

    @IBAction func myButtonAction(_ sender: Any) {
        
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .red
        } else {
            myButton.backgroundColor = .blue
        }
    }
    
    
    @IBAction func myPageControlAction(_ sender: Any) {
        
        
        myPickerView.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
        let myString = myPickerViewValues[myPageControl.currentPage]
        myButton.setTitle(myString, for: .normal)
        
        mySegmentedControl.selectedSegmentIndex = myPageControl.currentPage
        mySlider.value = Float(myPageControl.currentPage)
    }
    
    
    @IBAction func mySegmentedControlAction(_ sender: Any) {
        myPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
        
        let myString = myPickerViewValues[mySegmentedControl.selectedSegmentIndex]
        myButton.setTitle(myString, for: .normal)
        
        myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
        mySlider.value = Float(mySegmentedControl.selectedSegmentIndex)
    }
    
    
}


// implementar los protocoloes en la extension para data source y delegate
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerViewValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerViewValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let myString = myPickerViewValues[row]
        myButton.setTitle(myString, for: .normal)
        myPageControl.currentPage = row
        mySegmentedControl.selectedSegmentIndex = row
        mySlider.value = Float(row)

    }
    
}

