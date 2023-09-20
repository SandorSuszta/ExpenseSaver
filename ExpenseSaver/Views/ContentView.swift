//
//  ContentView.swift
//  ExpenseSaver
//
//  Created by Nataliia Shusta on 15/08/2023.
//

import SwiftUI

struct ContentView: View {
    private var expensesSrore = ExpensesStore()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expensesSrore.items) { item in
                    HStack {
                        VStack {
                            Text(item.name)
                            Text(item.category)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Text("\(item.price)")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Expenses")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expensesStore: expensesSrore)
        }
    }
}

// MARK: - Private methods

extension ContentView {
    private func deleteItems(at offsets: IndexSet) {
        expensesSrore.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
