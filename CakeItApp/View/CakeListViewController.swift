//
//  CakeListViewController.swift
//  CakeItApp
//
//  Created by David McCallum on 20/01/2021.
//

import UIKit

class CakeListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var viewModel:CakeListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "🎂CakeItApp🍰"
        tableView.dataSource = self
        tableView.delegate = self
        registerCakeListCell(tableView: tableView)
        viewModel = CakeListViewModel(service: DefaultCakeListService())
        fetchData()
    }
    
    func registerCakeListCell(tableView:UITableView){
        let nib = UINib(nibName: "CakeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CakeTableViewCell")
    }
    
    func fetchData(){
        viewModel?.fetchCakeList(complitionHandler: { error in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}

extension CakeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension CakeListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cakesCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CakeTableViewCell") as! CakeTableViewCell
        let cake = viewModel?.getCakeWithPosition(pos: indexPath.item)
        cell.updateUI(title: cake?.title,
                      description: cake?.desc,
                      imageURL: cake?.image)
        return cell
    }
}

