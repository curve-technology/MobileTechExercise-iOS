//
//  CompletionCardsTableViewController.swift
//  iOSScreeningTechTask
//
//  Created by Sam Watts on 16/06/2021.
//

import UIKit

class CompletionCardsTableViewController: UITableViewController {

    let viewModel = CompletionViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Cards"

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "card_cell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.fetchContent { [weak self] in
            self?.tableView.reloadData()
        }
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
