//
//  PageCell.swift
//  drone
//
//  Created by Velkei Miklós on 2018. 04. 17..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let imageView: UIImageView = {
      let iv = UIImageView()
        iv.backgroundColor = .white
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "mavicair")
        return iv
    }()
    
    
    func setupViews(){
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
