//
//  WelcomeViewController.swift
//  AboutMeApp_HW2.06
//
//  Created by Анастасия Козлова on 27.05.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var welcomeUser: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(welcomeUser!)!"
    }
    

    

}
