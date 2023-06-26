//
//  CakeDetailViewController.swift
//  CakeItApp
//
//  Created by David McCallum on 21/01/2021.
//

import UIKit

class CakeDetailViewController: UIViewController {
    
    @IBOutlet private weak var cakeImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    

    var viewModel:CakeDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateData()
    }
    
    func populateData(){
        title = viewModel?.cake.title
        titleLabel.text = viewModel?.cake.title
        descriptionLabel.text = viewModel?.cake.desc
        if let imageURLSting = viewModel?.cake.image,
           let imageURL = URL(string: imageURLSting){
            cakeImageView.loadImageWithURL(imageURL)
        }
    }
}
