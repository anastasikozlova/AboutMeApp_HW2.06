//
//  ViewController.swift
//  AboutMeApp_HW2.06
//
//  Created by Анастасия Козлова on 27.05.2024.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let userName = "User"
    private let password = "1234"
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        
        userNameTextField.text = "User"
        passwordTextField.text = "1234"
        
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    } // это метод скрытия клавиатуры при тапе по экрану
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == userName, passwordTextField.text == password else {
            let alert = UIAlertController(title: "Invalid login or password", message: "Please enter correct login and password", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.passwordTextField.text = ""
            }
            alert.addAction(okAction)
            present(alert, animated: true)
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as? UITabBarController
        tabBarController?.viewControllers?.forEach{ viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = user.userName
                welcomeVC.myName = user.person.name
            } else if let navigationVC = viewController as? UINavigationController {
                let nameVC = navigationVC.topViewController as? NameViewController
                nameVC?.fullName = user.person.fullName
                nameVC?.name = user.person.name
                nameVC?.surname = user.person.surname
                nameVC?.age = user.person.age
                nameVC?.languages = user.person.foreignLanguages
                nameVC?.hobby = user.person.hobby
            }
        }
    }
    
    @IBAction func forgotUserNameButtonTapped(_ sender: UIButton) {
        showAlert(withTitle: "Oops!", andMessage: "Your name is \(userName)")
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        showAlert(withTitle: "Oops!", andMessage: "Your password is \(password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


