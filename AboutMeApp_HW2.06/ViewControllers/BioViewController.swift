//
//  BioViewController.swift
//  AboutMeApp_HW2.06
//
//  Created by Анастасия Козлова on 18.06.2024.
//

import UIKit

class BioViewController: UIViewController {

    @IBOutlet var bioTitleLabel: UILabel!
    @IBOutlet var bioTextLabel: UILabel!
    
    var bioText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bioTitleLabel.text = "Моя биография"
        bioTextLabel.text = bioText
    }
}
