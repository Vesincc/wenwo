//
//  SimpleTableViewCellModel.m
//  wenwobei
//
//  Created by HanQi on 16/8/11.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SimpleTableViewCellModel.h"
#include "InfoNetworkModel.h"
#import "InfoDetailLiModel.h"

@implementation SimpleTableViewCellModel

+ (NSArray *)analysisFromInfoNetworkMode:(NSArray *)infoArray {

    NSMutableArray *array = [NSMutableArray array];
    
    for (InfoNetworkModel *info in infoArray) {
        
        SimpleTableViewCellModel *cellData = [[SimpleTableViewCellModel alloc] init];
        cellData.GeoX = info.GeoX;
        cellData.GeoY = info.GeoY;
        cellData.askContentHide = info.askContentHide;
        cellData.askIsFree = info.askIsFree;
        cellData.askLevel = info.askLevel;
        cellData.askPrice = info.askPrice;
        cellData.askReason = info.askReason;
        cellData.askType = info.askType;
        cellData.buyNum = info.buyNum;
        cellData.createBy = info.createBy;
        cellData.createByName = info.createByName;
        cellData.createByUrl = info.createByUrl;
        cellData.createdAt = info.createdAt;
        cellData.likeNum = info.likeNum;
        cellData.liked = info.liked;
        cellData.objectId = info.objectId;
        cellData.score = info.score;
        cellData.shopName = info.shopName;
        cellData.staus = info.staus;
        cellData.updatedAt = info.updatedAt;
        
        NSDictionary *contentDetail = [self dictionaryWithJsonString:info.askContentShow];

        if (contentDetail) {
        
            cellData.askContentShowDetail = [contentDetail valueForKey:@"detail"];
            cellData.askContentShowDetailLi = [InfoDetailLiModel arrayWithData:[self arrayWithJsonString:[contentDetail valueForKey:@"detailLi"]]];
           
        
        }
        
        
        cellData.askImage = [[self dictionaryWithJsonString:info.askImage] valueForKey:@"image"];
        
        NSDictionary *position = [self dictionaryWithJsonString:info.askPosition];
        cellData.askPositionCity = [position valueForKey:@"city"];
        cellData.askPositionDetail = [position valueForKey:@"detail"];
        cellData.askPositionDistrict = [position valueForKey:@"district"];
        cellData.askPositionProvince = [position valueForKey:@"province"];
        cellData.askPositionTownship = [position valueForKey:@"township"];
        
        cellData.askTag = [(NSDictionary *)([self arrayWithJsonString:info.askTagStr][0]) valueForKey:@"tag_name"];
        
        [array addObject:cellData];
        
    }
    

    return array;
}


+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    
    return dic;
    
}

+ (NSArray *)arrayWithJsonString:(NSString *)jsonString {

    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSArray *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    
    return dic;

}

@end
