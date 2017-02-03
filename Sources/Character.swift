//
//  Character.swift
//  JSONBuilder
//
//  Created by Axel Etcheverry on 03/02/2017.
//
//

import Foundation

extension Character {
    func lowercased() -> Character {
        return String(self).lowercased().characters.first!
    }

    func isUpperCase() -> Bool {
        return self.lowercased() != self
    }
}
