
import RealmSwift
import UIKit

// MARK: DB Protocol Methods

protocol RealmViewModelDelegate{
    func RecordSaved()
    func RecordSavingFailed(error: NSError)
    func RecordFetched(employees: [Employee])
    func RecordDeleted()
}

// Make RealmViewModelDelegate methods optionals

extension RealmViewModelDelegate {
    func RecordSaved() {}
    func RecordSavingFailed(error: NSError) {}
    func RecordFetched(employees: [Employee]) {}
    func RecordDeleted() {}
}

class RealmViewModel: NSObject {
    let realm = try! Realm()
    var delegate: RealmViewModelDelegate?
    
    // MARK: DB Helper Methods
    
    func saveRecord(employee: Employee){
        //Persist your data easily
        try! realm.write {
            realm.add(employee)
            delegate?.RecordSaved() // Notify for successful indertion
        }
        // Note: Here we can handle error in catch block and notify  using
        //RecordSavingFailed(error: NSError)
    }
    
    func fetchRecords() -> [Employee]{
        let employees = realm.objects(Employee.self)
        print("Fetching records...")
        if employees.count > 0 {
            var employeesList = [Employee]()
            for employee in employees {
                employeesList.append(employee)
                print(employee)
                print("_______________________________________")
            }
            delegate?.RecordFetched(employees: employeesList) // Notify with records fetched
            return employeesList
        } else {
            delegate?.RecordFetched(employees: [])
            return []
        }
        
    }
    
    func deleteRecord(employee: Employee){
        //Persist your data easily
        try! realm.write {
            realm.delete(employee)
            delegate?.RecordDeleted() //Notify for successful deletion
        }
    }
}
