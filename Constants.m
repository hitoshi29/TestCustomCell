//
//  Constants.m
//  TestCustomCell
//
//  Created by ohshiro on 2014/06/05.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import "Constants.h"

@implementation Constants

// constで定数を定義（実装ファイル）
#ifdef DEBUG
// テスト用
NSString* const BaseURL = @"http://chie-no-wa.info/chieappscript/";
#else
// 本番用
NSString* const BaseURL = @"http://chie-no-wa.info/chieappscript/";
#endif

// API名称
NSString* const EXAM_ALL_SEL = @"exam_all_sel.php";

@end
