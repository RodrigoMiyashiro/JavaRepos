//
//  ObtainPullRequests.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 11/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class ObtainPullRequests: ParameterizedUseCase {
    typealias Parameters = (ownerName: String, repositoryName: String, page: Int)

    private let provider: PullRequestsProvider
    private weak var receiver: PullRequestsReceiver?

    init(provider: PullRequestsProvider, receiver: PullRequestsReceiver) {
        self.provider = provider
        self.receiver = receiver
    }

    func execute(with parameters: (ownerName: String, repositoryName: String, page: Int)) {
        do {
            let listPullRequest = try self.provider.pullRequests(ownerName: parameters.ownerName,
                                                                 repositoryName: parameters.repositoryName,
                                                                 page: parameters.page)

            self.receiver?.receiverPullRequests(listPullRequest)
        } catch {
            self.receiver?.handleErrorObtainingPullRequests()
        }
    }
}
