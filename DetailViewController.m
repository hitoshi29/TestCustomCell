//
//  DetailViewController.m
//  TestCustomCell
//
//  Created by ohshiro on 2014/04/12.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import "DetailViewController.h"
#import "ExplanationViewController.h"
#import "NAModalSheet.h"

@interface DetailViewController ()
@end

@implementation DetailViewController

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

    [self setExamData];
    
    // スワイプジェスチャーを作成して、登録する。
    UISwipeGestureRecognizer *swipe
        = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    // スワイプの方向は右方向を指定する。
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    // スワイプ動作に必要な指は1本と指定する。
    swipe.numberOfTouchesRequired = 1;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
#pragma mark SET Exam Data

/*
 *  問題表示
 */
- (void)setExamData
{
    self.titleName.text = [self.examData objectForKey:@"exam_title"];
    self.categoryName.text = [self.examData objectForKey:@"category_name"];
    self.subCategoryName.text = [self.examData objectForKey:@"sub_category_name"];
    self.examSentense.text = [self.examData objectForKey:@"exam_sentense"];
}

// スワイプされた際に呼び出される処理。
// NavigationViewで、現在の画面から一つ前の画面に戻る。
-(void)swipe:(UISwipeGestureRecognizer *)gesture {
    [self.navigationController popViewControllerAnimated:YES];
}

//　解説画面表示
- (IBAction)explanationBtnDidPush:(id)sender {
    ExplanationViewController *evc = [[ExplanationViewController alloc]init];
    
    NAModalSheet *sheet = [[NAModalSheet alloc] initWithViewController:evc presentationStyle:NAModalSheetPresentationStyleSlideInFromBottom];
    sheet.delegate = self;
    evc.modalSheet = sheet;
    [sheet presentWithCompletion:^{
        evc.explanation.text = [self.examData objectForKey:@"explanation"];
    }];
}

#pragma mark NAModalSheetDelegate

- (void)modalSheetTouchedOutsideContent:(NAModalSheet *)sheet
{
//    if (dismissOnOutsideTouchSwitch.on)
//    {
//        [sheet dismissWithCompletion:^{
//            
//        }];
//    }
    [sheet dismissWithCompletion:^{
        
    }];
}

- (BOOL)modalSheetShouldAutorotate:(NAModalSheet *)sheet
{
    return [self shouldAutorotate];
}

- (NSUInteger)modalSheetSupportedInterfaceOrientations:(NAModalSheet *)sheet
{
    return [self supportedInterfaceOrientations];
}

@end
