//
//  Post.swift
//  AVFoundation+Storage+Realm
//
//  Created by d0bsson on 28.01.2024.
//

import Foundation
import RealmSwift

class Post: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var imageName: String = ""
    @Persisted var discriptio: String = ""
    @Persisted var header: String = ""
}
