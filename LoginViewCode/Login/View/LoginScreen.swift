//
//  LoginScreen.swift
//  LoginViewCode
//
//  Created by c94288a on 12/04/22.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    
    weak var delegate : LoginScreenProtocol?
    
    func delegate(delegate: LoginScreenProtocol?){
        self.delegate = delegate
        
    }
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        return label
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.tintColor = .red
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
        tf.placeholder = "youremail@exemple.com"
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
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Cadastre-se!", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 25/255, green: 117/255, blue: 104/255, alpha: 1.0)
        configSuperView()
        setupConstrains()
        configButonEnable(false)
        
        
        configLoginLabelContraiants()
        configLogoAppIImageViewConstraints()
        configEmailTextFieldsConstraints()
        configPasswordTextFieldsConstraints()
        configloginButtonConstraints()
        configregisterButtonConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configSuperView(){
        configButonEnable (false)
        self.addSubview(loginLabel)
        self.addSubview(logoAppImageView)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(registerButton)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    @objc private func tappedLoginButton(){
        self.delegate?.actionLoginButton()
    }
    
    @objc private func tappedRegisterButton(){
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
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.isEnabled = true
        }else{
            loginButton.setTitleColor(.lightGray, for: .normal)
            loginButton.isEnabled = false
        }
    }
    
    private func setupConstrains(){
        NSLayoutConstraint.activate([
//            loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
//            loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
//            logoAppImageView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20),
//            logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
//            logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
//            logoAppImageView.heightAnchor.constraint(equalToConstant: 200),
            
//            emailTextField.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 20),
//            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  -20),
//            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
//            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
//            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
//            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
//            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
//            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
//            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
//            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
//            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
//            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
//            registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
//            registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
//            registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            
        ])
    }
    
    func configLoginLabelContraiants(){
        self.loginLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    func configLogoAppIImageViewConstraints(){
        self.logoAppImageView.snp.makeConstraints { make in
            make.top.equalTo(self.loginLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
            make.height.equalTo(200)

        }
    }
    
    func configEmailTextFieldsConstraints(){
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.logoAppImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)

        }
    }
    
    func configPasswordTextFieldsConstraints(){
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(15)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)

        }
    }
    
    func configloginButtonConstraints(){
        self.loginButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(15)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)

        }
    }
    
    func configregisterButtonConstraints(){
        self.registerButton.snp.makeConstraints { make in
            make.top.equalTo(self.loginButton.snp.bottom).offset(15)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)

        }
    }

}
