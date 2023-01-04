//
//  RegisterScreen.swift
//  LoginViewCode
//
//  Created by c94288a on 05/05/22.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject{
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
        configButonEnable (false)
        
        configimageAddUserContraiants()

    }
    
    func configTextFieldDelegate( delegate: UITextFieldDelegate){
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    @objc func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
    func validaTextFieds() {
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty{
            self.configButonEnable(true)
        }else{
            self.configButonEnable(false)

        }

    }
    
    private func configButonEnable (_ enable: Bool){
        if enable{
            registerButton.setTitleColor(.white, for: .normal)
            registerButton.isEnabled = true
        }else{
            registerButton.setTitleColor(.lightGray, for: .normal)
            registerButton.isEnabled = false
        }
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
//            imageAddUser.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
//            imageAddUser.centerXAnchor.constraint(equalTo: centerXAnchor),
//            imageAddUser.widthAnchor.constraint(equalToConstant: 150),
//            imageAddUser.heightAnchor.constraint(equalToConstant: 150),
            
//            backButton.topAnchor.constraint(equalTo: self.imageAddUser.topAnchor),
//            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
//            emailTextField.topAnchor.constraint(equalTo: imageAddUser.bottomAnchor,constant: 10),
//            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            emailTextField.heightAnchor.constraint(equalToConstant: 45),
//
//            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
//            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
//            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
//            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
//            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
//            registerButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
//            registerButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
//            registerButton.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor)

            
        ])
    }
    
    func configimageAddUserContraiants(){
        self.imageAddUser.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(150)
            
            self.emailTextField.snp.makeConstraints { make in
                make.top.equalTo(self.imageAddUser.snp.bottom).offset(10)
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().inset(20)
                make.height.equalTo(45)
                
            }
            self.passwordTextField.snp.makeConstraints { make in
                make.top.equalTo(self.emailTextField.snp.bottom).offset(15)
                make.leading.equalTo(self.emailTextField.snp.leading)
                make.trailing.equalTo(self.emailTextField.snp.trailing)
                make.height.equalTo(self.emailTextField.snp.height)
                
            }
            self.registerButton.snp.makeConstraints { make in
                make.top.equalTo(self.passwordTextField.snp.bottom).offset(15)
                make.leading.equalTo(self.passwordTextField.snp.leading)
                make.trailing.equalTo(self.passwordTextField.snp.trailing)
                make.height.equalTo(self.passwordTextField.snp.height)
                
            }
        }
    }
}
