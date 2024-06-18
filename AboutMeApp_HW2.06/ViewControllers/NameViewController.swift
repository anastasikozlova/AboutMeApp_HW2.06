//
//  NameViewController.swift
//  AboutMeApp_HW2.06
//
//  Created by Анастасия Козлова on 18.06.2024.
//

import UIKit

final class NameViewController: UIViewController {

    @IBOutlet var fullNameTitle: UINavigationItem!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var languagesLabel: UILabel!
    @IBOutlet var hobbyLabel: UILabel!
    
    var fullName = ""
    var name = ""
    var surname = ""
    var age = ""
    var languages = ""
    var hobby = ""
    
    private let person = User.getUser()
                              
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameTitle.title = fullName
        nameLabel.text = name
        surnameLabel.text = surname
        ageLabel.text = age
        languagesLabel.text = languages
        hobbyLabel.text = hobby
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bioVC = segue.destination as? BioViewController
        bioVC?.bioText = person.person.biography
    }
}
