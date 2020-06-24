

import UIKit

class AddRecordVC: UIViewController {

// MARK: Properties
    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var employeeIdTF: UITextField!
    
    @IBOutlet weak var emailIdTF: UITextField!
    
    @IBOutlet weak var phoneNumberTF: UITextField!
    
    private var employeesList = [Employee]()
    
    //dbViewModel.delegate = self
    private lazy var dbViewModel: RealmViewModel = {
        let vm = RealmViewModel()
        vm.delegate = self as? RealmViewModelDelegate
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showRecords" {
            print("........................................................")
            let destinationVC = segue.destination as? ShowRecordsVC
            
            destinationVC?.employeesList = employeesList
        }
        
        
    }
    
// MARK: Action
    @IBAction func saveRecord(_ sender: UIButton) {
        let employee = Employee()
        employee.userName = userNameTF.text ?? ""
        employee.lastName = lastNameTF.text ?? ""
        employee.employeeId = Int(employeeIdTF.text ?? "0") ?? 0
        employee.phoneNumber = Int(phoneNumberTF.text ?? "0") ?? 0
        employee.emailId = emailIdTF.text ?? ""
        
        self.view.endEditing(true)
        
        dbViewModel.saveRecord(employee: employee)
    }
    
    @IBAction func showRecords(_ sender: UIButton) {
        employeesList = dbViewModel.fetchRecords()
        performSegue(withIdentifier: "showRecords", sender: sender)
    }
    
//    // MARK: RealmViewModelDelegate
//    extension AddRecordVC: RealmViewModelDelegate {
//        //Can be used to add alerts
//    }
//    

}

