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
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath)
        cell.textLabel?.text = "1234"
        listTableViewCellConfigurator?.configure(cell as! ListTableViewCell, payload: .init(image: UIImage()))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = detailViewFactory?.create(payload: .init(id: indexPath.item))
        present(viewController!, animated: true, completion: nil)
    }
}
