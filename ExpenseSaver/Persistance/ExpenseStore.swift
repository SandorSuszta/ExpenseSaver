import Foundation

final class ExpensesStore: ObservableObject {
    @Published var items: [Expense] = [] {
        didSet {
            save(items)
        }
    }
    
    private let expensesKey = "expenses"
    
    // MARK: - Init
    
    init() {
        loadAllExpenses()
    }
    
    // MARK: - Private methods
    
    private func save(_ items: [Expense]) {
        let encodedItem = try? JSONEncoder().encode(items)
        
        UserDefaults.standard.set(encodedItem, forKey: expensesKey)
    }
    
    private func loadAllExpenses() {
        if let data = UserDefaults.standard.data(forKey: expensesKey) {
            if let decodedItems = try? JSONDecoder().decode([Expense].self, from: data) {
                items = decodedItems
            }
        }
        
        items = []
    }
}
