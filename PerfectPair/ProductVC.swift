//
//  ProductVC.swift
//  PerfectPair
//
//  Created by Haya on 17/04/1443 AH.
//

import UIKit
import CoreData
class ProductVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var productCollectionView: UICollectionView!

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCell
        cell.lblStatus.text = ""
        return cell
    }
    
      var Listproduct = [Proudect]()
    
    let contrxt = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    override func viewDidLoad() {
        super.viewDidLoad()
        productCollectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "productCell")
      //  Proudect.dataSource = self
        
        LoadProudect()
        
    }
        func LoadProudect(){
            let fecthRequest:NSFetchRequest<Proudect> = Proudect.fetchRequest()
            do {
                self.Listproduct = try! contrxt.fetch(fecthRequest)
            } catch{
                print("unable to fetch")
            }
        }
        
  
}


