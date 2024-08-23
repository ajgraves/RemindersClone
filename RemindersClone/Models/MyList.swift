//
//  MyList.swift
//  RemindersClone
//
//  Created by Aaron Graves on 8/23/24.
//

import Foundation
import SwiftData

@Model
class MyList {
    var name: String
    var colorCode: String
    
    init(name: String, colorCode: String) {
        self.name = name
        self.colorCode = colorCode
    }
}
