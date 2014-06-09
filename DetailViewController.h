//
//  DetailViewController.h
//  TestCustomCell
//
//  Created by ohshiro on 2014/04/12.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *titleName;
@property (strong, nonatomic) IBOutlet UILabel *categoryName;
@property (strong, nonatomic) IBOutlet UILabel *subCategoryName;
@property (strong, nonatomic) IBOutlet UITextView *examSentense;
- (IBAction)explanationBtnDidPush:(id)sender;


//外部参照用プロパティ
@property (nonatomic, retain) NSDictionary *examData;

@end