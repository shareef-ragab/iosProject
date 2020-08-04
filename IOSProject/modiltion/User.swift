//
//  User.swift
//  IOSProject
//
//  Created by pc5 on 5/4/19.
//  Copyright © 2019 pc5. All rights reserved.
//

import UIKit

class User: NSObject,NSCoding {
    
    
    
    var username:String!
    var password:String!
    var FirstName:String!
    var lastName:String!
    var email:String!
    var numberMobile:String!
    var country:String!
    var dateBarth:String!
    var gender:String!
    
    init(username:String,password:String,Email:String,FirstName:String,LastName:String,numberMobile:String,Country:String,DateBarth:String,Gender:String) {
        self.username=username;
        self.password=password;
        self.country=Country;
        self.dateBarth=DateBarth
        self.email=Email
        self.FirstName=FirstName
        self.gender=Gender
        self.lastName=LastName
        self.numberMobile=numberMobile
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(username, forKey: "username")
        aCoder.encode(FirstName, forKey: "firstName")
        aCoder.encode(lastName, forKey: "lastName")
        aCoder.encode(dateBarth, forKey: "dateOfBirth")
        aCoder.encode(country, forKey: "country")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(gender, forKey: "gender")
        aCoder.encode(numberMobile, forKey: "numberMobile")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        username = aDecoder.decodeObject(forKey: "username") as? String
        FirstName = aDecoder.decodeObject(forKey: "firstName") as? String
        lastName = aDecoder.decodeObject(forKey: "lastName") as? String
        dateBarth = aDecoder.decodeObject(forKey: "dateOfBirth") as? String
        country = aDecoder.decodeObject(forKey: "country") as? String
        email = aDecoder.decodeObject(forKey: "email") as? String
        gender = aDecoder.decodeObject(forKey: "dgender") as? String
        numberMobile = aDecoder.decodeObject(forKey: "numberMobile") as? String
        
        
    }
    override init() {
    }
}
