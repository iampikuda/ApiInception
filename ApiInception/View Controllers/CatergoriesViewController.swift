//
//  ViewController.swift
//  ApiInception
//
//  Created by Oluwadamisi Pikuda on 29/11/2018.
//  Copyright © 2018 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit

class CatergoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var viewModel = CategoryViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryTableView.delegate = self
        self.categoryTableView.dataSource = self
        self.callApi()
    }

    func callApi() {
        self.viewModel.getData { [weak self] in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                strongSelf.title = strongSelf.viewModel.title
                strongSelf.categoryTableView.reloadData()
                strongSelf.activityIndicator.stopAnimating()
                if strongSelf.viewModel.categoryList.count == 0 {
                    strongSelf.showSimpleAlert(with: "No Data here")
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.categoryList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell",
                                                       for: indexPath) as? CategoryTableViewCell else { return UITableViewCell() }
        cell.addText(self.viewModel.categoryList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EntryVC") as? EntryViewController else { return }

        viewController.viewModel.category = self.viewModel.categoryList[indexPath.row]

        navigationController?.pushViewController(viewController, animated: true)
    }
}

