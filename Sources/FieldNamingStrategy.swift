//
//  FieldNamingStrategy.swift
//  JSONBuilder
//
//  Created by Axel Etcheverry on 02/02/2017.
//
//

import Foundation

func lowerCase(name: String, separator: String) -> String {
    var translation: String = ""

    for char in name.characters {
        if char.isUpperCase() && translation.characters.count != 0 {
            translation.append(separator)
        }

        translation.append(char.lowercased())
    }

    return translation;
}

func camelCase(name: String, separator: String = "") -> String {
    return lowerCase(name: name, separator: separator).capitalized
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
        return lowerCase(name: field, separator: "-")
    }
}

struct LowerCaseWithUnderscoresStrategy: FieldNamingStrategy {
    func translateName(field: String) -> String {
        return lowerCase(name: field, separator: "_")
    }
}

struct UpperCamelCaseStrategy: FieldNamingStrategy {
    func translateName(field: String) -> String {
        return camelCase(name: field, separator: " ").replacingOccurrences(of: " ", with: "")
    }
}


struct UpperCamelCaseWithSpacesStrategy: FieldNamingStrategy {
    func translateName(field: String) -> String {
        return camelCase(name: field, separator: " ")
    }
}
