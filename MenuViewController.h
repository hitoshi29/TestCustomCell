//
//  MenuViewController.h
//  TestCustomCell
//
//  Created by ohshiro on 2014/06/10.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNGridMenu.h"

@interface MenuViewController : UIViewController<RNGridMenuDelegate>
- (IBAction)menuBtn:(id)sender;
- (IBAction)listBtn:(id)sender;
@end
