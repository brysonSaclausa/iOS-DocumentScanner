//
//  MyCollectionViewCell.swift
//  iOSDocumentScannerSB
//
//  Created by BrysonSaclausa on 6/16/21.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func updateView() {
        self.imageView?.image = self.scanImage
    }

    var scanImage: UIImage? {
        didSet {
            updateView()
        }
        
    }
    
    
}
