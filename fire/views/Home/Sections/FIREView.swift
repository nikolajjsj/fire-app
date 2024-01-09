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
                : "You can go FIRE in \(yearsUntilFIRE, format: .number) years, with investments valued to: \(neededInvestment, format: .currency(code: currency))"
            )
            .fontWeight(.bold)
            
            Picker("Withdrawal rate (per year)", selection: $withdrawalRate) {
                ForEach(Array(1...100).map({ Double($0) / 10.0 }), id: \.self) { rate in
                    Text(rate / 100, format: .percent).tag(rate)
                }
            }
        }
    }
}

#Preview {
    FIREView()
}
