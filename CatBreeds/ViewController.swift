//
//  ViewController.swift
//  CatBreeds
//
//  Created by Roman Arriaga on 3/19/25.
//

import UIKit

// 

protocol ViewControllerProtocol: AnyObject {
    func refreshUI()
    func showError()
}
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel = BreedViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.delegate = self
        viewModel.fetchBreeds()
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.breeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BreedTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(breed: viewModel.breeds[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
}


extension ViewController: ViewControllerProtocol {
    func refreshUI() {
        tableView.reloadData()
    }
    func showError() {
        
    }
}
