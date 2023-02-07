//
//  CheckBoxButton.swift
//  WelcomeScreenUI
//
//  Created by sixpep on 06/02/23.
//

import UIKit

class CheckBoxButton: UIView {

    var isChecked = false

    let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "checkmark")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    }
    
    public func toggle(){
        self.isChecked = !isChecked
        imageView.isHidden = !isChecked
    }
}
