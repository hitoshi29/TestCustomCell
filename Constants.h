//
//  Constants.h
//  TestCustomCell
//
//  Created by ohshiro on 2014/06/05.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import <Foundation/Foundation.h>

// defineで定数を定義
//#define CONST_STRING @"定数クラスを呼び出し"

@interface Constants : NSObject

// constで定数を定義（ヘッダーファイル）
extern NSString* const BaseURL;
extern NSString* const EXAM_ALL_SEL;

@end
