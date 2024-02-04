//
//  APIKeyManager.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/30.
//

import Foundation
import Alamofire

class TMDBAPIManager {
    
    static let shared = TMDBAPIManager()
    
    func fetchTVData<T: Decodable>(type: T.Type, api: TMDBAPI_Request, completionHandler: @escaping (T) -> Void) {
        
        AF.request(api.endpoint,
                   method: api.getMethod,
                   parameters: api.parameter,
                   encoding: URLEncoding(destination: .queryString),
                   headers: api.header).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let success):
//                print(success)
                completionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
