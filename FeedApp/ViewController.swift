//
//  ViewController.swift
//  FeedApp
//
//  Created by orpan on 08.04.2021.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    let identifier = "cell"
    let animals = ["Frank", "Gerda"]
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as UITableViewCell

        cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)

        cell.textLabel?.text = self.animals[indexPath.row]
        cell.detailTextLabel?.text = self.animals[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}



