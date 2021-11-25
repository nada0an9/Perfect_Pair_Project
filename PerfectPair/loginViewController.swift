//
//  loginViewController.swift
//  PerfectPair
//
//  Created by MAC on 17/04/1443 AH.
//

import UIKit

class loginViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

//    button.layer.cornerRadius =
//    button.layer.borderWidth = 1
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtAdrs: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    
    @IBAction func btSign(_ sender: UIButton) {
        let newCustomer = Customer (context : context)
        newCustomer.customer_name = txtUsername.text
        newCustomer.customer_email = txtEmail.text
        newCustomer.customer_password = txtPass.text
        newCustomer.customer_address = txtAdrs.text
        
            // save Context
            do {
                try! context.save()
                
            }

}
}

