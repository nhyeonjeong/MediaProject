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
    
    let header: HTTPHeaders = ["Authorization": APIKey.tmdbAuth]
    
    func fetchTVTrend(completionHandler: @escaping ([Trend]) -> Void) {
        // enum으로 리팩토링할것!!!!
        let url = "\(baseURL)trending/tv/week?language=ko-KR"
        
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
            
        AF.request(url, headers: header).responseDecodable(of: TVPopularModel.self) { response in
            switch response.result {
            case .success(let success):

                print(success)
                completionHandler(success.results)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}

extension TMDBAPIManager {
    /// 드라마 상세내용 API
    func fetchTVDetails(completionHandler: @escaping (TVDetailModel) -> Void) {
        let url = "\(baseURL)tv/16420?language=ko-KR"
        
        AF.request(url, headers: header).responseDecodable(of: TVDetailModel.self) { response in
            switch response.result {
            case .success(let success):
                print(success)
                completionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    /// 비슷한 TV프로그램 추천
    func fetchTVRecommend(completionHandler: @escaping ([TV]) -> Void) {
        let url = "\(baseURL)tv/16420/recommendations?language=ko-KR"
        
        AF.request(url, headers: header).responseDecodable(of: TVModels.self) { response in
            switch response.result {
            case .success(let success):
                
                print(success)
                completionHandler(success.results)
            case .failure(let failure):
                
                dump(failure)
            }
        }
    }
    
    /// 캐스팅 정보
    func fetchTVAggregate(completionHandler: @escaping ([TVCast]) -> Void) {
        let url = "\(baseURL)tv/16420/aggregate_credits"
        
        AF.request(url, headers: header).responseDecodable(of: TVCastModel.self) { response in
            switch response.result {
            case .success(let success):
                
                print(success)
                completionHandler(success.cast)
            case .failure(let failure):
                
                print(failure)
            }
        }
    }
}
