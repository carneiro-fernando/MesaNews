//
//  LoginView.swift
//  MesaNews
//
//  Created by Fernando Carneiro on 11/04/21.
//

import UIKit

final class LoginStackView: UIView {
    
    private var fontSize: CGFloat
    
    private lazy var loginStackView: UIStackView = {
        let v = UIStackView(arrangedSubviews: [loginLabel,loginText,senhaLabel,senhaText])
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .vertical
        return v
    }()
    
    private lazy var loginLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "Login"
        v.font = UIFont.boldSystemFont(ofSize: fontSize)
        return v
    }()
    
    private lazy var senhaLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "Senha"
        v.font = UIFont.boldSystemFont(ofSize: fontSize)
        return v
    }()
    
    private lazy var loginText: UITextField = {
        let v = UITextField()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.boldSystemFont(ofSize: fontSize)
        v.borderStyle = .line
        v.isUserInteractionEnabled = true
        return v
    }()
    
    private lazy var senhaText: UITextField = {
        let v = UITextField()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.boldSystemFont(ofSize: fontSize)
        v.borderStyle = .line
        v.isUserInteractionEnabled = true
        return v
    }()
    
    init(fontSize: CGFloat){
        self.fontSize = fontSize
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true

        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(loginStackView)
    }
    
    func setupConstraints (){
        func setupConstraints (){
            NSLayoutConstraint.activate([
                loginStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
                loginStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 40),
                loginStackView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            ])
            
            
        }
    }
}
