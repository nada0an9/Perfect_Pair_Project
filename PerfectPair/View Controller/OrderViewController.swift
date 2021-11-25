//
//  OrderViewController.swift
//  PerfectPair
//
//  Created by Nada Alansari on 18/04/1443 AH.
//

import UIKit

class OrderViewController: UIViewController {
    // Handle for the whole DataModel to interact with
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var result =  [Order]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        result.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath as IndexPath) as! CartCollectionViewCell
        
        
        cell.cartNameLable.text = result[indexPath.row].order_date
        
        //        for item in result[indexPath.row].toProudect!
        //        {
        //            let a = item as! Proudect
        //            var cName = a.proudect_name
        //
        //            print("order proudect\(cName)")
        //
        //
        //        }
        
        return cell

    }
    

    @IBOutlet weak var orderCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  

}
