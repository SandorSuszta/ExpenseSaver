import Foundation

final class ExpensesStore: ObservableObject {
    @Published var items: [Expense] = [Expense(name: "Dog", category: "Dull", price: 1.23)]
}
