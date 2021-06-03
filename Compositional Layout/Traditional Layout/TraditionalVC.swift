//
//  TraditionalVC.swift
//  Compositional Layout
//
//  Created by Stuti Dobhal on 03.06.21.
//

import UIKit

class TraditionalVC: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Traditional Layout"
    }
}

// MARK: TableView data source and delegate
extension TraditionalVC: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell
        else { return UITableViewCell() }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableCell(withIdentifier: "HeaderCell")
        else { return UITableViewCell() }
        header.layer.cornerRadius = 5.0
        header.layer.masksToBounds = true
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
}
