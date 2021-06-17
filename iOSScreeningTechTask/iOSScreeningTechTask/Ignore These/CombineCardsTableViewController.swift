//
//  CombineCardsTableViewController.swift
//  iOSScreeningTechTask
//
//  Created by Sam Watts on 16/06/2021.
//

import UIKit
import Combine

class CombineCardsTableViewController: UITableViewController {

    let viewModel = CombineViewModel()
    private var cancellables: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Cards"

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "card_cell")

        viewModel.$content
            // small delay since @Published uses willSet and this would still have the old value at reload time 
            .delay(for: 0.1, scheduler: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.fetchContent()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.content.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "card_cell", for: indexPath)

        let card = viewModel.content[indexPath.row]

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency

        var content = cell.defaultContentConfiguration()
        content.prefersSideBySideTextAndSecondaryText = true
        content.text = card.name
        content.secondaryText = formatter.string(from: card.balance as NSNumber)

        cell.contentConfiguration = content

        return cell
    }

}
