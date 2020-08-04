//
//  Tools.swift
//  IOSProject
//
//  Created by pc5 on 5/7/19.
//  Copyright © 2019 pc5. All rights reserved.
//

import UIKit

class Tools: NSObject {
    
    let url:String="";
    
    
    func chechUser(UserName username: String,Password password:String) -> Bool {
        var findUser:Bool=false;
        let url:URL=URL.init(string: self.url)!;
        let parmeter="username=\(username),password=\(password)"
        let sessin=URLSession.init(configuration: .default)
        var requst:URLRequest=URLRequest.init(url: url)
        requst.httpMethod="POST"
        requst.httpBody=parmeter.data(using: .utf8)
        sessin.dataTask(with: requst) { (Data, URLResponse, Error) in
            if(Error != nil){
                print(Error ?? "No Error")
            }else{
                print(Data ?? "No Date")
                if (Data != nil){
                    findUser = true;
                }
            }
        }
        return findUser
    }
    
    func InsertUser(user: User) -> Bool {
        var findUser:Bool=false;
        let url:URL=URL.init(string: self.url)!;
        let parmeter="country=\(String(describing: user.country)), dateBarth=\(String(describing: user.dateBarth)),email=\(String(describing: user.email)),FirstName=\(String(describing: user.FirstName)),gender=\(String(describing: user.gender)),lastName=\(String(describing: user.lastName)),numberMobile=\(String(describing: user.numberMobile)),password=\(String(describing: user.password)),username=\(String(describing: user.username)), "
        let sessin=URLSession.init(configuration: .default)
        var requst:URLRequest=URLRequest.init(url: url)
        requst.httpMethod="POST"
        requst.httpBody=parmeter.data(using: .utf8)
        sessin.dataTask(with: requst) { (Data, reponse, Error) in
            if(Error != nil){
                print(Error ?? "No Error")
            }else{
                
                if (Data != nil ){
                    print(Data ?? "No Date")
                    findUser = true;
                }
            }
        }
        return findUser
    }
    
    func showMassege(TextView TextMassef:String) -> Void {
        let uiAlrt=UIAlertController.init(title: "Massege", message: TextMassef, preferredStyle: .alert)
        let actionOK=UIAlertAction.init(title: "ok", style: .default, handler: nil)
        let actionCancel=UIAlertAction.init(title: "cancel", style: .cancel, handler: nil)
        uiAlrt.addAction(actionOK)
        uiAlrt.addAction(actionCancel)
    }
}
