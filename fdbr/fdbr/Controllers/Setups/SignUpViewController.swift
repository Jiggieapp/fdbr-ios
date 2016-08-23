//
//  SignUpViewController.swift
//  fdbr
//
//  Created by Setiady Wiguna on 8/22/16.
//  Copyright © 2016 Jiggie. All rights reserved.
//

import UIKit
import TTTAttributedLabel

class SignUpViewController: BaseViewController, TTTAttributedLabelDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var tncLabel: TTTAttributedLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func didTapLeftBarButtonItem(sender: AnyObject) {
        self.view.endEditing(true)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didTapRightBarButtonItem(sender: AnyObject) {
        self.view.endEditing(true)
        AppDelegate.sharedDelegate.presentRootViewController(BaseTabBarController.defaultTabBarController())
    }

    // MARK: View
    private func setupView() {
        self.setupNavigationBar(title: "Sign Up")
        self.setupLeftNavigationBar(withTitle: "Cancel")
        self.setupRightNavigationBar(withTitle: "Done")
        
        let tncString: NSString = "By signing up, you agree to our Terms of Service & Privacy Policy"
        
        self.tncLabel.linkAttributes = [String(kCTForegroundColorAttributeName) : UIColor.blueColor(),
                                          String(kCTUnderlineStyleAttributeName) : false]
        self.tncLabel.addLinkToURL(NSURL(string: "kTNCLink"), withRange: tncString.rangeOfString("Terms of Service"))
        self.tncLabel.addLinkToURL(NSURL(string: "kPrivacyLink"), withRange: tncString.rangeOfString("Privacy Policy"))
        self.tncLabel.delegate = self
    }

    // MARK: TTTAttributedLabelDelegate
    func attributedLabel(label: TTTAttributedLabel!, didSelectLinkWithURL url: NSURL!) {
        if url.URLString == "kTNCLink" {
            
        } else if url.URLString == "kPrivacyLink" {
        
        }
    }

}
