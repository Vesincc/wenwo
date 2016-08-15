//
//  InfoDetailLiModel.h
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoDetailLiModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *val;

+ (NSArray *)arrayWithData:(NSArray *)data;

@end
