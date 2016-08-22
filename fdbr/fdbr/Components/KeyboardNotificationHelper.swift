//
//  KeyboardNotificationHelper.swift
//  fdbr
//
//  Created by Mohammad Nuruddin Effendi on 8/22/16.
//  Copyright © 2016 Female Daily. All rights reserved.
//

import UIKit

typealias KeyboardNotificationBlock = (animation: UIViewAnimationOptions, duration: NSTimeInterval, frame: CGRect) -> Void

class KeyboardNotificationHelper: NSObject {

    private var keyboardNotificationBlock: KeyboardNotificationBlock?
    
    func addObserver() {
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(KeyboardNotificationHelper.didReceiveKeyboardWillShowNotification(_:)),
                                                         name: UIKeyboardWillShowNotification,
                                                         object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(KeyboardNotificationHelper.didReceiveKeyboardWillHideNotification(_:)),
                                                         name: UIKeyboardWillHideNotification,
                                                         object: nil)
    }
    
    func removeObserver() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func didReceiveKeyboardWillShowNotification(notification: NSNotification) {
        self.keyboardHandleNotification(notification, willHide: false)
    }
    
    func didReceiveKeyboardWillHideNotification(notification: NSNotification) {
        self.keyboardHandleNotification(notification, willHide: true)
    }
    
    func keyboardHandleNotification(notification: NSNotification, willHide: Bool) {
        if let info = notification.userInfo {
            let animation = info[UIKeyboardAnimationCurveUserInfoKey]!.unsignedIntegerValue
            let duration = info[UIKeyboardAnimationDurationUserInfoKey]!.doubleValue
            let frame = willHide ? CGRectZero : info[UIKeyboardFrameEndUserInfoKey]!.CGRectValue()
            
            if let block = self.keyboardNotificationBlock {
                block(animation: UIViewAnimationOptions(rawValue: animation), duration: duration, frame: frame)
            }
        }
    }
    
    func handleKeyboardNotificationWithBlock(block: KeyboardNotificationBlock) {
        self.keyboardNotificationBlock = block
    }
    
}
