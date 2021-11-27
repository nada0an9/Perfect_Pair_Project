//
//  loginViewController.swift
//  PerfectPair
//
//  Created by Nada Alansari on 20/04/1443 AH.
//

import UIKit
import CoreData

class loginViewController: UIViewController {
    
    var loggedInUder : Customer? 

    //handel for the hole DateModel to intercat with
      let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    var result = [Customer]()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show_P"
        {
            let manualViewController = segue.destination as! ViewController
            manualViewController.loggedInUder = loggedInUder
    }
        
    
        
    }
    @IBAction func loginBtn(_ sender: Any) {
        //make a request to the context - fetching
            let request =  Customer.fetchRequest() as NSFetchRequest<Customer>
        
        //filter
          var filter = NSPredicate(format: "customer_name == %@ AND customer_password ==%@ ", userName.text!,passord.text! )

            request.predicate = filter
        
           do {
           try! result = context.fetch(request) // append it to result array
         }
        if(result.count == 0 || userName.text == nil || passord.text == nil)
        {
            print("the user not Found")
            navigationController?.popViewController(animated: true)
        }
        else{
            print("welcome")
            //i need to send this user to the cart
            loggedInUder = result.first!
            
            print("\(loggedInUder?.customer_name)")
            print(result.count)
            //go to proudect page
            performSegue(withIdentifier: "show_P", sender: nil)
            
        }
        
    }
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passord: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
