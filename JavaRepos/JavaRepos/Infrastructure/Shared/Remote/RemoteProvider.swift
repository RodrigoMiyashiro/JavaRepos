//
//  RemoteProvider.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 12/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

private let remoteAddress = RemoteAddress(scheme: "https",
                                          host: "api.github.com")

protocol RemoteProvider { }

extension RemoteProvider {
    func baseRemoteAddress() -> RemoteAddress {
        return remoteAddress
    }
}
