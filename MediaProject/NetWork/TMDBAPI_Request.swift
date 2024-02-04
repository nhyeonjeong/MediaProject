//
//  TMDBAPI_Request.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/04.
//

import UIKit
import Alamofire

enum TMDBAPI_Request {
    
    case detail(id: Int)
    case recommend(id: Int)
    case casting(id: Int)
    
    
    var getMethod: HTTPMethod {
        return .get
    }
    var postMethod: HTTPMethod {
        return .post
    }
    
    var nilURLString: String {
        "https://naver.com"
    }
    
    var baseUrlString: String {
        "https://api.themoviedb.org/3/"
    }
    
    var endpoint: URL {
        switch self {
        case .detail(let id):
            guard let url = URL(string: "\(baseUrlString)tv/\(id)") else {
                return URL(string: nilURLString)!
            }
            return url
            
        case .recommend(let id):
            guard let url = URL(string: "\(baseUrlString)tv/\(id)/recommendations") else {
                return URL(string: nilURLString)!
            }
            return url
            
        case .casting(let id):
            guard let url = URL(string: "\(baseUrlString)tv/\(id)/aggregate_credits") else {
                return URL(string: nilURLString)!
            }
            return url
        }
    }
    
    var header: HTTPHeaders {
        return ["Authorization": APIKey.tmdbAuth]
    }
    
    var parameter: Parameters {
        switch self {
        case .detail:
            ["language": "ko-KR"]
        case .recommend:
            ["language": "ko-KR"]
        case .casting:
            ["": ""]
        }
    }
}
