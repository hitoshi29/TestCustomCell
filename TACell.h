//
//  TACell.h
//  TestCustomCell
//
//  Created by ohshiro on 2014/03/21.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TACell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITextView *content;
@property (weak, nonatomic) IBOutlet UIButton *toAnswer;


@end
