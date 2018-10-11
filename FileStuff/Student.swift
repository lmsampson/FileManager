import Foundation

class Student: CustomStringConvertible, Codable {
  let name: String
  let age: Int?
  let cohort: String?
  
  var description: String {
    var result = "\(name), Cohort: \(cohort ?? "[unknown cohort]")"
    if let age = age {
      result += ", (\(age) y.o.)"
    }
    return result
  }
  
  init(name: String, age: Int?, cohort: String?) {
    (self.name, self.age, self.cohort) = (name, age, cohort)
  }
}
