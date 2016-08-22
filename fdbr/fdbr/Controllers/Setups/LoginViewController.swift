//
//  LoginViewController.swift
//  fdbr
//
//  Created by Setiady Wiguna on 8/12/16.
//  Copyright © 2016 Jiggie. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var signInButtonBottomConstraint: NSLayoutConstraint!
    
    private lazy var keyboardNotification: KeyboardNotificationHelper = {
        let notification = KeyboardNotificationHelper()
        
        return notification;
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavigationBar(title: "Sign In")
        self.setupLeftNavigationBar(withTitle: "Close")
        
        self.keyboardNotification.handleKeyboardNotificationWithBlock { (animation, duration, frame) in
            self.signInButtonBottomConstraint.constant = CGRectGetHeight(frame)
            UIView.animateWithDuration(duration, delay: 0, options: animation, animations: {
                self.view.setNeedsUpdateConstraints()
                self.view.layoutIfNeeded()
                }, completion: nil)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.keyboardNotification.addObserver()
        self.emailField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.view.endEditing(true)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.keyboardNotification.removeObserver()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func didTapLeftBarButtonItem(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func didTapSignInButton(sender: AnyObject) {
        self.view.endEditing(true)
        AppDelegate.sharedDelegate.presentRootViewController(BaseTabBarController.defaultTabBarController())
    }
}
