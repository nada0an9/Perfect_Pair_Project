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
    var crrunrCustomer : Customer?
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath as IndexPath) as! CartCollectionViewCell
        cell.layer.cornerRadius = 12;
        cell.cartNameLable.text = result[indexPath.row].proudect_name
        cell.qtyTextField.text = result[indexPath.row].proudect_qty
        
        if(result[indexPath.row].proudect_size == "37"){
            cell.sizeSegment.selectedSegmentIndex = 0
        }
        else if(result[indexPath.row].proudect_size == "38"){
            cell.sizeSegment.selectedSegmentIndex = 1

        }
        else if(result[indexPath.row].proudect_size == "39"){
            cell.sizeSegment.selectedSegmentIndex = 2

        }
        else{
            cell.sizeSegment.selectedSegmentIndex = 3

        }
        cell.yourobj =
                    {
                        //when the button is tapped here
                        self.result[indexPath.row].proudect_qty =    cell.qtyTextField.text
                        if(cell.sizeSegment.selectedSegmentIndex == 0){
                            self.result[indexPath.row].proudect_size = "37"
                        }
                        else if(cell.sizeSegment.selectedSegmentIndex == 1){
                            self.result[indexPath.row].proudect_size = "38"

                        }
                        else if(cell.sizeSegment.selectedSegmentIndex == 2){
                            self.result[indexPath.row].proudect_size = "39"

                        }
                        else{
                            self.result[indexPath.row].proudect_size = "40"
                        
                        }
                        do{
                            try self.context.save()
                          self.fetchDataFromDB()

                        }
                        catch{
                            print("unable to update")
                        }
                }


        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cartToRemoved = result[indexPath.row]

        self.context.delete(cartToRemoved)
        do{
            try context.save()
        }
        catch{
            print("unable to delete")
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
         var filter = NSPredicate(format: "toCustomer == %@", crrunrCustomer!)
        
             request.predicate = filter
        // assign the result of fetchRequest to array
        do {
            
            try! result = context.fetch(request)
            cartCollectionView.reloadData()
        }
    }
    
    
    @IBAction func confirmOrder(_ sender: Any) {
        
//
//        var copiedArray = [Cart]()
//        for item in copiedArray{
//
//
//        }
//
//        //update
//        for item in result {
//
//            let itemToUpdate = item
////             item.proudect_qty =
////             item.proudect_size =
//
//
//        }
        
    }
    @IBOutlet weak var cartCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        cartCollectionView.dataSource = self
        cartCollectionView.delegate = self
        fetchDataFromDB()
        
        
    }
    
}
