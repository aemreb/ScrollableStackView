//
//  CardView.swift
//  HTest
//
//  Created by Emre Boyacı on 28.06.2022.
//

import Foundation
import UIKit

class CardView: UIView {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var memberCount: UILabel!
    @IBOutlet weak var privacy: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var imageView: RoundImage!

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    private func nibSetup() {
        
        let view = loadViewFromNib()
        view.frame = CGRect(x: 0.0, y: 0.0, width: 400.0, height: 250.0)
        view.translatesAutoresizingMaskIntoConstraints = true
        view.layer.masksToBounds = true
        
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        return Bundle.module.loadNibNamed("CardView", owner: self, options: nil)![0] as! UIView
//        let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
//        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
//
//        return nibView
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 10.0 {
        didSet { layer.cornerRadius = cornerRadius }
    }
    
    var titleText: String = "Title Text" {
        didSet { title.text = titleText }
    }
    
    var members: Int = 5 {
        didSet { memberCount.text = "\(members) Members" }
    }
    
    var privacyState: Utilities.PrivacyState = .pub {
        didSet { privacy.text = privacyState.rawValue }
    }
    
    var detailText: String = "Detail Text" {
        didSet { detail.text = detailText }
    }
    
    var image: UIImage = UIImage(systemName: "square")! {
        didSet { imageView.image = image }
    }
}
