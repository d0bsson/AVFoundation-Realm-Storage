//
//  CollectionViewPostCell.swift
//  AVFoundation+Storage+Realm
//
//  Created by d0bsson on 29.01.2024.
//

import UIKit

class PostCell: UICollectionViewCell {
    static let id = "cell"
    
    lazy var photo: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: bounds))
    
    lazy var headerText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        return $0
    }(UILabel())
    
    lazy var discrText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        return $0
    }(UILabel())
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        addSubview(photo)
        addSubview(headerText)
        addSubview(discrText)
    }
    
    func setCell(imageData: Data, headerText: String, discrText: String) {
        let image = UIImage(data: imageData)
        self.photo.image = image
        self.headerText.text = headerText
        self.discrText.text = discrText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            discrText.bottomAnchor.constraint(equalTo: photo.bottomAnchor, constant: -8),
            discrText.leadingAnchor.constraint(equalTo: photo.leadingAnchor, constant: 8),
            discrText.trailingAnchor.constraint(equalTo: photo.trailingAnchor, constant: -8),
            
            headerText.bottomAnchor.constraint(equalTo: discrText.topAnchor, constant: -8),
            headerText.leadingAnchor.constraint(equalTo: photo.leadingAnchor, constant: 8),
            headerText.trailingAnchor.constraint(equalTo: photo.trailingAnchor, constant: -8),

        
        ])
        
    }
}
