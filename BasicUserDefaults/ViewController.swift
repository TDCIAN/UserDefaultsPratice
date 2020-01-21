//
//  ViewController.swift
//  BasicUserDefaults
//
//  Created by Sean Allen on 12/12/18.
//  Copyright © 2018 Sean Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var styleSegmentedControl: UISegmentedControl!
    @IBOutlet private var petImageView: UIImageView!
    @IBOutlet private var nameTextField: NameTextField! // 얘는 기존에 없는 새로 만든(NameTextField.swift) 텍스트필드
    
    var isDarkMode = false
    
    // 유저디폴트 등장
//    let defaults = UserDefaults.standard
    
    struct Keys {
        static let prefersDarkMode  = "prefersDarkMode"
        static let petName          = "petname"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPetImageView()
        checkForStylePreference()
        checkForSavedName()
    }
    
    
    func setupPetImageView() {
        petImageView.layer.cornerRadius = petImageView.frame.size.height / 2
        petImageView.clipsToBounds      = true
    }
    
    
    func updateStyle() {
        UIView.animate(withDuration: 0.4) {
            self.view.backgroundColor = self.isDarkMode ? Colors.darkGrey : .white // 배경색 변경
            self.nameTextField.updateStyle(isDarkMode: self.isDarkMode) // 텍스트필드 색 변겨
        }
    }
    
    
    @IBAction func didChangeStyleSegmentedControl(_ sender: UISegmentedControl) {
        isDarkMode = sender.selectedSegmentIndex == 1
        saveStylePreference() // 아래에서 만든 유저디폴트 메소드 사용
        updateStyle()
    }
    
    
    @IBAction func saveButtonTapped(_ sender: SAButton) {
        saveName()
    }
    
    
    func saveStylePreference() {
        // 유저디폴트 사용
        UserDefaults.standard.set(isDarkMode, forKey: Keys.prefersDarkMode)
    }
    
    
    func checkForStylePreference() {
        let prefersDarkMode = UserDefaults.standard.bool(forKey: Keys.prefersDarkMode)
        
        if prefersDarkMode {
            isDarkMode = true
            updateStyle()
            styleSegmentedControl.selectedSegmentIndex = 1
        }
    }
    
    // 이름을 저장하기 위해 유저디폴트 사용
    func saveName() {
        UserDefaults.standard.set(nameTextField.text!, forKey: Keys.petName)
    }
    
    
    func checkForSavedName() {
        let name = UserDefaults.standard.value(forKey: Keys.petName) as? String ?? ""
        nameTextField.text = name
    }
}

