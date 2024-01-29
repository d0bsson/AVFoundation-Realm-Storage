//
//  StorageManager.swift
//  AVFoundation+Storage+Realm
//
//  Created by d0bsson on 28.01.2024.
//

import Foundation

class StorageManager {
    
    private func fileManagerPath() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func savePost(imageName: String, imageData: Data) {
        var path = fileManagerPath()
        path.append(path: imageName)
        
        do {
            try imageData.write(to: path)
        }catch{
            print("\(error) - ошибка при записи в файловый менеджер")
        }
    }
    
    func loadPost(imageName: String) -> Data {
        var path = fileManagerPath()
        path.append(path: imageName)
        
        guard let imageData = try? Data(contentsOf: path) else { return Data() }
        return imageData
    }
}
