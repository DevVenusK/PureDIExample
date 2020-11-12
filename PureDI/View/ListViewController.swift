//
//  ViewController.swift
//  PureDI
//
//  Created by MAXST on 2020/11/11.
//

import UIKit

import Pure

class ListViewController: UITableViewController, FactoryModule {

    struct Dependency {
        let networking: NetworkingType
        let detailViewFactory: DetailViewController.Factory
        let listTableViewCellConfigurator: ListTableViewCell.Configurator?
    }
    
    var networking: NetworkingType?
    var detailViewFactory: DetailViewController.Factory?
    var listTableViewCellConfigurator: ListTableViewCell.Configurator?
    
    var items: [Items] = []
    
    required init(dependency: Dependency, payload: ()) {
        self.networking = dependency.networking
        self.detailViewFactory = dependency.detailViewFactory
        self.listTableViewCellConfigurator = dependency.listTableViewCellConfigurator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var url = URLComponents(string: "https://api.github.com/search/repositories")!
        url.query = "q=rxswift"
        
        networking?.reqeust(url: url.url!, data: Repositories.self) { data in
            self.items = data.items
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath)
        listTableViewCellConfigurator?.configure(cell as! ListTableViewCell, payload: .init(fullName: items[indexPath.item].fullName!))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = detailViewFactory!
            .create(payload: .init(imageURL: (items[indexPath.item].owner?.avatarURL!)!))
        present(viewController, animated: true, completion: nil)
    }
}
