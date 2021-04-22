//
//  HTTPUtility.swift
//  RedditNewsFeed
//
//  Created by Ahmad, Arfhan on 4/22/21.
//

import Foundation

struct HTTPUtility {
    func getApiRequest<T:Decodable>(urlRequest:URL, resultType: T.Type, complitionHandler: @escaping(_ result: T) -> Void) {
        var urlRequest = URLRequest(url: urlRequest)
        urlRequest.httpMethod = "get"
        URLSession.shared.dataTask(with: urlRequest) { (data, serverResponse, error) in
            if error == nil && data != nil {
                do {
                    let response =  try JSONDecoder().decode(T.self, from: data!)
                    print(response)
                    _ = complitionHandler(response)
                } catch  let decodingError {
                    debugPrint(decodingError)
                }
            }
        }.resume()
    }
}
