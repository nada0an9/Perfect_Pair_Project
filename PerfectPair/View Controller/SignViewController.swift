//
//  SignViewController.swift
//  PerfectPair
//
//  Created by Nada Alansari on 20/04/1443 AH.
//

import UIKit

class SignViewController: UIViewController {
    // Handle for the whole DataModel to interact with
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var Address: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var userName: UITextField!
    
    @IBAction func signIn(_ sender: Any) {
        let newCustomer = Customer (context : context)
        newCustomer.customer_name = userName.text
        newCustomer.customer_email = email.text
        newCustomer.customer_password = password.text
        newCustomer.customer_address = Address.text
            // save Context
            do {
                try! context.save()
                print("saved !")
            }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
