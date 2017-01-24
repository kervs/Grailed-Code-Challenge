//
//  WebServices.swift
//  Grailed Code Challenge
//
//  Created by Kervins Valcourt on 1/23/17.
//  Copyright © 2017 Grailed. All rights reserved.
//

import UIKit

final class Webservice {
    func load<A>(_ resource: Resource<A>, completion: @escaping (A?) -> ()) {
        let request = URLRequest(url: resource.url)
        URLSession.shared.dataTask(with: request) { data, _, _ in
            let result = data.flatMap(resource.parse)
            completion(result)
        }.resume()
    }
}
