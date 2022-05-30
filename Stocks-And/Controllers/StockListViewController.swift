//
//  StockListViewController .swift
//  Stocks-And
//
//  Created by Andrey Kim on 26.05.2022.
//

import UIKit

class StockListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpSearchController()
    }
    
    private func setUpSearchController() {
        let resultVC = SearchViewController()
        let searchVC = UISearchController(searchResultsController: resultVC)
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
    }
}

extension StockListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              let resultsVC = searchController.searchResultsController as? SearchViewController,
              !query.trimmingCharacters(in: .whitespaces) .isEmpty else {
            return
        }
        
        /// Call API to search
        
        print(query)
    }
    
}

