//
//  RepoSummaryDestinationConfiguration.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

extension RepoSummaryDestination {
    func destinationBuilder() -> Destination {
        return RepoSummaryTypeDestination()
    }
}
