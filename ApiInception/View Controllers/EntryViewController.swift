//
//  EntryViewController.swift
//  ApiInception
//
//  Created by Oluwadamisi Pikuda on 29/11/2018.
//  Copyright © 2018 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var entryTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var viewModel = EntryViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.entryTableView.dataSource = self
        self.callApi()
    }

    func callApi() {
        self.viewModel.getData {
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.title = strongSelf.viewModel.category
                strongSelf.entryTableView.reloadData()
                strongSelf.activityIndicator.stopAnimating()

                if strongSelf.viewModel.entries.count == 0 {
                    strongSelf.showSimpleAlert(with: "No Data here")
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.entries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell",
                                                       for: indexPath) as? EntryTableViewCell
            else { return UITableViewCell() }

        let entry = self.viewModel.entries[indexPath.row]
        cell.bindData(category: entry.api, description: entry.description)
        return cell
    }
}
