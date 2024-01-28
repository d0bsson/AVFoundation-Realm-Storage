//
//  RealmManager.swift
//  AVFoundation+Storage+Realm
//
//  Created by d0bsson on 28.01.2024.
//

import Foundation
import RealmSwift

class RealmManager {
    
    let realm = try! Realm()
    var posts: [Post] = []
    
    init() {
        fetchPosts()
    }
    
    func writetoRealm(imageName: String, textHeader: String, textDiscription: String) {
        let post = Post()
        post.discriptio = textDiscription
        post.header = textHeader
        post.image = imageName
        
        do {
            try realm.write({
                realm.add(post)
            })
        }catch{
            print(error)
        }
        fetchPosts()
    }
    
    func fetchPosts() {
        let posts = realm.objects(Post.self)
        self.posts = Array(posts)
    }
}
