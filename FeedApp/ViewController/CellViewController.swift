//
//  CellViewController.swift
//  FeedApp
//
//  Created by orpan on 09.04.2021.
//

import Foundation
import UIKit

class CellViewController: UITableViewCell{
    
    @IBOutlet var cellTitleLabel: UILabel!
    @IBOutlet var cellDescriptionLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!

    func configureCell(item: NewsForView){
        cellTitleLabel.text = item.title
        cellDescriptionLabel.text = item.description
        ImageDownloader.shared.downloadImage(with: item.imageUrl, completionHandler: { (image, cached) in
                    self.cellImageView.image = image
                }, placeholderImage: UIImage(named: "placeholder_profile_pic"))
    }
}
