//
//  FIREView.swift
//  fire
//
//  Created by Nikolaj Johannes Skole Jensen on 09/01/2024.
//

import SwiftUI
import Defaults

struct FIREView: View {
    @Default(.investedValue) private var invested
    @Default(.investedPerMonth) private var investedPerMonth
    @Default(.yearlyIncome) private var yearlyIncome
    @Default(.yearlyExpenses) private var yearlyExpenses
    @Default(.roi) private var roi
    @Default(.withdrawalRate) private var withdrawalRate
    
    @Default(.currency) private var currency
    
    var yearsUntilFIRE: Int { Financials.getFIREYears() }
    var neededInvestment: Double { Financials.getFIRENumber() }
    
    var body: some View {
        Section("FIRE") {
            Text(
                yearsUntilFIRE <= 0
                ? "Congratulations you've achieved FIRE with investments valued to: \(neededInvestment, format: .currency(code: currency))"
                : "FIRE in \(yearsUntilFIRE, format: .number) years, with investments valued to: \(neededInvestment, format: .currency(code: currency))"
            )
            .font(.title3)
            .fontWeight(.heavy)
            
            HStack {
                Text("Withdrawal rate").frame(minWidth: 100, alignment: .leading)
                Slider(value: $withdrawalRate, in: 1...10, step: 0.1) {
                    Text(withdrawalRate, format: .number)
                }
                Text(withdrawalRate / 100, format: .percent).frame(minWidth: 50, alignment: .trailing)
            }
        }
    }
}

#Preview {
    FIREView()
}
