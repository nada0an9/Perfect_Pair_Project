//
//  CartViewController.swift
//  PerfectPair
//
//  Created by Nada Alansari on 16/04/1443 AH.
//

import UIKit
import CoreData

class CartViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate {
    
    // Handle for the whole DataModel to interact with
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var result =  [Order]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath as IndexPath) as! CartCollectionViewCell

        for item in result{
     
            let obj = item as! Order
            var cName :String?
            cell.cartNameLable.text = obj.order_date

            for item in obj.toProudect!
                 {
                   let a = item as! Proudect
                    cName = a.proudect_name
                    print(cName)
                 }

        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        var s = result[indexPath.row].toProudect
        
        print("item for one order")

        for item in s!{
            print(item)

        }
    }
    
    
    func fetchDataFromDB() {
        
     
       
        
        // get the context
        // configure the request - NSFetchRequest
        let request = Order.fetchRequest() as! NSFetchRequest<Order>
        

        // fetchRequest
        // assign the result of fetchRequest to array
        do {
            
            try! result = context.fetch(request)
            cartCollectionView.reloadData()
        }
    }
    
    
    var proudectArrInCart = [Proudect]()
    
    @IBOutlet weak var cartCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("here cart")
        print(proudectArrInCart)
        cartCollectionView.dataSource = self
        cartCollectionView.delegate = self
        fetchDataFromDB()
      
        
    }

}
