import Foundation

struct Expense: Identifiable, Codable {
    
    var id = UUID()
    let name: String
    let category: String
    let price: Double
}
