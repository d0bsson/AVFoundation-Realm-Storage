//
//  ViewController.swift
//  AVFoundation+Storage+Realm
//
//  Created by d0bsson on 25.01.2024.
//
import AVFoundation
import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Buttons
    lazy var ShowCameraBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 35
        $0.layer.borderWidth = 2
        
        return $0
    }(UIButton(primaryAction: showCamera))
    lazy var showCamera = UIAction { [weak self] _ in
        let cameraVC = CameraViewController()
        cameraVC.modalPresentationStyle = .overFullScreen
        self?.present(cameraVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(ShowCameraBtn)
        setConstraints()
    }
    //MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            ShowCameraBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            ShowCameraBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            ShowCameraBtn.widthAnchor.constraint(equalToConstant: 70),
            ShowCameraBtn.heightAnchor.constraint(equalToConstant: 70)
            
        ])
    }
}

