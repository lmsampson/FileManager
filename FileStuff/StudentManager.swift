import Foundation

// Note: My json file was stored in /Users/ericasadun/Library/Developer/CoreSimulator/Devices/0BCADBAB-5E29-4C6A-B414-69F4991E32C9/data/Containers/Data/Application/7E9193EE-83EA-42C5-A63E-38CE05A9AC0B/Documents
// Yours will be stored in a different device and container but the path
// will be similar.

class StudentManager: NSObject {
  var students: [Student] = []
  
  let url = URL(fileURLWithPath: NSHomeDirectory())
    .appendingPathComponent("Documents")
    .appendingPathComponent("students.json")

  // Purists might insist on this old-style way to access the
  // Documents folder:
//  let url = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!).appendingPathComponent("students.json")
  
  func writeToFile() {
    do {
      let data = try JSONEncoder().encode(students)
      try data.write(to: url)
    } catch {
      print("Error while saving students: \(error)")
      return
    }
  }
  
  func readFromFile() {
    do {
      let data = try Data(contentsOf: url)
      let records = try JSONDecoder().decode([Student].self, from: data)
      students.append(contentsOf: records)
    } catch {
      print("Error while reading students: \(error)")
      return
    }
  }
  
  func addRecord(_ student: Student) {
    students.append(student)
    writeToFile()
  }
  
  func removeRecord(at idx: Int) {
    students.remove(at: idx)
    writeToFile()
  }
  
  override init() {
    super.init()
    readFromFile()
  }
}
