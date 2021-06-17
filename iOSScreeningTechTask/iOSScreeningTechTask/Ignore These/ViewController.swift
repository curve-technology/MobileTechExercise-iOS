//
//  ViewController.swift
//  iOSScreeningTechTask
//
//  Created by Sam Watts on 16/06/2021.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        self.title = "Curve - iOS"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row == 0 {
            cell.textLabel?.text = "Completion Blocks"
        } else {
            cell.textLabel?.text = "Combine"
        }

        cell.accessoryType = .disclosureIndicator

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let viewController: UIViewController
        if indexPath.row == 0 {
            viewController = CompletionCardsTableViewController()
        } else {
            viewController = CombineCardsTableViewController()
        }

        navigationController?.pushViewController(viewController, animated: true)
    }
}

