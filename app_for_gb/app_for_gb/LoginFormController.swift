//
//  ViewController.swift
//  app_for_gb
//
//  Created by Иван Макаров on 13.02.2021.
//

import UIKit

class LoginFormController: UIViewController {

    //MARK: - Properties
    
    
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let login = loginTextField.text!
        let password = passwordTextField.text!
        
        if login == "admin" && password == "123456"{
            print("Успешная авторизация")
        } else {
            print("Неуспешная авторизация")
        }
    }
    
}


