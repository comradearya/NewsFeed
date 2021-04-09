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
    
    var newsList = [NewsForView] ()
    
    /*let news = newsList[indexPath.row]
     
     cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
     
     cell.textLabel?.text = news.title
     cell.detailTextLabel?.text = news.description
     if let url = URL(string: news.imageUrl){
     let imageUi = imageView.loadImage(from: url)
     }
     return cell*/
    
    func configureCell(item: NewsForView){
        cellTitleLabel.text = item.title
        cellDescriptionLabel.text = item.description
    }
}
