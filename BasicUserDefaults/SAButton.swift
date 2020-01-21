//
//  SAButton.swift
//  BasicUserDefaults
//
//  Created by Sean Allen on 12/12/18.
//  Copyright © 2018 Sean Allen. All rights reserved.
//

import UIKit

class SAButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    private func setupButton() {
        setTitleColor(.white, for: .normal)
        backgroundColor     = Colors.lightBlue
        titleLabel?.font    = .boldSystemFont(ofSize: 20)
        layer.cornerRadius  = frame.size.height / 2
    }
}
