//
//  TMDBURLSessionManager.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/05.
//

import Foundation

// URLSession으로 통신해보자
class TMDBURLSessionManager {
    
    
    static let shared = TMDBURLSessionManager()
    
    func fetchTVData<T: Decodable>(type: T.Type, api: TMDBAPI_Request, completionHandler: @escaping (T?, CustomError?) -> Void) {

        guard let urlEndpoint = URL(string: api.endpoint) else {
            print("유효한 url이 아닙니당~")
            return
        }
        var url = URLRequest(url: urlEndpoint)
        url.httpMethod = "GET"
        url.addValue(APIKey.tmdbAuth, forHTTPHeaderField: "Authorization")
//        url.setValue("ko-KR", forHTTPHeaderField: "language") // 쿼리는 어케 주지?..
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    print(T.self, "failedRequest")
                    completionHandler(nil, .failedRequest)
                    return
                }
                
                // 통신은 성공했지만 데이터가 nil일 경우..
                guard let data = data else {
                    print(T.self, "nodata")
                    completionHandler(nil, .noData)
                    return
                    
                }
                
                // 통신 성공했지만 응답값이 없을 경우
                guard let response = response as? HTTPURLResponse else {
                    print(T.self, "noResponse")
                    completionHandler(nil, .noResponse)
                    return
                }
                
                // 데이터도 있고 응답값도 있지만 잘못된 상태코드로 날아온 경우(이 경우도 json 데이터는 넘어옴)
                guard response.statusCode == 200 else {
                    print(T.self, "invalidResponse")
                    completionHandler(nil, .invalidResponse)
                    return
                }
                
                print(data)
                // 여기까지는 상태코드도 잘 넘어온거고, 데이터도 잇음
                // decode만 하면 됨
                do {
                    print("djdj?")
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(result, nil) // 여기서 성공!!
                } catch {
                    completionHandler(nil, .invalidData) // 성공못해도 넘겨주기
                }
            }
        }.resume()
    }
}
