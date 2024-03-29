//
//  ViewController.swift
//  AVFoundation+Storage+Realm
//
//  Created by d0bsson on 25.01.2024.
//
import AVFoundation
import UIKit

class MainViewController: UIViewController {
    let realmManager = RealmManager()
    let storageManager = StorageManager()
    
    lazy var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        $0.dataSource = self
        $0.backgroundColor = .clear
        $0.register(PostCell.self,
                    forCellWithReuseIdentifier: PostCell.id)
        return $0
    }(UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout()))
    
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
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!)
        super.viewDidLoad()
        view.addSubview(collectionView)
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

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        realmManager.posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.id, for: indexPath) as! PostCell
        
        let imageName = realmManager.posts[indexPath.item].imageName
        let imageData = storageManager.loadPost(imageName: imageName)
        
        cell.setCell(imageData: imageData, headerText: "{F{F{F{{F{F{F", discrText: "{F{F{F{{F{F{F")
        
        return cell
    }
    
    
}

