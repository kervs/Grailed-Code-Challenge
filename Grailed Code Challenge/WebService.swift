//
//  WebServices.swift
//  Grailed Code Challenge
//
//  Created by Kervins Valcourt on 1/23/17.
//  Copyright © 2017 Grailed. All rights reserved.
//

import UIKit

final class Webservice {
    var nextSlug: String? {
        didSet {
            if let nextURL = nextSlug {
                nextSlug = "https://www.grailed.com/\(nextURL)"
            }
        }
    }

    func load<A>(_ resource: Resource<A>, completion: @escaping (A?) -> ()) {
        let request = URLRequest(url: resource.url)
        URLSession.shared.dataTask(with: request) { data, _, _ in
            let result = data.flatMap(resource.parse)
            self.parseForNextSlug(data: data)
            completion(result)
        }.resume()
    }

    private func parseForNextSlug(data: Data?) {
        let json = try? JSONSerialization.jsonObject(with: data!, options: [])
        if let jsonDictionary = json as? JSONDictionary,
            let _ = jsonDictionary["data"] as? [JSONDictionary],
            let metadata = jsonDictionary["metadata"] as? JSONDictionary,
            let paging = metadata["pagination"] as? JSONDictionary,
            let next =  paging["next_page"] as? String {
            print(next)
            self.nextSlug = next
        }
    }

    func loadNext<A>(_ resource: Resource<A>, completion: @escaping (A?) -> ()) {
        guard let urlString = nextSlug else {return }

        let request = URLRequest(url: URL(string: urlString)!)
        URLSession.shared.dataTask(with: request) { data, _, _ in
            let result = data.flatMap(resource.parse)
            self.parseForNextSlug(data: data)
            completion(result)
            }.resume()
    }

}
