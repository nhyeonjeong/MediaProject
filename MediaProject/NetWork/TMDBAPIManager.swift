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
    
    let baseURL = "https://api.themoviedb.org/3/"
    
    func fetchTVTrend(completionHandler: @escaping ([Trend]) -> Void) {
        // enum으로 리팩토링할것!!!!
        let url = "\(baseURL)trending/tv/week?language=ko-KR"
        let header: HTTPHeaders = ["Authorization": APIKey.tmdbAuth]
        
        AF.request(url, headers: header).responseDecodable(of: TVTrendModel.self) { response in
            switch response.result {
            case .success(let success):
                print(success)
                completionHandler(success.results)
            case .failure(let failure):
                
                print(failure)
            }
        }
    }
    
    func fetchTVTopRated(completionHandler: @escaping ([TopRated]) -> Void) {
        let url = "\(baseURL)tv/top_rated?language=ko-KR"
        
        let header: HTTPHeaders = ["Authorization": APIKey.tmdbAuth]
        
        AF.request(url, headers: header).responseDecodable(of: TVTopRatedModel.self) { response in
            switch response.result {
            case .success(let success):
                print(success)
                completionHandler(success.results)
            case .failure(let failure):
                
                print(failure)
            }
        }
        
    }
    
    func fetchTVPopular(completionHandler: @escaping ([Popular]) -> Void) {
        let url = "\(baseURL)tv/popular?language=ko-KR"
        let header: HTTPHeaders = ["Authorization": APIKey.tmdbAuth]
        
        AF.request(url, headers: header).responseDecodable(of: TVPopularModel.self) { response in
            switch response.result {
            case .success(let success):
                print("---=====")
                print(success)
                completionHandler(success.results)
            case .failure(let failure):
                print("---=====")
                print(failure)
            }
        }
    }
    
}

extension TMDBAPIManager {
    func fetchTVDetails() {
        let url = "\(baseURL)tv/"
    }
}
