//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Yiğit Bayraktaroğlu on 11.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    
    @IBOutlet weak var birthdayInput: UITextField!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")

        //Casting as? vs as!
        
        if let newName = storedName as? String{
            nameLabel.text = "Name: \(newName)"
        }
        
        if let newBirthday = storedBirthday as? String{
            birthdayLabel.text = "Birthday: \(newBirthday)"
        }
        
        
    }

    @IBAction func saveClicked(_ sender: Any) {
        UserDefaults.standard.set(nameInput.text!, forKey: "name")
        UserDefaults.standard.set(birthdayInput.text!, forKey: "birthday")
        //UserDefaults.standard.synchronize()
        
        nameLabel.text = "Name: \(nameInput.text!)"
        birthdayLabel.text = "Birthday: \(birthdayInput.text!) "

    }
 
    @IBAction func deleteClicked(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")

        if let newName = storedName as? String{
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name: "
        }
        
        if(storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday: "
        }
        
    }
    
    
}

