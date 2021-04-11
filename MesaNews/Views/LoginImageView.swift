//
//  LoginBackground.swift
//  MesaNews
//
//  Created by Fernando Carneiro on 11/04/21.
//

import UIKit

final class LoginImageView: UIView {
    
    private lazy var loginImageView: UIImageView = {
        let imageView = UIImageView(frame: self.frame)
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named:"loginViewImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(){
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(loginImageView)
        
    }
}
