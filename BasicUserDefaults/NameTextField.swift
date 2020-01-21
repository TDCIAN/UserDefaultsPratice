//
//  NameTextField.swift
//  BasicUserDefaults
//
//  Created by Sean Allen on 12/12/18.
//  Copyright © 2018 Sean Allen. All rights reserved.
//

import UIKit

class NameTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTextField()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init( coder: aDecoder )
        setUpTextField()
    }
    
    
    private func setUpTextField() {
        tintColor       = Colors.darkGrey
        textColor       = Colors.darkGrey
        backgroundColor = .white
    }
    
    // 여기에서 다크모드에 대한 설정이 이루어짐
    func updateStyle(isDarkMode: Bool) {
        let mainColor       = isDarkMode ? .white : Colors.darkGrey
        keyboardAppearance  = isDarkMode ? .dark : .light
        
        UIView.animate(withDuration: 0.4) {
            self.tintColor          = mainColor
            self.textColor          = mainColor
            self.backgroundColor    = isDarkMode ? Colors.darkGrey : .white
        }
    }
}
