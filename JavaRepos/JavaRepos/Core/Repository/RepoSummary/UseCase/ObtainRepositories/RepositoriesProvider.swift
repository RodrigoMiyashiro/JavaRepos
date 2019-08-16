//
//  RepositoriesProvider.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 11/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol RepositoriesProvider: AnyObject {
    func repositories(page: Int) throws -> ListRepositories?
}
