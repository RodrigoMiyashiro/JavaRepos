//
//  ObtainRepositories.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 11/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class ObtainRepositories: ParameterizedUseCase {
    typealias Parameters = Int

    private let provider: RepositoriesProvider
    private weak var receiver: RepositoriesReceiver?

    init(provider: RepositoriesProvider, receiver: RepositoriesReceiver) {
        self.provider = provider
        self.receiver = receiver
    }

    func execute(with parameters: Parameters) {
        do {
            let repositories = try self.provider.repositories(page: parameters)

            self.receiver?.receiveRepositories(repositories)
        } catch {
            self.receiver?.handleErrorObtainingRepositories()
        }
    }
}
