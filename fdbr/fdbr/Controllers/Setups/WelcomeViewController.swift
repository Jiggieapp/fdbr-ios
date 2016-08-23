//
//  WelcomeViewController.swift
//  fdbr
//
//  Created by Setiady Wiguna on 8/22/16.
//  Copyright © 2016 Jiggie. All rights reserved.
//

import UIKit
import TTTAttributedLabel

class WelcomeViewController: BaseViewController, TTTAttributedLabelDelegate {

    @IBOutlet var loginLabel: TTTAttributedLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let loginString: NSString = "Already have an account? Log in"
        
        self.loginLabel.linkAttributes = [String(kCTForegroundColorAttributeName) : UIColor.blueColor(),
                                          String(kCTUnderlineStyleAttributeName) : false]
        self.loginLabel.addLinkToURL(NSURL(string: "kLoginLink"), withRange: loginString.rangeOfString("Log in"))
        self.loginLabel.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapLoginWithFacebookButton(sender: AnyObject) {
    }
    
    @IBAction func didTapSignUpButton(sender: AnyObject) {
        self.presentViewController(UINavigationController(rootViewController: SignUpViewController()),
                                   animated: true,
                                   completion: nil)
    }
    
    // MARK: TTTAttributedLabelDelegate
    func attributedLabel(label: TTTAttributedLabel!, didSelectLinkWithURL url: NSURL!) {
        self.presentViewController(UINavigationController(rootViewController: LoginViewController()),
                                   animated: true,
                                   completion: nil)
    }
    
}
