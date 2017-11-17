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
    
    private let weatherService = WeatherWebService()
    private var dataSource: WeatherDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeServices()
    }
    
    fileprivate func initializeServices() {
        self.dataSource = WeatherDataSource(with: weatherService, for: self.tableView)
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
    }
    
    @IBAction func searchTapped(_ sender: UIButton) {
        self.searchField.resignFirstResponder()
        if let city = self.searchField.text {
            self.dataSource?.fetchData(for: city)
        }
    }
    
}
