//
//  ViewController.swift
//  PractiseSwift
//
//  Created by LUIS GONZALEZ on 11/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.setTitle("Mi nuevo boton", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
    }

    @IBAction func myButtonAction(_ sender: Any) {
        
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .red
        } else {
            myButton.backgroundColor = .blue
        }
    }
    
}

