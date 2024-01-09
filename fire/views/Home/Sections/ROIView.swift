//
//  ROIView.swift
//  fire
//
//  Created by Nikolaj Johannes Skole Jensen on 09/01/2024.
//

import SwiftUI
import Charts
import Defaults

struct ROIView: View {
    @Default(.investedValue) private var invested
    @Default(.investedPerMonth) private var investedPerMonth
    @Default(.roi) private var returnRate
    @Default(.currency) private var currency
    
    @State private var years = 30.0
    
    var currentYear: Int { Calendar.current.component(.year, from: Date.now) }
    var yearValues: [YearValue] { Financials.getYearlyReturns(years: Int(years))}
    var totalDeposits: Double {
        yearValues.reduce(invested) { (total, curr) in
            return total + curr.deposit
        }
    }
    var totalInterest: Double {
        yearValues.reduce(0.0) { (total, curr) in
            return total + curr.interest
        }
    }
    
    var body: some View {
        Section("ROI") {
            Grid(alignment: .leading) {
                if let last = yearValues.last {
                    GridRow {
                        Text("Balance").font(.headline)
                        Spacer()
                        Text(last.total, format: .currency(code: currency))
                    }
                }
                GridRow {
                    Text("Total deposits:").font(.headline)
                    Spacer()
                    Text(totalDeposits, format: .currency(code: currency))
                }
                GridRow {
                    Text("Total interest:").font(.headline)
                    Spacer()
                    Text(totalInterest, format: .currency(code: currency))
                }
            }
            
            Chart(yearValues) { val in
                LineMark(
                    x: .value("Year", getYear(val.idx)),
                    y: .value("Value", val.total)
                )
            }
            .chartYAxis {
                AxisMarks(
                    format: Decimal.FormatStyle.Currency.init(code: currency).presentation(.narrow)
                )
            }
            .padding(.vertical)
            
            HStack {
                Text("\(years, format: .number) years").frame(minWidth: 100, alignment: .leading)
                Slider(value: $years, in: 1...50, step: 1) {
                    Text(years, format: .number)
                }
            }
        }
    }
    
    private func getYear(_ idx: Int) -> Date {
        let components = DateComponents(year: currentYear + idx + 1, month: 0, day: 0, hour: 0, minute: 0)
        return Calendar.current.date(from: components)!
    }
}

#Preview {
    ROIView()
}
