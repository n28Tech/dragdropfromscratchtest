//
//  Model.swift
//  dragdropfromscratchtest
//
//  Created by Kevin Campbell on 12/8/20.
//

import Foundation
import UIKit
class Model {
    //var collectionIndex:Int? //not use now
    var tableIndex:Int? //not use now
    var fruit:Fruit?
}

class Fruit {
    var id:Int!
    var name:String?
    var imageName:UIImage?
    init(id:Int,name:String,imageName:UIImage) {
        self.id = id
        self.name = name
        self.imageName = imageName
    }
}

