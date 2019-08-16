//
//  PullRequestSummaryViewController.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

private let initialPosition: Int = 1

class PullRequestSummaryViewController: BaseConfigurationViewController, PullRequestSummaryDestinationScreen, PullRequestSummaryShowScreen {
    var repoName: String?
    var ownerName: String?

    internal var presenter: PullRequestSummaryPresenter?
    internal var dataSourceDelegateForPullRequestSummaryTableView = TableViewForPullRequestSummary()
    internal var wasCalledInfiniteScroll: Bool = false
    internal var currentPage: Int = initialPosition

    internal var refreshControl: UIRefreshControl?

    internal var listPullRequest: ListPullRequest? {
        didSet {
            self.dataSourceDelegateForPullRequestSummaryTableView.listPullRequest = self.listPullRequest
            self.pullRequestTableView.reloadData()
        }
    }

    @IBOutlet weak var pullRequestTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initializer()
        self.initialRequest()
    }

    private func initializer() {
        self.title = self.repoName
        self.configureTableView()
        self.configureRefreshControl()
        self.configureInfiniteScroll()
    }

    func displayableListPullRequest(_ listPullRequest: ListPullRequest) {
        self.prepareForDisplayable(listPullRequest)
        self.refreshControl?.endRefreshing()
        self.stopActivityIndicator()
    }

    private func prepareForDisplayable(_ listPullRequest: ListPullRequest) {
        if !self.wasCalledInfiniteScroll {
            self.listPullRequest = listPullRequest
            return
        }

        var temporaryListPullRequest: [PullRequest] = self.listPullRequest?.pullRequests ?? []
        temporaryListPullRequest += listPullRequest.pullRequests ?? []
        self.listPullRequest?.pullRequests = temporaryListPullRequest
    }

    func showErrorObtainingListPullRequestSummary() {
        self.stopActivityIndicator()
        self.refreshControl?.endRefreshing()
        self.showAlert(withMessage: "Não foi possível mostrar os Pull Request do repositório selecionado no momento. Tente novamente mais tarde.")
    }
}
