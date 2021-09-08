//
//  CardViewController.swift
//  Food_Ordering
//
//  Created by praveen mack on 30/08/21.
//

import UIKit

class CardViewController: UIViewController {
    
    // MARK: - Properties
    
    var data = [CellData]()
    let colors = [UIColor.color1, UIColor.color2, UIColor.color3, UIColor.color4]
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        cv.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return cv
    }()
    
    let orderHereButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Oder from here", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.layer.cornerRadius = 30
        return button
    }()
    
    let logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "logo1")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = colors[0]
        logoImage.image = UIImage(named: "logo1")
        
        view.addSubview(collectionView)
        view.addSubview(orderHereButton)
        view.addSubview(logoImage)
        
        setupContraints()
        
        data = [
            CellData(image: "img1", overlayBackground: UIColor.color1, brandName: "McDonald's", rating: "4.8", category: "Burgers, American", price: "$10", brandLogoImage: "logo1"),
            CellData(image: "img2", overlayBackground: UIColor.color2, brandName: "KFC", rating: "4.8", category: "Chicken, American", price: "$21", brandLogoImage: "logo2"),
            CellData(image: "img3", overlayBackground: UIColor.color3, brandName: "Subway", rating: "4.9", category: "Drinks, American", price: "$11", brandLogoImage: "logo3"),
            CellData(image: "img4", overlayBackground: UIColor.color4, brandName: "Dominos", rating: "4.5", category: "Pizza, American", price: "$15", brandLogoImage: "logo4"),
        ]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Helper function
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 640),
            
            orderHereButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            orderHereButton.widthAnchor.constraint(equalToConstant: 250),
            orderHereButton.heightAnchor.constraint(equalToConstant: 60),
            orderHereButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoImage.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -30),
            logoImage.heightAnchor.constraint(equalToConstant: 150),
            logoImage.widthAnchor.constraint(equalToConstant: 150),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}

extension CardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCollectionViewCell
        cell.data = data[indexPath.row]
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x / collectionView.frame.width
        self.view.backgroundColor = self.colors[Int(x)]
        self.logoImage.image = UIImage(named: self.data[Int(x)].brandLogoImage)
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 640)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
