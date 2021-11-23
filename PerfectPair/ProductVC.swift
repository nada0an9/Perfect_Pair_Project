//
//  ProductVC.swift
//  PerfectPair
//
//  Created by Haya on 17/04/1443 AH.
//

import UIKit

class ProductVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCell
        cell.lblStatus.text = ""
        return cell
    }
    

    @IBOutlet weak var productCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        productCollectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "productCell")

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
