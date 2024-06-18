//
//  WelcomeViewController.swift
//  AboutMeApp_HW2.06
//
//  Created by Анастасия Козлова on 27.05.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var myNameLabel: UILabel!
    
    var userName = ""
    var myName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(userName)!"
        myNameLabel.text = "My name is \(myName)."
    }
}
