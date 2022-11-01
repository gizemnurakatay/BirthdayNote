//
//  ViewController.swift
//  BirthdayNote
//
//  Created by Gizem Nur Bozkurt on 23.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //KAYDEDİLEN VERİLERLİ ÇEKMEK İÇİN
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // casting - as? (obsiyonel)  vs as! (kesin olarak çevr)
        // storedname i string olarak çevirebilsen eğer newName diye bir değişken oluştur demek
        if let newName = storedName as? String{
            nameTextLabel.text = "Name: \(newName)"
        }
        if let newBirthday = storedBirthday as? String{
            birthdayLabel.text = "Birthday: \(newBirthday)"
        }
    }


    @IBAction func savebuttontapped(_ sender: Any) {
        
        // VERİLERİ KAYDETMEK İÇİN!!!!!!! SET
        
        UserDefaults.standard.set(nameTextField.text!, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
        
        // artık alttaki kısım kullanılmıyor
        //UserDefaults.standard.synchronize()
        
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
        nameTextLabel.text = "Name: \(nameTextField.text!)"
        //nameTextLabel.text = nameTextField.text yukarıdakini bu şekilde de kullanabiliriz.
       
        
    }
    @IBAction func deleteButtonClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let srotedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // VERİLERİ SİLMEK İÇİN !! REMOVE
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameTextLabel.text = "Name: "
        }
        if (srotedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey:"birthday")
            birthdayLabel.text = "Birthday: "
        }
       
    }
}

