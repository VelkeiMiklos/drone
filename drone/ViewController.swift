//
//  ViewController.swift
//  drone
//
//  Created by Velkei Miklós on 2018. 04. 17..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    //CollectionView
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0 // cellák között a space
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()

    //Login oldalak beállítása
    let pages: [Page] = {
        let firstPage = Page(title: "Mavic Air", message: "A legújabb drón. Kicsi a bors de erős", imageName: "mavicair")
        
        let secondPage = Page(title: "Mavic Pro", message: "Az első hórdozható drón", imageName: "mavicpro")
        
        let thirdPage = Page(title: "Phantom 4", message: "Legjobb drón professzionális felhasználásra 4k videó", imageName: "phantom4")
        
        return [firstPage, secondPage, thirdPage]
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.frame = view.frame
        collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: Cell.LOGIN_CELL_ID)
    }

}
extension ViewController{
    
    //4db
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.LOGIN_CELL_ID, for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    //Cella méret
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
