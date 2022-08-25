//
//  ListViewController.swift
//  Funios Group 7 TableView
//
//  Created by PT.Koanba on 29/07/22.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var listPersonTableView: UITableView!
    // buat var people dengan type data array person dengan nilai value array kosong
    var people: [Person] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //assign nilai people
        people = getDummyData()
        
        
        listPersonTableView.dataSource = self
        listPersonTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count //karena orangnya tidak pasti
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //kita merun table view cell dengan identifier list people
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "listpeople") as! CustomPeopleCell
        //dequeuereusablecell =
        let cell = tableView.dequeueReusableCell(withIdentifier: "listpeople"
                                            
                                                 
        ) as! CustomPeopleCell
        //assign untuk menunjukkan nama yang berbeda, menunjukkan foto ini namanya ini
        //indexpath.row nunjukin indeks ke berapa
        //mengambil data dari swift file person
        let person = people[indexPath.row]
        cell.imageViewPhoto.image = person.photo
        cell.labelName.text = person.name
      
        return cell
    }
    
    //ketika sudah memilih atu klik cell itu...

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // create the alert
               let alert = UIAlertController(title: "Nama Orang", message: "Apakah anda akan merubah nama anda?", preferredStyle: UIAlertController.Style.alert)

               // add the actions (buttons)
               alert.addAction(UIAlertAction(title: "Ya", style: UIAlertAction.Style.default, handler: nil))
               alert.addAction(UIAlertAction(title: "Tidak", style: UIAlertAction.Style.cancel, handler: nil))

               // show the alert
               self.present(alert, animated: true, completion: nil)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
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
