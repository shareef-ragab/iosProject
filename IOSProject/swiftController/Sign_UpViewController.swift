//
//  Sign_UpViewController.swift
//  IOSProject
//
//  Created by pc5 on 5/4/19.
//  Copyright © 2019 pc5. All rights reserved.
//

import UIKit

class Sign_UpViewController: UIViewController {

    @IBOutlet weak var textUserName: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onActionSign_in(_ sender: Any) {
        let tool=Tools.init();
        if tool.chechUser(UserName: textUserName.text!, Password: textPassword.text!) {
            let welcome = storyboard!.instantiateViewController(withIdentifier: "CenterWaelcome");
            self.present(welcome, animated: true) {
                var loginCon=UserDefaults.standard.object(forKey: "countLog") as? Int
                loginCon=loginCon ?? 0+1
                UserDefaults.standard.set(loginCon, forKey: "countLog")
            }
            
        }else{
            tool.showMassege(TextView: "Try ageen password is Faild")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
