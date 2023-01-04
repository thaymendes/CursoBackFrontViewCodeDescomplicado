//
//  ViewController.swift
//  LoginViewCode
//
//  Created by c94288a on 12/04/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    private var loginScreen: LoginScreen?
    var auth: Auth?
    
    var alert: Alert?

    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)

    }

}

extension LoginViewController: LoginScreenProtocol{
    func actionLoginButton() {
        guard let login = self.loginScreen else {return}
        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(),completion: { usuario, error in
            if error != nil {
                self.alert?.getAlert(titulo: "Atencao", mensage: "Dados incorretos")
            }else{
                if usuario == nil {
                    self.alert?.getAlert(titulo: "Atencao", mensage: "Tivemos um problema")
                }else{
                    self.alert?.getAlert(titulo: "Parabens", mensage: "Sucesso")

                }
            }
        })
    }
    
    func actionRegisterButton() {
        let vc: RegisterViewController = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
}

extension LoginViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.validaTextFieds()
     }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
