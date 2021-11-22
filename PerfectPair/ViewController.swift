//
//  ViewController.swift
//  PerfectPair
//
//  Created by Nada Alansari on 16/04/1443 AH.
//

import UIKit
import CoreData

class ViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBAction func insertOrder(_ sender: Any) {
        let newOrder = Order(context: context)
        newOrder.order_date = "29 nov"
        newOrder.order_status = "card"
        newOrder.order_quantity = "9"
        newOrder.order_size = "10"
       //add all proudect of the order
                for (index, item) in proudectArr.enumerated(){
                    newOrder.addToToProudect(proudectArr[index])
                        }
        print("this is a new order")
        print(proudectArr)
        // Save Context
        do {
            try! context.save()
        }
    }

    var proudectArr = [Proudect]()
    
    //MARK: collectionView Stuff


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        result.count
    }
    
    @IBAction func goToCart(_ sender: Any) {
        performSegue(withIdentifier: "show_cart", sender: nil)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath as IndexPath) as! proudectCollectionViewCell
        cell.proudect_name_Lable.text = result[indexPath.row].proudect_name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        proudectArr.append(result[indexPath.row])
        print(proudectArr)

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cartVC = segue.destination as! CartViewController
        cartVC.proudectArrInCart = proudectArr
        
    }
    
    //MARK: DataBase Stuff

    // Handle for the whole DataModel to interact with
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    var result =  [Proudect]()


    func addProudect(){
        let newProudect = Proudect(context: context)
        newProudect.proudect_name = "Nike Aire Max"
        newProudect.proudect_photo = "photo"
        newProudect.proudect_size = "40"
        newProudect.proudect_price = "300"

        let newProudect2 = Proudect(context: context)
        newProudect2.proudect_name = "Puma Aire Max"
        newProudect2.proudect_photo = "photo"
        newProudect2.proudect_size = "40"
        newProudect2.proudect_price = "300"

        let newProudect3 = Proudect(context: context)
        newProudect3.proudect_name = "Adidas Aire Max"
        newProudect3.proudect_photo = "photo"
        newProudect3.proudect_size = "40"
        newProudect3.proudect_price = "300"

        // Save Context
        do { try! context.save() }
        
        // Fetch data from DB again
        fetchDataFromDB()
        
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
        fetchDataFromDB()
        if(result.count == 0){
            addProudect()
            
        }
    }


}

