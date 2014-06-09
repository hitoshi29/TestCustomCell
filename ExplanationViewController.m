//
//  ExplanationViewController.m
//  TestCustomCell
//
//  Created by ohshiro on 2014/06/08.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import "ExplanationViewController.h"
#import "NAModalSheet.h"

@interface ExplanationViewController ()

@end

@implementation ExplanationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)exitExplanationBtnDidPush:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.modalSheet dismissWithCompletion:^{
        
    }];
}
@end
