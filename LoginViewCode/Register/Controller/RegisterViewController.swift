//
//  RegisterViewController.swift
//  LoginViewCode
//
//  Created by c94288a on 05/05/22.
//

import UIKit

class RegisterViewController: UIViewController, RegisterScreenProtocol {
    func actionRegisterButton() {
        print("prit")
    }
    
        
    var registerScreen: RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: nil, action: #selector(close))
        navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
        

    }
    
    @objc func close(){
        navigationController?.popViewController(animated: true)
    }

}

extension RegisterViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validaTextFieds()
    }
}
