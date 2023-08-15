import Foundation

struct Expense: Identifiable {
    
    let id = UUID()
    let name: String
    let category: String
    let price: Double
}
