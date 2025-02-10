//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Samoilik Hleb on 09/02/2025.
//

import UIKit

final class AuthViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private var userNameTF: UITextField!
    @IBOutlet private var passwordTF: UITextField!
    
    @IBOutlet var logInOutlet: UIButton!
    
    private let validUsername = "1"
    private let validPassword = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupGestureRecognizers()
        
        passwordTF.isSecureTextEntry = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let greetingVC = segue.destination as? GreetingViewController
        greetingVC?.userName = userNameTF.text
    }
    
    @IBAction func loginButtonTapped() {
        login()
    }
    
    @IBAction private func forgotUserNameAction() {
        showAlert(message: "Your name is «1»", with: "Oops!")
    }
    
    @IBAction private func forgotPasswordAction() {
        showAlert(
            message: "Please, enter correct login and password",
            with: "Invalid login or password"
        )
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            textField.resignFirstResponder()
            login()
        }
        return true
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        logInOutlet.layer.cornerRadius = 5
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        
        userNameTF.returnKeyType = .next
        passwordTF.returnKeyType = .done
    }
    
    private func setupGestureRecognizers() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        view.addGestureRecognizer(tapGesture)
    }
    
    private func login() {
        guard let username = userNameTF.text, !username.isEmpty,
              let password = passwordTF.text, !password.isEmpty else {
            showAlert(message: "Enter correct data", with: "Error")
            return
        }
        
        guard username == validUsername && password == validPassword else {
            showAlert(message: "Invalid login or password", with: "Error") {
                self.passwordTF.text = ""
            }
            return
        }
        
        performSegue(withIdentifier: "goToNextScreen", sender: self)
    }
    
    private func showAlert(message: String, with title: String, completion: @escaping () -> Void = {}) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

