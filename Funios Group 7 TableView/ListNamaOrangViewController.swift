//
//  ViewController.swift
//  Funios Group 7 TableView
//
//  Created by PT.Koanba on 29/07/22.
//

import UIKit

class ListNamaOrangViewController: UITableViewController {
    
    var listPerson: [Person] = []
     
    @IBOutlet weak var buttonAddData: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        listPerson = getDummyData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellPeopleNameIdentifier", for: indexPath) as! CustomPeopleCell
        
        let person = listPerson[indexPath.row]
        
        cell.labelName.text = person.name
        cell.imageViewPhoto.image = person.photo
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPerson.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let person = listPerson[indexPath.row]
        
        let alertDialog = UIAlertController(title: person.name, message: "Kamu memilih \(person.name)", preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "OKE", style: .default)
        let cancelButton = UIAlertAction(title: "Batal", style: .destructive)
        alertDialog.addAction(actionButton)
        alertDialog.addAction(cancelButton)
        
        self.present(alertDialog, animated: true)
    }

    func getDummyData() -> [Person] {
        [
            Person(photo: UIImage(named: "imagePerson1")!, name: "Burhan"),
            Person(photo: UIImage(named: "imagePerson2")!, name: "Santoso"),
            Person(photo: UIImage(named: "imagePerson3")!, name: "Kelly"),
            Person(photo: UIImage(named: "imagePerson4")!, name: "Jonat"),
            Person(photo: UIImage(named: "imagePerson5")!, name: "Saihan"),
        ]
    }
}


