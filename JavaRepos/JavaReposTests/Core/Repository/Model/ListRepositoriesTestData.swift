//
//  ListRepositoriesTestData.swift
//  JavaReposTests
//
//  Created by Rodrigo Miyashiro on 12/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension ListRepositories {
    static var validListRepositories: ListRepositories {
        let parser = ParseForMock()
        let listRepositories: ListRepositories? = parser.parseData(fileName: "ListRepositoriesTest",
                                                                   ofType: "json")

        return listRepositories!
    }
}
