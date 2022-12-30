//
//  RegisterScreen.swift
//  LoginViewCode
//
//  Created by c94288a on 05/05/22.
//

import UIKit

protocol RegisterScreenProtocol: class{
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    weak private var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol?){
        self.delegate = delegate
    }
    
//    lazy var backButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setImage(UIImage(named: "back" ), for: .normal)
//        return button
//    }()
    
    lazy var imageAddUser: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "add-user")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.isSecureTextEntry = true
        tf.placeholder = "youremail@exemple.com"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.placeholder = "password"
        tf.isSecureTextEntry = true
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 25/255, green: 117/255, blue: 104/255, alpha: 1.0)
        configSuperView()
        setupConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView(){
     //   self.addSubview(backButton)
        self.addSubview(imageAddUser)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(registerButton)


    }
    
    func configTextFieldDelegate( delegate: UITextFieldDelegate){
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    @objc func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            imageAddUser.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            imageAddUser.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageAddUser.widthAnchor.constraint(equalToConstant: 150),
            imageAddUser.heightAnchor.constraint(equalToConstant: 150),
            
//            backButton.topAnchor.constraint(equalTo: self.imageAddUser.topAnchor),
//            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            emailTextField.topAnchor.constraint(equalTo: imageAddUser.bottomAnchor,constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            registerButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor)
            
            
            ])
    }
    
    
}