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
    
    var result =  [Cart]()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath as IndexPath) as! CartCollectionViewCell
        cell.layer.cornerRadius = 12;
        cell.cartNameLable.text = result[indexPath.row].proudect_name
        cell.qtyTextField.text = result[indexPath.row].proudect_qty
        

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cartToRemoved = result[indexPath.row]

        for item in result{
        self.context.delete(item)
        do{
            try context.save()
        }
        catch{
            print("unable to delete")
        }
        }
        fetchDataFromDB()
//
//                var s = result[indexPath.row].toProudect
//                print("item for one order")
//
//                for item in s!{
//                    print(item)}

                
    }
    
    
    func fetchDataFromDB() {
        
        // get the context
        // configure the request - NSFetchRequest
        let request = Cart.fetchRequest() as! NSFetchRequest<Cart>
        
        // fetchRequest
        // assign the result of fetchRequest to array
        do {
            
            try! result = context.fetch(request)
            cartCollectionView.reloadData()
        }
    }
    
    
    @IBOutlet weak var cartCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        cartCollectionView.dataSource = self
        cartCollectionView.delegate = self
        fetchDataFromDB()
        
        
    }
    
}
