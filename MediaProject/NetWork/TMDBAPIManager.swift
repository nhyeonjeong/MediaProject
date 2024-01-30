//
//  APIKeyManager.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/30.
//

import Foundation
import Alamofire
class TMDBAPIManager {
    enum url {
//        let baseUrl = "https://api.themoviedb.org/3/"
//        
//        case tvtrend = "trending/tv/"
    }
    static let shared = TMDBAPIManager()
    
    func fetchTVTrend(completionHandler: @escaping ([Result]) -> Void) {
        // enum으로 리팩토링할것!!!!
        let url = "https://api.themoviedb.org/3/trending/tv/week?language=ko-KR"
        let header: HTTPHeaders = ["Authorization": APIKey.tmdbAuth]
        
        AF.request(url, headers: header).responseDecodable(of: TVTrendModel.self) { response in
            switch response.result {
            case .success(let success):
                print(success)
                completionHandler(success.results)
            case .failure(let failure):
                print("tlfvo")
                print(failure)
            }
        }
    }
    
    func fetchTVTopRated() {
        let url = "https://api.themoviedb.org/3/tv/top_rated?language=ko-KR"
        
    }
    
    func fetchTVPopular() {
        let url = "https://api.themoviedb.org/3/tv/popular?language=ko-KR"
        
    }
}
