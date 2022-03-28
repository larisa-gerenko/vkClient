//
//  ViewController.swift
//  interface_ios
//
//  Created by Larisa on 31.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ScrollView: UIScrollView!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    let fromLoginToTabBarGeque = "fromLoginToTabBarGeque"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.view.addGestureRecognizer(tapRecognizer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func keyboardDidHide(_ notification: Notification) {
        ScrollView.contentInset = UIEdgeInsets.zero
        ScrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    @objc func keyboardDidShow(_ notification: Notification) {
        let keyboardSize =  notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        
        guard let keyboardHeight = keyboardSize?.height else {return}
        
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        ScrollView.contentInset = contentInset
        ScrollView.scrollIndicatorInsets = contentInset
        print("keyboardShow \(keyboardHeight)")
    }

    @objc func onTap() {
       self.view.endEditing(true)
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let login = self.loginTextField.text, login == "",
              let password = self.passwordTextField.text, password == ""
        else {
            print("error")
            return
        }
        
        performSegue(withIdentifier: fromLoginToTabBarGeque, sender: nil)
    
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

