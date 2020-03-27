//
//  TransactionTableViewCell.swift
//  ant
//
//  Created by Dustin Peaire on 3/24/20.
//  Copyright © 2020 Dustin Peaire. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    var transaction: Transaction? {
        didSet{
            guard let transactionItem = transaction else {return}
            if let month = transactionItem.transactionDate{
                monthLabel.text = month
            }
            if let location = transactionItem.transactionLocation{
                locationLabel.text = location
            }
            if let amount = transactionItem.transactionAmount{
                amountLabel.text = String(amount)
            }
            if let difference = transactionItem.transactionRound{
                differenceLabel.text = String(difference)
            }
        }
    }
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(monthLabel)
        containerView.addSubview(locationLabel)
        containerView.addSubview(amountLabel)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(differenceLabel)
        
        setupMonthLabelConstraints()
        setupContainerViewConstraints()
        setupLocationLabelConstraint()
        setupAmountLabelConstraint()
        setupDifferenceLabelConstraint()
     }
     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

   //MARK: Build labels
    
    let monthLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.blue
        label.layer.cornerRadius = 30
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize:20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let amountLabel:UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.blue
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    let differenceLabel:UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red:99/255,green:212/255, blue: 113/225, alpha: 1 )
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Set up autoconstraints
    
    func setupMonthLabelConstraints(){
        monthLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        monthLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        monthLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        monthLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setupContainerViewConstraints(){
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.monthLabel.trailingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -20).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupLocationLabelConstraint(){
        locationLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
    }
    
    func setupAmountLabelConstraint(){
        amountLabel.topAnchor.constraint(equalTo: self.locationLabel.bottomAnchor).isActive = true
        amountLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
    }
    
    func setupDifferenceLabelConstraint(){
        differenceLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        differenceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true
        differenceLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor).isActive = true
    }
    
}
