//
//  financial_utils.swift
//  fire
//
//  Created by Nikolaj Johannes Skole Jensen on 09/01/2024.
//

import Foundation
import Defaults

class Financials {
    static func getYearlyReturns(years: Int) -> [YearValue] {
        var values = [YearValue]()
        for idx in 0...years {
            let currentInvested = idx == 0 ? Defaults[.investedValue] : values[idx - 1].total
            values.append(Financials.calculateYearReturns(idx: idx, invested: currentInvested))
        }
        return values
    }
    
    static func getFIRENumber() -> Double {
        let times = 100 / Defaults[.withdrawalRate]
        return Defaults[.yearlyExpenses] * times
    }
    
    static func getFIREYears() -> Int {
        let FIRENumber = getFIRENumber()
        var years = 0
        var currentInvested = Defaults[.investedValue]
        
        while currentInvested < FIRENumber {
            years += 1
            currentInvested = calculateYearReturns(idx: years, invested: currentInvested).total
        }
            
        return years
    }
    
    static func calculateYearReturns(idx: Int, invested: Double) -> YearValue {
        let rate = Defaults[.roi] / 100
        let interest = invested * rate
        let deposits = Defaults[.investedPerMonth] * 12
        
        return YearValue(
            idx: idx,
            deposit: deposits,
            interest: interest,
            total: invested + interest + deposits
        )
    }
}

struct YearValue: Identifiable {
    var id: Int { self.idx }
    
    let idx: Int
    let deposit: Double
    let interest: Double
    let total: Double
}

