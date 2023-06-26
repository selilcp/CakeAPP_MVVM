//
//  CakeListViewController.swift
//  CakeItApp
//
//  Created by David McCallum on 20/01/2021.
//

import UIKit

class CakeListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var i = 0
    var cakes: [Cake] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "🎂CakeItApp🍰"
        tableView.dataSource = self
        tableView.delegate = self
        registerCakeListCell(tableView: tableView)
    }
    
    func registerCakeListCell(tableView:UITableView){
        let nib = UINib(nibName: "CakeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CakeTableViewCell")
    }
}

extension CakeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        i = indexPath.row
        performSegue(withIdentifier: "segue", sender: tableView)
    }
    
}

extension CakeListViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return cakes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CakeTableViewCell") as! CakeTableViewCell
        let cake = cakes[indexPath.row]
        cell.titleLabel.text = cake.title
        cell.descLabel.text = cake.desc
        
        
        
        
        let imageURL = URL(string: cake.image)!
        
        guard let imageData = try? Data(contentsOf: imageURL) else { return cell }
            
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
            cell.cakeImageView.image = image
            }
        return cell
    }
}

