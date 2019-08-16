//
//  ObtainRepositoriesSummaryExecutor.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 13/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol ObtainRepositoriesSummaryExecutor: AnyObject {
    func obtainRepositoriesSummary(_ page: Int, completion: @escaping(ListRepositories?, Error?) -> Void)
}
