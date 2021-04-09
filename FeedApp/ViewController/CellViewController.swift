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
    }
}