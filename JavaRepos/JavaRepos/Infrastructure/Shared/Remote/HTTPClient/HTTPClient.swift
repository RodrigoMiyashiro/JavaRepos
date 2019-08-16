//
//  HTTPClient.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 12/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol HTTPClient {
    typealias queryParamenters = [String: String]?
    typealias headerParamenters = [String: String]?
    typealias bodyParamenters = [String: Any]?
    
    func request<T>(_ remote: RemoteAddress,
                    httpMethod: HTTPMethod,
                    queryParamenters: queryParamenters,
                    headerParamenters: headerParamenters,
                    bodyParamenters: bodyParamenters) throws -> T? where T: Decodable
}

