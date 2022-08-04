//
//  APICaller.swift
//  News App
//
//  Created by Sơn Nguyễn on 03/08/2022.
//

import Foundation
import Alamofire
final class APICaller {
    static let shared = APICaller()
    struct Constants {
        static let topHeadLinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=a740242a7a2a441b8fbdb9150bea64ec")
    }
    private init(){}
    
    public func getTopStories(completion: @escaping (Result<HeadlinesResponse, AFError>) -> Void) {
        guard let url = Constants.topHeadLinesURL else {
            return
        }
        let request = AF.request(url)
        request.validate().responseDecodable(of: HeadlinesResponse.self) { response in
            completion(response.result)
        }
    }
}
