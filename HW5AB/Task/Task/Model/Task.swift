

import Foundation

struct Task: Identifiable, Hashable {
  let id = UUID()
  var title: String
  var category: Category
  var isCompleted: Bool = false
  var notes: String = ""
}

enum Category:String, CaseIterable {
  case personal = "Personal"
  case work = "Work"
  case home = "Home"
  case noCategory = "No Category"
}
