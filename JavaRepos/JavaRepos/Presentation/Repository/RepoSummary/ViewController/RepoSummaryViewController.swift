//
//  RepoSummaryViewController.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

private let initialPosition: Int = 1

final class RepoSummaryViewController: BaseConfigurationViewController, RepoSummaryShowScreen {
    internal var presenter: RepoSummaryPresenter?
    internal var dataSourceDelegateForRepoSummaryTableView = TableViewForCarRepairSummary()
    internal var wasCalledInfiniteScroll: Bool = false
    internal var currentPage: Int = initialPosition

    internal var refreshControl: UIRefreshControl?

    internal var listRepositories: ListRepositories? {
        didSet {
            self.dataSourceDelegateForRepoSummaryTableView.listRepositories = self.listRepositories
            self.repoTableView.reloadData()
        }
    }

    @IBOutlet weak var repoTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initializer()
        self.initialRequest()
    }

    private func initializer() {
        self.configureTitle("Java Repos")
        self.configureTableView()
        self.configureRefreshControl()
        self.configureInfiniteScroll()
    }

    func displayableListRepositories(_ listRepositories: ListRepositories) {
        self.prepareForDisplayable(listRepositories)
        self.refreshControl?.endRefreshing()
        self.stopActivityIndicator()
    }

    private func prepareForDisplayable(_ listRepositories: ListRepositories) {
        if !self.wasCalledInfiniteScroll {
            self.listRepositories = listRepositories
            return
        }

        var temporaryListRepositories: [Repository] = self.listRepositories?.repositories ?? []
        temporaryListRepositories += listRepositories.repositories
        self.listRepositories?.repositories = temporaryListRepositories
        self.listRepositories?.totalCount = listRepositories.totalCount
        self.listRepositories?.incompleteResults = listRepositories.incompleteResults
    }

    func showErrorObtainingListRepositoriesSummary() {
        self.stopActivityIndicator()
        self.refreshControl?.endRefreshing()
        self.showAlert(withMessage: "Não foi possível mostrar os repositórios Java no momento. Tente novamente mais tarde.")
    }
}
