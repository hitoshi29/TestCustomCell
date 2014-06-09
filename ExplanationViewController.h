//
//  ExplanationViewController.h
//  TestCustomCell
//
//  Created by ohshiro on 2014/06/08.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NAModalSheet;

@interface ExplanationViewController : UIViewController

@property (nonatomic, weak) NAModalSheet *modalSheet;

@property (strong, nonatomic) IBOutlet UITextView *explanation;
- (IBAction)exitExplanationBtnDidPush:(id)sender;

@end


