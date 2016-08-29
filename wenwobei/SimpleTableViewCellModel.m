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

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.GeoX = [[NSString alloc] init];
        self.GeoY = [[NSString alloc] init];
        self.askContentHide = [[NSString alloc] init];
        self.askContentShowDetail = [[NSString alloc] init];
        self.askContentShowDetailLi = [NSArray array];
        self.askImage = [[NSString alloc] init];
        self.askIsFree = [[NSString alloc] init];
        self.askLevel = [[NSString alloc] init];
        self.askPositionCity = [[NSString alloc] init];
        self.askPositionDetail = [[NSString alloc] init];
        self.askPositionDistrict = [[NSString alloc] init];
        self.askPositionProvince = [[NSString alloc] init];
        self.askPositionTownship = [[NSString alloc] init];
        self.askPrice = [[NSString alloc] init];
        self.askReason = [[NSString alloc] init];
        self.askType = [[NSString alloc] init];
        self.buyNum = [[NSString alloc] init];
        self.createBy = [[NSString alloc] init];
        self.createByName = [[NSString alloc] init];
        self.createByUrl = [[NSString alloc] init];
        self.createdAt = [[NSString alloc] init];
        self.likeNum = [[NSString alloc] init];
        self.objectId = [[NSString alloc] init];
        self.score = [[NSString alloc] init];
        self.shopName = [[NSString alloc] init];
        self.staus = [[NSString alloc] init];
        self.updatedAt = [[NSString alloc] init];
        self.askType = [[NSString alloc] init];
        
        
    }
    return self;
}

- (BOOL)isEqualToKey:(NSString *)key value:(NSString *)value {

    if ([[self valueForKey:key] isEqualToString:value]) {
    
        return YES;
    
    
    } else {
    
        return NO;
    
    }


}

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
        
        @try {
            
            NSDictionary *contentDetail = [self dictionaryWithJsonString:info.askContentShow];
            
            if (contentDetail) {
                
                cellData.askContentShowDetail = [contentDetail valueForKey:@"detail"];
                
                @try {
                    
                    cellData.askContentShowDetailLi = [InfoDetailLiModel arrayWithData:[self arrayWithJsonString:[contentDetail valueForKey:@"detailLi"]]];
                    
                } @catch (NSException *exception) {
                    
                    NSLog(@"解析detailLi");
                    
                }
                
                
                
                
            }
        } @catch (NSException *exception) {
            
            NSLog(@"解析detail");
            
        }
        
        @try {
            
            cellData.askImage = [[self dictionaryWithJsonString:info.askImage] valueForKey:@"image"];
            
        } @catch (NSException *exception) {
            
            NSLog(@"解析image");
            
        }
        
        @try {
            
            NSDictionary *position = [self dictionaryWithJsonString:info.askPosition];
            cellData.askPositionCity = [position valueForKey:@"city"];
            cellData.askPositionDetail = [position valueForKey:@"detail"];
            cellData.askPositionDistrict = [position valueForKey:@"district"];
            cellData.askPositionProvince = [position valueForKey:@"province"];
            cellData.askPositionTownship = [position valueForKey:@"township"];
            
        } @catch (NSException *exception) {
            
            NSLog(@"解析position");
            
        }
        
        @try {
            
            cellData.askTag = [(NSDictionary *)([self arrayWithJsonString:info.askTagStr][0]) valueForKey:@"tag_name"];
            
        } @catch (NSException *exception) {
            
            NSLog(@"解析tag");
            
        }
        
            
        
        
//        NSLog(@"%d", [cellData isEqualToKey:@"askTag" value:@"杂酱面"]);
        
        
        
        
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

+ (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}


@end
