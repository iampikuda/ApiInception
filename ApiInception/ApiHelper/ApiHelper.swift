//
//  ApiHelper.swift
//  ApiInception
//
//  Created by Oluwadamisi Pikuda on 29/11/2018.
//  Copyright © 2018 Oluwadamisi Pikuda. All rights reserved.
//

import Foundation

struct ApiHelper: Networker {
    func getFrom(urlString: String, completion: @escaping (Data) -> Void) {

        guard let url = URL(string: urlString) else {
            print("Api Helper Error: Url conversion falied")
            return
        }
        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                var status = Int()
                if let httpResponse = response as? HTTPURLResponse {
                    status = httpResponse.statusCode
                }
                print("Api Helper Error \(status): \(error.localizedDescription)")
            }
            if let data = data {
                completion(data)
            }
        }
        task.resume()
    }
}
