//
//  DetailsView.swift
//  fire
//
//  Created by Nikolaj Johannes Skole Jensen on 09/01/2024.
//

import SwiftUI
import Defaults

// MARK: Defaults for key figures (non-settings)
extension Defaults.Keys {
    static let investedValue = Key<Double>("invested_value", default: 0.0)
    static let investedPerMonth = Key<Double>("invested_per_month_value", default: 0.0)
    static let yearlyIncome = Key<Double>("yearly_income", default: 0.0)
    static let yearlyExpenses = Key<Double>("yearly_expenses", default: 0.0)
    
    static let roi = Key<Double>("default_roi", default: 7.0)
    static let withdrawalRate = Key<Double>("withdrawalRate", default: 3.0)
    
    static let currency = Key<String>("currency", default: Locale.current.currency?.identifier ?? "USD")
}

struct DetailsView: View {
    @Default(.investedValue) private var invested
    @Default(.investedPerMonth) private var investedPerMonth
    @Default(.yearlyIncome) private var yearlyIncome
    @Default(.yearlyExpenses) private var yearlyExpenses
    
    @Default(.roi) private var roi
    
    @Default(.currency) private var currency
    
    var body: some View {
        List {
            Section("Invested") {
                TextField("Current value of investments", value: $invested, format: .currency(code: currency))
            }
            
            Section("Additional investments (per month)") {
                TextField("Invesments per month", value: $investedPerMonth, format: .currency(code: currency))
            }
            
            Section("Yearly income (after tax)") {
                TextField("Income per year", value: $yearlyIncome, format: .currency(code: currency))
            }
            Section("Yearly expenses") {
                TextField("Expenses per year", value: $yearlyExpenses, format: .currency(code: currency))
            }
    
            Section("ROI") {
                Picker("ROI (per year)", selection: $roi) {
                    ForEach(1...20, id: \.self) {
                        Text($0, format: .percent).tag(Double($0))
                    }
                }
            }
            
            Section("Currency") {
                Picker("Currency", selection: $currency) {
                    ForEach(Locale.Currency.isoCurrencies, id: \.identifier) { curr in
                        Text(curr.identifier).tag(curr.identifier)
                    }
                }
            }
        }
        .navigationTitle("Details")
    }
}

#Preview {
    DetailsView()
}
