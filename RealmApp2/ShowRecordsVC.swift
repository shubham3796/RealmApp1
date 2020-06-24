//
//  ShowRecordsVC.swift
//  RealmApp2
//
//  Created by Pranjal Singhai on 18/06/20.
//  Copyright © 2020 Capgemini. All rights reserved.
//

import UIKit

class ShowRecordsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    @IBOutlet weak var recordsCollectionView: UICollectionView!
    
     var employeesList = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(employeesList)
        // Do any additional setup after loading the view.
        
        recordsCollectionView.delegate = self
        recordsCollectionView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //return The number of rows in section.
        employeesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //return A configured cell object.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecordCell", for: indexPath) as! RecordCell
        
        cell.userName.text = employeesList[indexPath.row].userName
        cell.lastname.text = employeesList[indexPath.row].lastName
        cell.employeeId.text = String(employeesList[indexPath.row].employeeId)
        cell.phoneNumber.text = String(employeesList[indexPath.row].phoneNumber)
        cell.emailId.text = employeesList[indexPath.row].emailId
        
        return cell
    }
   
    
}
