//
//  Date.swift
//  JSONBuilder
//
//  Created by Axel Etcheverry on 03/02/2017.
//
//

import Foundation

let iso8601Formatter: DateFormatter = {
    let formatter = DateFormatter()

    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

    return formatter
}()

extension Date: JSONSerializable {
    public func jsonSerialize() -> Any {
        return iso8601Formatter.string(from: self)
    }
}
