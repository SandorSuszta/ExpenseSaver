//
//  AddView.swift
//  ExpenseSaver
//
//  Created by Nataliia Shusta on 15/08/2023.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expensesStore: ExpensesStore
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var category = ""
    @State private var price = 0.0
    
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Category", selection: $category) {
                    ForEach(types, id: \.self) { type in
                        Text(type)
                    }
                }
                TextField("Price", value: $price, format: .currency(code: "usd"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button {
                    expensesStore.items.append(makeExpense())
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
    }
    
    private func makeExpense() -> Expense {
        Expense(name: name, category: category, price: price)
    }
}
