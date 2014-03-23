//
//  TACell.m
//  TestCustomCell
//
//  Created by ohshiro on 2014/03/21.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import "TACell.h"

@implementation TACell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        //選択色のカスタマイズ
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    NSLog(@"test");
    // Configure the view for the selected state
}

-(void) setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    if (highlighted)
    {
        if (self.selectionStyle != UITableViewCellSelectionStyleNone)
        {
            //self.backgroundColor = [UIColor colorWithRed:0.5 green:0.62 blue:0.75 alpha:0.5]; //選択状態の色をセット
        }
    }
    else
    {
        self.backgroundColor = [UIColor clearColor];  //非選択状態の色をセット
    }
}

@end
