//
//  String+Extensions.swift
//  RemindersClone
//
//  Created by Aaron Graves on 9/11/24.
//

import Foundation

extension String {
    
    var isEmptyOrWhitespace: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
