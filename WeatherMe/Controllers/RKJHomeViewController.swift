//
//  RKJHomeViewController.swift
//  WeatherMe
//
//  Created by Rajive Jain on 11/16/17.
//  Copyright © 2017 Rajive Jain. All rights reserved.
//

import Foundation
import UIKit

class RKJHomeViewController : UIViewController {
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    let weatherService = WeatherWebService()
    var dataSource: WeatherDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeServices()
        initializeHeaderView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    private func initializeServices()
    {
        self.dataSource = WeatherDataSource(with: weatherService, for: self.tableView)
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
    }
    
    private func initializeHeaderView() {
//        let nib = UINib(nibName: "WeatherHeaderView", bundle: nil)
//        self.tableView.register(nib, forHeaderFooterViewReuseIdentifier: "WeatherHeaderView")
    }
    
    @IBAction func searchTapped(_ sender: UIButton) {
        if let city = self.searchField.text {
            print("\(city)")
            self.dataSource?.fetchData(for: city)
        }
    }
    
}
