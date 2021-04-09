//
//  DetailViewController.swift
//  FeedApp
//
//  Created by orpan on 09.04.2021.
//

import SwiftUI

class DetailViewController: UIViewController {
    
    @IBOutlet var backButton: UIBarButtonItem!
    @IBOutlet var titleViewLabel: UINavigationBar!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setNavBarToTheView(with textTitle: String) {
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 64.0))
        self.view.addSubview(navBar);
        let navItem = UINavigationItem(title: textTitle);
        navItem.backBarButtonItem = UIBarButtonItem(
            title: "Назад", style: .plain, target: nil, action: nil)

        navBar.setItems([navItem], animated: true);
    }
    
    func configure(with item: NewsForView){
        ImageDownloader.shared.downloadImage(with: item.imageUrl, completionHandler: { (image, cached) in
            self.imageView.image = image
        }, placeholderImage: UIImage(named: "placeholder_profile_pic"))

    }
}
