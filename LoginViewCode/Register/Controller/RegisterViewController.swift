//
//  RegisterViewController.swift
//  LoginViewCode
//
//  Created by c94288a on 05/05/22.
//

import UIKit

class RegisterViewController: UIViewController {
        
    var registerScreen: RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .camera,
            target: nil,
            action: nil
        )


    }
    



}
