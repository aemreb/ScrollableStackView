//
//  CompactCardView.swift
//  HTest
//
//  Created by Emre Boyacı on 29.06.2022.
//

import Foundation
import UIKit

class CompactCardView: UIView {
    
    @IBOutlet weak var imageView: RoundImage!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var memberCount: UILabel!
    @IBOutlet weak var privacy: UILabel!

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
        view.frame = CGRect(x: 0.0, y: 0.0, width: 400.0, height: 150.0)
        view.translatesAutoresizingMaskIntoConstraints = true
        view.layer.masksToBounds = true
        
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return nibView
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 10.0 {
        didSet { layer.cornerRadius = cornerRadius }
    }
    
    @IBInspectable
    var titleText: String = "Title Text" {
        didSet { title.text = titleText }
    }
    
    @IBInspectable
    var members: Int = 5 {
        didSet { memberCount.text = "\(members) Members" }
    }
    
    @IBInspectable
    var privacyState: Utilities.PrivacyState = .pub {
        didSet { privacy.text = privacyState.rawValue }
    }
    
    @IBInspectable
    var image: UIImage = UIImage(systemName: "square")! {
        didSet { imageView.image = image }
    }
    
}
