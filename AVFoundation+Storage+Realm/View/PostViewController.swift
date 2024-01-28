//
//  PostViewController.swift
//  AVFoundation+Storage+Realm
//
//  Created by d0bsson on 28.01.2024.
//

import UIKit

class PostViewController: UIViewController {
    
    lazy var photo: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.white.cgColor
        return $0
    }(UIImageView())
    
    lazy var dissmisBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        return $0
    }(UIButton(primaryAction: dismissAction))
    
    lazy var dismissAction = UIAction { [weak self] _ in
        self?.dismiss(animated: true)
    }
    
    lazy var headerTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = " Заголовок"
        $0.layer.cornerRadius = 10
        $0.borderStyle = .line
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.white.cgColor
        $0.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        $0.clipsToBounds = true
        return $0
    }(UITextField())
    
    lazy var discriptionTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = " Описание"
        $0.layer.cornerRadius = 10
        $0.borderStyle = .line
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.white.cgColor
        $0.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        $0.clipsToBounds = true
        return $0
    }(UITextField())
    
    lazy var saveBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .black
        $0.setTitle("Сохранить", for: .normal)
        $0.tintColor = .white
        
        return $0
    }(UIButton())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)
        view.addSubview(photo)
        view.addSubview(dissmisBtn)
        view.addSubview(headerTextField)
        view.addSubview(discriptionTextField)
        view.addSubview(saveBtn)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            dissmisBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            dissmisBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        
            photo.topAnchor.constraint(equalTo: dissmisBtn.bottomAnchor, constant: 16),
            photo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            photo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            photo.heightAnchor.constraint(equalToConstant: 300),
            
            headerTextField.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 16),
            headerTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            headerTextField.heightAnchor.constraint(equalToConstant: 30),

            discriptionTextField.topAnchor.constraint(equalTo: headerTextField.bottomAnchor, constant: 16),
            discriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            discriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            discriptionTextField.heightAnchor.constraint(equalToConstant: 50),
            
            saveBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            saveBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            saveBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            saveBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
