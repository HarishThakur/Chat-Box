//
//  KeyboardAnimation.h
//  Chat Box
//
//  Created by Harish Singh on 08/10/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KeyboardAnimation : NSObject {
 
}

+ (void)textFieldDidBeginEditing:(UITextField *)textField inView:(UIViewController*)mainView;

+ (void)textFieldDidEndEditing:(UITextField *)textfield inView:(UIViewController*)mainView;

@end
