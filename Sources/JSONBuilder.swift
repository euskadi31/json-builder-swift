//
//  JSONBuilder.swift
//
//
//  Created by Axel Etcheverry on 02/02/2017.
//
//

import Foundation

public protocol JSONSerializer {
    func serialize(object: Any?)-> String?
}

public struct JSONBuilder: JSONSerializer {
    let fieldNamingPolicy: FieldNamingPolicy;
    let options: JSONSerialization.WritingOptions
    let fieldNamingStrategy: FieldNamingStrategy

    public init(policy: FieldNamingPolicy = .identity, options: JSONSerialization.WritingOptions = []) {
        self.fieldNamingPolicy = policy
        self.options = options

        switch policy {
        case .lowerCaseWithDashes:
            self.fieldNamingStrategy = LowerCaseWithDashesStrategy()
        case .lowerCaseWithUnderscores:
            self.fieldNamingStrategy = LowerCaseWithUnderscoresStrategy()
        case .upperCamelCase:
            self.fieldNamingStrategy = UpperCamelCaseStrategy()
        case .upperCamelCaseWithSpaces:
            self.fieldNamingStrategy = UpperCamelCaseWithSpacesStrategy()
        default:
            self.fieldNamingStrategy = IdentityStrategy()
        }
    }

    public func normalize(field: String) -> String {
        return self.fieldNamingStrategy.translateName(field: field)
    }

    public func convert(object: Any?) -> Any? {
        guard let obj = object else {
            return nil
        }

        switch obj {
        case let value as JSONSerializable:
            return value.jsonSerialize()

        case let value as String:
            return value as String

        case let value as Bool:
            return value as Bool

        case let value as Int:
            return value as Int

        case let value as Double:
            return value as Double

        case let value as Dictionary<String, Any>:
            var retval: [String: Any?] = [:]

            for (key, val) in value {
                retval[self.normalize(field: key)] = self.convert(object: val)
            }

            return retval

        case let value as Date:
            return value.jsonSerialize()

        case let value as Array<Any>:
            return value.map({ (item: Any) -> Any? in
                return self.convert(object: item)
            })

        default:
            let ref = Mirror(reflecting: obj)

            if ref.displayStyle == .optional {
                if ref.children.count == 0 {
                    return nil
                } else {
                    let (_, some) = ref.children.first!

                    return self.convert(object: some)
                }
            }

            if ref.displayStyle == .struct || ref.displayStyle == .class {
                var retval: [String: Any?] = [:]

                for (key, value) in ref.children {
                    guard let key = key else {
                        continue
                    }

                    retval[self.normalize(field: key)] = self.convert(object: value)
                    
                }

                return retval
            }

            break
        }

        return nil
    }

    public func serialize(object: Any?)-> String? {
        guard let JSONObject = self.convert(object: object) else {
            return nil
        }

        guard JSONSerialization.isValidJSONObject(JSONObject) else {
            return nil
        }

        do {
            let data = try JSONSerialization.data(withJSONObject: JSONObject, options: self.options)

            return String(data: data, encoding: .utf8)
        } catch {
            return nil
        }
    }
}
