//
//  InfoDetailLiModel.m
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "InfoDetailLiModel.h"

@implementation InfoDetailLiModel

+ (NSArray *)arrayWithData:(NSArray *)data {

    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i < data.count; i++) {
    
        InfoDetailLiModel *infoDatailLi = [[InfoDetailLiModel alloc] init];
        NSDictionary *temp = data[i];
        infoDatailLi.name = [temp valueForKey:@"name"];
        infoDatailLi.val = [temp valueForKey:@"val"];
        
        [array addObject:infoDatailLi];
    
    }
    return array;
}

@end
