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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let greetingVC = segue.destination as? GreetingViewController
        greetingVC?.userName = userNameTF.text
    }
    
    @IBAction func loginButtonTapped() {
        login()
    }
    
    @IBAction private func forgotUserNameAction() {
    }
    
    @IBAction private func forgotPasswordAction() {
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
            showAlert(message: "Enter correct data")
            return
        }
        
        guard username == validUsername && password == validPassword else {
            showAlert(message: "Invalid login or password")
            return
        }
        
        performSegue(withIdentifier: "goToNextScreen", sender: self)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

