//
//  Resource.swift
//  Grailed Code Challenge
//
//  Created by Kervins Valcourt on 1/23/17.
//  Copyright © 2017 Grailed. All rights reserved.
//

import Foundation

public struct Resource<A> {
    public var url: URL
    public var parse: (Data) -> A?

    public init(url: URL, parse: @escaping (Data) -> A?) {
        self.url = url
        self.parse = parse
    }
}


extension Resource {
    public init(url: URL, parseJSON: @escaping (Any) -> A?) {
        self.url = url
        self.parse = { data in
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            return json.flatMap(parseJSON)
        }
    }
}
