//
//  TopViewController.m
//  TestCustomCell
//
//  Created by ohshiro on 2014/03/21.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import "TopViewController.h"
#import "DetailViewController.h"
#import "TACell.h"
#import "Constants.h"

@interface TopViewController (){
    NSDictionary* examData;
}
@end

@implementation TopViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self getExamData];
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"TACell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
    self.tableView.rowHeight = 180;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
//    UIImage *backgroundImage = [UIImage imageNamed:@"background.png"];
//    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:backgroundImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TACell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TACell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.titleLabel.text = [self.items[indexPath.row] objectForKey:@"exam_title"];
    cell.categoryLabel.text = [self.items[indexPath.row] objectForKey:@"category_name"];
    cell.content.text = [self.items[indexPath.row] objectForKey:@"exam_sentense"];

    // ボタンのタッチイベント
    [cell.toAnswer addTarget: self
                      action: @selector( didTouchToAnswerButton : event: )
          forControlEvents: UIControlEventTouchUpInside];
    
    // セルの背景色を透明にする
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

/*
 * セルの高さ設定
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}

/*
 * セルをスクロールしたときに表示されるアニメーション
 */
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [UIView animateWithDuration:0.5 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
}

/*
 *  サーバーからJSON形式でデータを取得
 */
- (void)getExamData
{
    // カテゴリを引数に問題を取得するAPIを用意する
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", BaseURL, EXAM_ALL_SEL]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        // アプリデータの配列をプロパティに保持
        self.items = [jsonDictionary objectForKey:@"data"];
        
        // TableView をリロード
        [self.tableView reloadData];
    }];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES]; // 選択状態の解除
//    //cell.backgroundColor = [UIColor clearColor];  //非選択状態の色をセット
//    // Navigation logic may go here, for example:
//    // Create the next view controller.
//    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
//
//    // Push the view controller.
//    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)didTouchToAnswerButton:(UIButton *)sender event: (UIEvent *)event
{
    NSIndexPath *indexPath = [self indexPathForControlEvent:event];
    //NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];
    NSString *messageString = [NSString stringWithFormat:@"Button at section %ld row %ld was tapped.", (long)indexPath.section, (long)indexPath.row];

    NSLog(@"%@", messageString);
    
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    
    detailViewController.examData = [self.items objectAtIndex:indexPath.row];
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}

// UIControlEventからタッチ位置のindexPathを取得する
- (NSIndexPath *)indexPathForControlEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint p = [touch locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:p];
    return indexPath;
}

@end
