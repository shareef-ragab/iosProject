//
//  SignIn_ReViewController.swift
//  IOSProject
//
//  Created by pc5 on 5/4/19.
//  Copyright © 2019 pc5. All rights reserved.
//

import UIKit

class SignIn_ReViewController: UIViewController {

    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var imagUser: UIImageView!
    @IBOutlet weak var butContinueUse: UIButton!
    var user_name:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            if let encodedUser = UserDefaults.standard.object(forKey: "User") as? Data {
                let user = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(encodedUser) as? User
                butContinueUse.setTitle(user?.username, for: .application)
                user_name=user?.username
            }
        }catch{
        }
    }
    

    @IBAction func onActionContinue(_ sender: Any) {
        let tool=Tools.init();
        if tool.chechUser(UserName: user_name, Password: textPassword.text!) {
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

}
