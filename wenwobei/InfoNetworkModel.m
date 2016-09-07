//
//  InfoNetworkModel.m
//  wenwobei
//
//  Created by HanQi on 16/8/11.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "InfoNetworkModel.h"

@implementation InfoNetworkModel

+ (NSArray *)analysisNetworkData:(NSArray *)networkData {

    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i < networkData.count; i++) {
    
        NSDictionary *temp = networkData[i];
    
        InfoNetworkModel *info = [[InfoNetworkModel alloc] init];
        info.GeoX = [temp valueForKey:@"GeoX"];
        info.GeoY = [temp valueForKey:@"GeoY"];
        info.askContentHide = [temp valueForKey:@"askContentHide"];
        info.askContentShow = [temp valueForKey:@"askContentShow"];
        info.askImage = [temp valueForKey:@"askImage"];
        info.askIsFree = [temp valueForKey:@"askIsFree"];
        info.askLevel = [temp valueForKey:@"askLevel"];
        info.askPosition = [temp valueForKey:@"askPosition"];
        info.askPrice = [temp valueForKey:@"askPrice"];
        info.askReason = [temp valueForKey:@"askReason"];
        info.askTagStr = [temp valueForKey:@"askTagStr"];
        info.askType = [temp valueForKey:@"askType"];
        info.buyNum = [temp valueForKey:@"buyNum"];
        info.createBy = [temp valueForKey:@"createBy"];
        info.createByName = [temp valueForKey:@"createByName"];
        info.createByUrl = [temp valueForKey:@"createByUrl"];
        info.createdAt = [temp valueForKey:@"cteatdAt"];
        info.likeNum = [temp valueForKey:@"likeNum"];
        info.liked =  [[temp valueForKey:@"liked"] intValue];
        info.objectId = [temp valueForKey:@"objectId"];
        info.score = [temp valueForKey:@"score"];
        info.shopName = [temp valueForKey:@"shopName"];
        info.staus = [temp valueForKey:@"staus"];
        info.updatedAt = [temp valueForKey:@"updatedAt"];
        
        
        [array addObject:info];
    
    }


    return array;
}

@end
