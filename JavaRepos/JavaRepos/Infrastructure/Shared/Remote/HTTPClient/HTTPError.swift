//
//  HTTPError.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 12/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

enum HTTPError: Error {
    case requestError(_ message: String)
}
