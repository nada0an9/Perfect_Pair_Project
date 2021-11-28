//
//  ViewController.swift
//  PerfectPair
//
//  Created by Nada Alansari on 16/04/1443 AH.
//

import UIKit
import CoreData

class ViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate{
    
    var loggedInUder : Customer?

 
    @IBAction func goToCart(_ sender: Any) {
        performSegue(withIdentifier: "show_cart", sender: nil)

    }
    
      
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show_cart"
        {
        let cartVC = segue.destination as! CartViewController
        cartVC.crrunrCustomer = loggedInUder
        }
    }
    
    //MARK: collectionView Stuff
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        result.count
    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath as IndexPath) as! proudectCollectionViewCell
        
        cell.layer.cornerRadius = 12;
        cell.shoseImage.image = UIImage(named:result[indexPath.row].proudect_photo!)
        cell.proudect_name_Lable.text = result[indexPath.row].proudect_name
        cell.priceLable.text =  result[indexPath.row].proudect_price
        
        cell.yourobj =
                    {
                        //when the button is tapped here
                        let today = Date()
                        let formatter3 = DateFormatter()
                        formatter3.dateFormat = "HH:mm E, d MMM y"
                        
                        let newCart = Cart(context: self.context)
                        newCart.cart_date = formatter3.string(from: today)
                        newCart.proudect_size = "37"
                        newCart.proudect_qty = "1"
                        newCart.proudect_name = self.result[indexPath.row].proudect_name
                        newCart.proudect_price = self.result[indexPath.row].proudect_price
                        newCart.toCustomer = self.loggedInUder
                 
                        do{
                            try self.context.save()
                            print("Added sucsessfully")
                          self.fetchDataFromDB()
                            
                        }
                        catch{
                            print("unable to add")
                        }
                }
        return cell
    }

    

    
    //MARK: DataBase Stuff
    
    // Handle for the whole DataModel to interact with
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    var result =  [Proudect]()
    
    
        func addProudect(){
        
            
        let newProudect = Proudect(context: context)
        newProudect.proudect_name = "Nike Aire Max"
        newProudect.proudect_photo = "nike1.png"
            newProudect.proudect_price = "450"

        let newProudect2 = Proudect(context: context)
        newProudect2.proudect_name = "Puma Aire Max"
        newProudect2.proudect_photo = "puma.png"
        newProudect2.proudect_price = "300"
        
        let newProudect3 = Proudect(context: context)
        newProudect3.proudect_name = "Adidas Shose"
        newProudect3.proudect_photo = "adidas.png"
        newProudect3.proudect_price = "300"
        
        // Save Context
        do { try! context.save() }
        
        // Fetch data from DB again
        fetchDataFromDB()
        
    }
    func addProudect2(){
    
        
    let newProudect = Proudect(context: context)
    newProudect.proudect_name = "Nike Revolution 5"
    newProudect.proudect_photo = "PngItem_2441834.png"
        newProudect.proudect_price = "600"

    let newProudect2 = Proudect(context: context)
    newProudect2.proudect_name = "Adidas NMD R1"
    newProudect2.proudect_photo = "PngItem_289208.png"
    newProudect2.proudect_price = "290"
    
    let newProudect3 = Proudect(context: context)
    newProudect3.proudect_name = "Nike Wearallday"
    newProudect3.proudect_photo = "PngItem_6279040.png"
    newProudect3.proudect_price = "440"
    
    // Save Context
    do { try! context.save() }
    
    // Fetch data from DB again
    fetchDataFromDB()
    
}
    func deleteAll(){
        
        for item in result{
            self.context.delete(item)
            do{
             try context.save()
            }
            catch{
                print("unable to delete")
            }
            
        }
    }
    
    func fetchDataFromDB() {
        
        // get the context
        // configure the request - NSFetchRequest
        let request = Proudect.fetchRequest() as! NSFetchRequest<Proudect>
        
        
        // fetchRequest
        // assign the result of fetchRequest to array
        do {
            
            try! result = context.fetch(request)
            proudectCollectionView.reloadData()
        }
    }
    
    
    
    @IBOutlet weak var proudectCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        proudectCollectionView.dataSource = self
        proudectCollectionView.delegate = self
        print(loggedInUder)
        fetchDataFromDB()
     if(result.count == 0){
            addProudect()
         fetchDataFromDB()

        }
        if(result.count == 3){
            addProudect2()
         fetchDataFromDB()

        }
        


        print("result  \(result.count)")
        


        
    }
    
    
}

