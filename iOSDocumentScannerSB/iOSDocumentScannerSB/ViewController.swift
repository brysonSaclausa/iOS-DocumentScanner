//
//  ViewController.swift
//  iOSDocumentScannerSB
//
//  Created by BrysonSaclausa on 6/14/21.
//

import UIKit
import VisionKit

class ViewController: UIViewController, VNDocumentCameraViewControllerDelegate {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.backgroundColor = .systemRed
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        self.myCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
    }
    
    @IBAction func openDocumentScannerPressed(_ sender: UIBarButtonItem) {
        configureDocumentView()
        
    }
    
    private func configureDocumentView() {
        
        let scanningDocumentVC = VNDocumentCameraViewController()
        scanningDocumentVC.delegate = self
        self.present(scanningDocumentVC, animated: true, completion: nil)
    }
    


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        cell.backgroundColor = .systemGreen
        return cell
    }
    
    
   
    
   
}

