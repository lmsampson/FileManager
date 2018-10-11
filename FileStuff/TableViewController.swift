import UIKit

class TableViewController: UITableViewController {
  @IBOutlet var studentManager: StudentManager!
  
  // MARK: - Data Model
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return studentManager.students.count
  }
  
  let reuseIdentifier = "cell"
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
    cell.textLabel?.text = studentManager.students[indexPath.row].description
    return cell
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }
  
  // MARK: - Table Delegate
  
  // Enable "magic" swipe-to-delete
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
    // Only handle deletions
    guard editingStyle == .delete else { return }
    
    // Update model then refresh view
    studentManager.removeRecord(at: indexPath.row)
    tableView.reloadData()
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // Add your work here to edit existing items
  }
  
  // MARK: - Data exchange with other controllers
  
  @IBAction func unwindFor(_ unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
    guard let source = unwindSegue.source as? StudentViewController
      else { return }
    
    // Don't ever touch view from segue, only state
    if let studentRecord = source.studentRecord() {
      // You'll need to know whether to add a record or if
      // you're changing an existing record. If you're just
      // changing a record, what change do you need to make here?
      studentManager.addRecord(studentRecord)
    }
    self.tableView.reloadData()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // fetch destination and cast it to the right (StudentViewController) type
    
    // set some kind of student data record and figure out how you'll know
    // whether the record will be edited when control returns to you
  }
}

