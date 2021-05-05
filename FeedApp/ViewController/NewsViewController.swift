//
//  ViewController.swift
//  FeedApp
//
//  Created by orpan on 08.04.2021.
//

import UIKit
import Realm

class NewsViewController: UIViewController {
    
    //MARK: - Properties
    
    let identifier = "NewsCell"
    var newsList = [NewsForView] ()
    var refreshControl = UIRefreshControl()
    private var observer: NSObjectProtocol?
    
    //MARK: - Outlets
    
    @IBOutlet var tableView: UITableView!
    
    //MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        refreshControl.attributedTitle = NSAttributedString(string: "Оновлюємо")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
        observer = NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: nil) { [unowned self] notification in
            loadData()
        }
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsList.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? NewsCellViewModel {
            cell.configureCell(item: newsList[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewControllerIdentifier") as? DetailViewController {
            self.present(detailsViewController, animated: true, completion: nil)
            detailsViewController.titleLabel.text = newsList[indexPath.row].title
            detailsViewController.descriptionLabel.text = newsList[indexPath.row].newsDescription
            detailsViewController.configure(with: newsList[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return 100
        return UITableView.automaticDimension
    }
}

extension NewsViewController {
    internal func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let bottomEdge = scrollView.contentOffset.y + scrollView.frame.height
        if bottomEdge >= scrollView.contentSize.height {
            loadData()
        }
    }
}
