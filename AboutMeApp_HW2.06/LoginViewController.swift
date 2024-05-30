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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == userName, passwordTextField.text == password else {
            let alert = UIAlertController(title: "Invalid login or password", message: "Please enter correct login and password", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.userNameTextField.text = ""
                self.passwordTextField.text = ""
            }
            alert.addAction(okAction)
            present(alert, animated: true)
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.welcomeUser = userNameTextField.text
    }
    
    @IBAction func forgotUserNameButtonTapped(_ sender: UIButton) {
        showAlert(withTitle: "Oops!", andMessage: "Your name is \(userName)")
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        showAlert(withTitle: "Oops!", andMessage: "Your password is \(password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        _ = segue.source as? WelcomeViewController
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private let userName = "User"
    private let password = "1234"
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


