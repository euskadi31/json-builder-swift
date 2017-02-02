//
//  FieldNamingStrategy.swift
//  JSONBuilder
//
//  Created by Axel Etcheverry on 02/02/2017.
//
//

import Foundation

func lowerCase(field: String, separator: String) -> String {
    return field.characters.map {
        if CharacterSet.uppercaseLetters.contains($0) {
            return "\(separator)\(String($0).lowercaseString)"
        }
    }
}

public enum FieldNamingPolicy {
    case identity
    case lowerCaseWithDashes
    case lowerCaseWithUnderscores
    case upperCamelCase
    case upperCamelCaseWithSpaces
}

protocol FieldNamingStrategy {
    func translateName(field: String) -> String;
}

struct IdentityStrategy: FieldNamingStrategy {
    func translateName(field: String) -> String {

        return field
    }
}

struct LowerCaseWithDashesStrategy: FieldNamingStrategy {
    func translateName(field: String) -> String {
        return lowerCase(field: field, separator: "-")
    }
}

struct LowerCaseWithUnderscoresStrategy: FieldNamingStrategy {
    func translateName(field: String) -> String {
        return lowerCase(field: field, separator: "_")
    }
}

struct UpperCamelCaseStrategy: FieldNamingStrategy {
    func translateName(field: String) -> String {

        return field
    }
}

struct UpperCamelCaseWithSpacesStrategy: FieldNamingStrategy {
    func translateName(field: String) -> String {

        return field
    }
}
