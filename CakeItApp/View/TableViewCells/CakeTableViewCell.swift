//
//  CakeTableViewCell.swift
//  CakeItApp
//
//  Created by David McCallum on 21/01/2021.
//

import UIKit

class CakeTableViewCell: UITableViewCell {
    @IBOutlet weak var cakeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    func updateUI(title:String?,
                  description:String?,
                  imageURL:String?){
        titleLabel.text = title
        descLabel.text = description
        cakeImageView.image = nil
        if let urlString = imageURL,
           let url = URL(string: urlString){
            cakeImageView.loadImageWithURL(url)
        }
    }
}
