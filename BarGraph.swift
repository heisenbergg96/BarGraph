//
//  BarGraph.swift
//  dummy
//
//  Created by Vikhyath on 22/02/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit

@IBDesignable
class BarGraph: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var data: [CGFloat] = [100, 20, 50, 100, 200, 300, 74, 237, 20, 50, 100, 200, 300, 74, 237, 50, 100, 200, 300, 74, 237, 20, 100, 20, 50, 100, 200, 300, 74, 237, 20]
    
    
    func maxValue() -> CGFloat {
        
        guard let max = data.max() else {
            return 1
        }
        return max
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GraphCell", for: indexPath) as? GraphCell else {
            return UICollectionViewCell()
        }
        cell.barValue.text = "\(Int(data[indexPath.row]))"
        let ratio = (frame.height - 20) / maxValue()
        cell.viewHeightAnchor.constant = data[indexPath.row] * ratio
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 20, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}
