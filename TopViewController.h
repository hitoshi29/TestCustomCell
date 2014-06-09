//
//  TopViewController.h
//  TestCustomCell
//
//  Created by ohshiro on 2014/03/21.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface TopViewController : UITableViewController

@property(strong, nonatomic) IBOutlet NSArray *items;
//外部参照用プロパティ
@property (nonatomic, retain) NSDictionary *examData;

// cell events
- (void)didTouchToAnswerButton:(UIButton *)sender event:(UIEvent *)event;
@end
