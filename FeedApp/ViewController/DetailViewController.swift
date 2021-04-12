//
//  DetailViewController.swift
//  FeedApp
//
//  Created by orpan on 09.04.2021.
//

import SwiftUI

class DetailViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet var didTapBackButton: UIBarButtonItem!
    @IBOutlet var titleViewLabel: UINavigationBar!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    //MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func configure(with item: NewsForView){
        ImageDownloader.shared.downloadImage(with: item.imageUrl, completionHandler: { (image, cached) in
            self.imageView.image = image
        }, placeholderImage: UIImage(named: "placeholder_profile_pic"))
        titleViewLabel.topItem?.title = item.title
    }
}
