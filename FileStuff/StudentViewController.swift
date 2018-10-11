import UIKit

class StudentViewController: UIViewController {
  
  @IBOutlet var nameField: UITextField!
  @IBOutlet var ageField: UITextField!
  @IBOutlet var cohortField: UITextField!
  
  @IBAction func cancel(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  func studentRecord() -> Student? {
    guard let name = nameField.text, !name.isEmpty
      else { return nil }
    let age: Int? = Int(ageField.text ?? "")
    let cohort = cohortField.text
    return Student(name: name, age: age, cohort: cohort)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // If you're editing a record, what do you do here?
    
  }
}
