//
//  ViewController.swift
//  ant
//
//  Created by Dustin Peaire on 3/22/20.
//  Copyright © 2020 Dustin Peaire. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController, UITableViewDataSource {
    //MARK:API Dummy Data
    private let transactions = TransactionAPI.getTransactions()
    
    
    //MARK: Setup Tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath)
        cell.textLabel?.text = transactions[indexPath.row].transactionLocation
        return cell
    }
    
    
    //MARK: Setup Page Views
    let transactionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        view.addSubview(transactionsTableView)
        
        setupTransactionTableView()
        
        transactionsTableView.dataSource = self
        
        transactionsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "transactionCell")
    }
    
    //MARK:Constraint Setup
    
    func setupTransactionTableView(){
        transactionsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        transactionsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        transactionsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        transactionsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
    }
    
    func setUpNavigation(){
        navigationItem.title = "Transactions"
        self.navigationController!.navigationBar.barTintColor = UIColor(r: 99,g: 212,b: 113)
        self.navigationController!.navigationBar.isTranslucent = false
    self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    
}

extension UIColor{
convenience init(r: CGFloat,g: CGFloat,b: CGFloat) {
    self.init(red: r/255,green: g/255,blue: b/255,alpha: 1)
}
}

