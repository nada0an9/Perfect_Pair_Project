//
//  signViewController.swift
//  PerfectPair
//
//  Created by MAC on 17/04/1443 AH.
//

import UIKit
import CoreData

class signViewController: UIViewController {

    //handel for the hole DateModel to intercat with
      let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var result = [Customer]()
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var txtpa: UITextField!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func btnSIGN(_ sender: Any) {

        //make a request to the context - fetching
            let request =  Customer.fetchRequest() as NSFetchRequest<Customer>
        
        //filter we cam also use btewwn and others
       var filter = NSPredicate(format: "customer_name CONTAINS '\(txtUsername.text)' AND customer_password CONTAINS '\(txtpa.text)' ")
            request.predicate = filter
           do {
           try! result = context.fetch(request) // append it to result array
         }
        if(result.count == 0){
            print("the user not Found")
        }
        else{
            print("print welcome")
            //go to proudect page
            
        }
       

        
    }
    
}
