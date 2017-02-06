//
//  JSONSerializable.swift
//  JSONBuilder
//
//  Created by Axel Etcheverry on 03/02/2017.
//
//

import Foundation

public protocol JSONSerializable {
    func jsonSerialize() -> Any
}
