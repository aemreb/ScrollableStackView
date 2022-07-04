//
//  ScrollableStackView.swift
//  HTest
//
//  Created by Emre Boyacı on 3.07.2022.
//

import Foundation
import UIKit

open class ScrollableStackView: UIView {
    
    @IBOutlet weak var stackView: UIStackView!
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    private func nibSetup() {
        backgroundColor = .clear
        
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        view.layer.masksToBounds = true
        
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        return Bundle.module.loadNibNamed("ScrollableStackView", owner: self, options: nil)![0] as! UIView
//        let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
//        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
//        
//        return nibView
    }
    
    public func addCardView(image: UIImage, title: String, memberCount: Int, privacy: Utilities.PrivacyState, detail: String) {
        let cardView: CardView = CardView(frame: CGRect(x: 0.0, y: 0.0, width: 400.0, height: 250.0))
        cardView.titleText = title
        cardView.privacyState = privacy
        cardView.image = image
        cardView.members = memberCount
        cardView.detailText = detail
        cardView.heightAnchor.constraint(equalToConstant: cardView.frame.size.height).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: cardView.frame.size.width).isActive = true

        stackView.addArrangedSubview(cardView)
    }
    
    public func addCompactCardView(image: UIImage, title: String, memberCount: Int, privacy: Utilities.PrivacyState) {
        let cardView: CompactCardView = CompactCardView(frame: CGRect(x: 0.0, y: 0.0, width: 400.0, height: 150.0))
        cardView.titleText = title
        cardView.privacyState = privacy
        cardView.image = image
        cardView.members = memberCount
        cardView.heightAnchor.constraint(equalToConstant: cardView.frame.size.height).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: cardView.frame.size.width).isActive = true

        stackView.addArrangedSubview(cardView)
    }
}
