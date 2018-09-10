//
//  PageCell.swift
//  drone
//
//  Created by Velkei Miklós on 2018. 04. 17..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell{
    
    //teszt
    //teszt
    var page: Page?{
        didSet{
            guard let page = page else {
                return
            }
            var imageName = page.imageName
            if UIDevice.current.orientation.isLandscape{
                imageName += "_landscape"
            }
            
            imageView.image = UIImage(named: imageName)
            let color = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor: color])
            //\n\n new line és hozzá adunk egy újat
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: color]))
            
            //Középre igazítás
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            let length = attributedText.string.count
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            //  textView.text = page.title + "\n\n" + page.message
            textView.attributedText = attributedText
        }
    }

    
    //Kép
    let imageView: UIImageView = {
      let iv = UIImageView()
        iv.backgroundColor = .white
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "mavicair")
        return iv
    }()
    
    //TextView
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "Minta szöveg egyenlőre"
        tv.isEditable = false
        //lefele legyen tolva
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return tv
    }()

    //Elválasztó vonal
    let lineSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    func setupViews(){
        addSubview(imageView)
        addSubview(textView)
        addSubview(lineSeparatorView)
        
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        textView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true

        lineSeparatorView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
