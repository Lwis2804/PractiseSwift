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

    
    // variables
    private let myPickerViewValues = ["Uno","Dos"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // buttons
        myButton.setTitle("Mi nuevo boton", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        
        //pickers
        myPickerView.backgroundColor = .lightGray
        myPickerView.dataSource = self // ayuda a cargar datos
        myPickerView.delegate = self // delegado sobre el view controller
    }

    @IBAction func myButtonAction(_ sender: Any) {
        
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .red
        } else {
            myButton.backgroundColor = .blue
        }
    }
    
}


// implementar los protocoloes en la extension para data source y delegate
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
    
    
}

