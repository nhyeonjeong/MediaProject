//
//  TMDBAPI_Request.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/04.
//

import UIKit
import Alamofire

enum TMDBAPI_Request {
    
    case trending
    case topRated
    case popular
    
    case detail(id: Int)
    case recommend(id: Int)
    case casting(id: Int)
    
    
    var getMethod: HTTPMethod {
        return .get
    }
    var postMethod: HTTPMethod {
        return .post
    }
    
    var baseUrlString: String {
        "https://api.themoviedb.org/3/"
    }
    
    var endpoint: String {
        switch self {
        case .trending:
            return "\(baseUrlString)trending/tv/week"
            
        case .topRated:
            return "\(baseUrlString)tv/top_rated"
        case .popular:
            return "\(baseUrlString)tv/popular"
            
        case .detail(let id):
            return "\(baseUrlString)tv/\(id)"
        case .recommend(let id):
            return "\(baseUrlString)tv/\(id)/recommendations"
        case .casting(let id):
            return "\(baseUrlString)tv/\(id)/aggregate_credits"
        }
    }
    
    var header: HTTPHeaders {
        return ["Authorization": APIKey.tmdbAuth]
    }
    
    var parameter: Parameters {
        switch self {
        case .casting:
            ["": ""]
        default:
            ["language": "ko-KR"]
        }
    }
}
