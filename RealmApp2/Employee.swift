

import Foundation
import RealmSwift

class Employee: Object {
    @objc dynamic var userName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var employeeId = 0
    @objc dynamic var phoneNumber = 0
    @objc dynamic var emailId = ""
}
