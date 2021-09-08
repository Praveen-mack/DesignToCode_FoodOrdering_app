//
//  CardCollectionViewCell.swift
//  Food_Ordering
//
//  Created by praveen mack on 30/08/21.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var data: CellData? {
        didSet {
            manageData()
        }
    }
    
    let cardView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 20
        v.setCardShadow()
        return v
    }()
    
    let overlayView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        v.layer.cornerRadius = 20
        return v
    }()
    
    let cardImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.image = #imageLiteral(resourceName: "img1")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let brandName: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "McDonald's"
        l.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        l.textColor = .black
        return l
    }()
    
    let subTitle: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let timeLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.text = "10 - 15 min"
        l.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return l
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(cardView)
        cardView.addSubview(overlayView)
        overlayView.addSubview(cardImage)
        cardView.addSubview(brandName)
        cardView.addSubview(subTitle)
        cardView.addSubview(timeLabel)
        
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper function
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            overlayView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            overlayView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            overlayView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            overlayView.heightAnchor.constraint(equalToConstant: 300),
            
            cardImage.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor),
            cardImage.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor),
            cardImage.heightAnchor.constraint(equalToConstant: 200),
            cardImage.widthAnchor.constraint(equalToConstant: 200),
            
            brandName.topAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: 20),
            brandName.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            
            subTitle.topAnchor.constraint(equalTo: brandName.bottomAnchor, constant: 10),
            subTitle.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 20),
            timeLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
        ])
    }
    
    func manageData() {
        guard let data = data else { return }
        overlayView.backgroundColor = data.overlayBackground
        cardImage.image = UIImage(named: data.image)
        brandName.text = data.brandName
        setUpAttributeText(data.rating, data.category, data.price)
    }
    
    func setUpAttributeText( _ rating:String , _ category:String , _ price:String ){
        let starImg = UIImage(named:"star")?.withRenderingMode(.alwaysOriginal)
        let font = UIFont.systemFont(ofSize: 15)
        let starImage = NSTextAttachment()
        starImage.image = starImg
        starImage.bounds = CGRect(x: 0, y: (font.capHeight - 15).rounded() / 2, width: 15, height: 15)
        starImage.setImageHeight(height: 15)
        let spaceString = NSAttributedString(attachment: starImage)
        let attributedText = NSMutableAttributedString(string:" ")
        attributedText.append(spaceString)
        attributedText.append(NSAttributedString(string: " \(rating)   \(category)   \(price)" , attributes:[NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15) , NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        subTitle.attributedText = attributedText
    }
}
