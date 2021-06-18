//
//  ViewController.swift
//  iOSDocumentScannerSB
//
//  Created by BrysonSaclausa on 6/14/21.
//

import UIKit
import VisionKit

class ViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var scanImages:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        myCollectionView.backgroundColor = .systemGray
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
    
    @IBAction func openDocumentScannerPressed(_ sender: UIBarButtonItem) {
        configureDocumentView()
        
    }
    
    private func configureDocumentView() {
        
        let scanningDocumentVC = VNDocumentCameraViewController()
        scanningDocumentVC.delegate = self
        self.present(scanningDocumentVC, animated: true, completion: nil)
    }
    
}//

extension ViewController:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        scanImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        
//        cell.backgroundColor = .systemGreen
        cell.scanImage = scanImages[indexPath.item]
        return cell
    }
    
}

extension ViewController: VNDocumentCameraViewControllerDelegate {
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        
        for pageNumber in 0..<scan.pageCount {
            let image = scan.imageOfPage(at: pageNumber)
            
            print(image)
            self.scanImages.append(image)
            
        }
        controller.dismiss(animated: true) {
            DispatchQueue.main.async {
                self.myCollectionView.reloadData()
            }
            
        }
    }
}
