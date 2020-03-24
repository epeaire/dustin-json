//
//  TransactionAPI.swift
//  ant
//
//  Created by Dustin Peaire on 3/22/20.
//  Copyright © 2020 Dustin Peaire. All rights reserved.
//

import Foundation

class TransactionAPI{
    static func getTransactions() -> [Transaction]{
        let transactions = [
            Transaction(transactionLocation: "BP Gas Station", transactionAmount: 5.46, transactionRound: 0.54),
            Transaction(transactionLocation: "Whole Foods", transactionAmount: 50.22, transactionRound: 0.78),
            Transaction(transactionLocation: "Al's Bar", transactionAmount: 25.78, transactionRound: 0.22)
        ]
        return transactions
    }
}


