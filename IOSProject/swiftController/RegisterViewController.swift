//
//  RegisterViewController.swift
//  IOSProject
//
//  Created by pc5 on 5/4/19.
//  Copyright © 2019 pc5. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController ,UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    

    @IBOutlet weak var textFerstName: UITextField!
    @IBOutlet weak var textLastName: UITextField!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var textUserName: UITextField!
    @IBOutlet weak var TextEmail: UITextField!
    @IBOutlet weak var textMobleNumber: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var textCountry: UITextField!
    @IBOutlet weak var textOfBarth: UITextField!
    @IBOutlet weak var segGender: UISegmentedControl!
    var BirthPicker : UIDatePicker = UIDatePicker();
    var cityPickerView : UIPickerView = UIPickerView()
    var citiesNames : [String] = ["Rafah","Khanyounis","DerAlbalah","AlMaghazi","AlNsirat","AlBrij","Gaza","Jabalia","BetLahia","BetHanon"]
    override func viewDidLoad() {
        super.viewDidLoad()
        imgUser.layer.cornerRadius = 64;
        imgUser.layer.borderWidth = 2
        imgUser.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        cityPickerView.delegate = self
        cityPickerView.dataSource = self
        BirthPicker.datePickerMode = .date
        textCountry.inputView = cityPickerView
        textOfBarth.inputView = BirthPicker
        BirthPicker.addTarget(self, action: #selector(dateOfBirthPickerChanged), for: .valueChanged)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onActionChengeImage(_ sender: Any) {
        let imagePicker = UIImagePickerController.init()
        imagePicker.delegate = self
        
        let actionSheet = UIAlertController.init(title: "Image", message: "Select Image Source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction.init(title: "From Camera", style: .default, handler: { (action) in
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction.init(title: "From Album", style: .default, handler: { (action) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    @IBAction func onActionSignUp(_ sender: Any) {
        do{
            var gender:String!
            switch segGender.numberOfSegments {
            case 0:
                gender="Male"
                return
            case 1:
                gender="FeMale"
            default:
                break
                
            }
            let user=User.init(username:textUserName.text! , password: textPassword.text!, Email: TextEmail.text!, FirstName: textFerstName.text!, LastName: textLastName.text!, numberMobile: textMobleNumber.text!, Country: textCountry.text!, DateBarth: textOfBarth.text!, Gender: gender)
                let encodedUser = try NSKeyedArchiver.archivedData(withRootObject: user, requiringSecureCoding: false)
                UserDefaults.standard.set(encodedUser, forKey: "User")
        }catch{
            
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return citiesNames.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return citiesNames[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textCountry.text = citiesNames[row]
        textCountry.resignFirstResponder()
    }
    
    @objc func dateOfBirthPickerChanged(){
        let df = DateFormatter();
        df.dateFormat = "MMM/dd/yyyy"
        textOfBarth.text = df.string(from: BirthPicker.date)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true) {
            let image = info[.originalImage] as? UIImage
            self.imgUser.image = image
        }
    }
    
}
