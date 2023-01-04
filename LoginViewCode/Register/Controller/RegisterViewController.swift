//
//  RegisterViewController.swift
//  LoginViewCode
//
//  Created by c94288a on 05/05/22.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, RegisterScreenProtocol {
    func actionRegisterButton() {
        
        guard let register = self.registerScreen else {return}
       
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { result, error in
            if error != nil{
                self.alert?.getAlert(titulo: "Atencao", mensage: "Erro ao cadastrar")
            }else{
                self.alert?.getAlert(titulo: "Parabens ", mensage: "cadastrado com sucesso", completion: { [self] in
                    close()
                })

            }
        })
    }
    
    var auth: Auth?
    var registerScreen: RegisterScreen?
    var alert: Alert?
    
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
        self.auth = Auth.auth()
        self.alert=Alert(controller: self)
        
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
