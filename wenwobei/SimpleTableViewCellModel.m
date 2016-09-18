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
        self.askContentShowDetailLi = [NSMutableArray array];
        self.askImage = [NSMutableArray array];
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
        self.askTag = [NSMutableArray array];
        
        
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

- (instancetype)initWithInfoNetworkModel:(InfoNetworkModel *)info
{
    self = [super init];
    if (self) {
        
        self.GeoX = info.GeoX;
        self.GeoY = info.GeoY;
        self.askContentHide = info.askContentHide;
        self.askIsFree = info.askIsFree;
        self.askLevel = info.askLevel;
        self.askPrice = info.askPrice;
        self.askReason = info.askReason;
        self.askType = info.askType;
        self.buyNum = info.buyNum;
        self.createBy = info.createBy;
        self.createByName = info.createByName;
        self.createByUrl = info.createByUrl;
        self.createdAt = info.createdAt;
        self.likeNum = info.likeNum;
        self.liked = info.liked;
        self.objectId = info.objectId;
        self.score = info.score;
        self.shopName = info.shopName;
        self.staus = info.staus;
        self.updatedAt = info.updatedAt;
        
        
        @try {
            
            NSDictionary *contentDetail = [SimpleTableViewCellModel dictionaryWithJsonString:info.askContentShow];
            
            if (contentDetail) {
                
                self.askContentShowDetail = [contentDetail valueForKey:@"detail"];
                
                @try {
                    
                    self.askContentShowDetailLi = [InfoDetailLiModel arrayWithData:[SimpleTableViewCellModel arrayWithJsonString:[contentDetail valueForKey:@"detailLi"]]];
                    
                } @catch (NSException *exception) {
                    
                    
                    @try {
                        
                        NSArray *temp = [contentDetail valueForKey:@"detailLi"];
                        
                        
                        
                        NSMutableArray *ok = [NSMutableArray array];
                        
                        for (int i = 0; i < temp.count; i++) {
                            
                            InfoDetailLiModel *model = [[InfoDetailLiModel alloc] initWith:[temp[i] valueForKey:@"name"] vallue:[temp[i] valueForKey:@"val"]];
                            
                            [ok addObject:model];
                            
                        }
                        
                        self.askTag = ok;
                        
                        
                        
                        
                    } @catch (NSException *exception) {
                        NSLog(@"解析detailLi");
                    }
                    
                }
                
                
                
                
            }
        } @catch (NSException *exception) {
            
            NSLog(@"解析detail");
            
        }
        
        @try {
            
            self.askImage = [[SimpleTableViewCellModel arrayWithJsonString:info.askImage] valueForKey:@"image"];
            //            NSLog(@"%@",info.askImage);
            //            NSLog(@"%@",cellData.askImage[0]);
            
            
        } @catch (NSException *exception) {
            
            NSLog(@"解析image");
            
        }
        
        @try {
            
            NSDictionary *position = [SimpleTableViewCellModel dictionaryWithJsonString:info.askPosition];
            self.askPositionCity = [position valueForKey:@"city"];
            self.askPositionDetail = [position valueForKey:@"detail"];
            self.askPositionDistrict = [position valueForKey:@"district"];
            self.askPositionProvince = [position valueForKey:@"province"];
            self.askPositionTownship = [position valueForKey:@"township"];
            
        } @catch (NSException *exception) {
            
            NSLog(@"解析position");
            
        }
        
        @try {
            
            //            NSLog(@"%@",  ([self arrayWithJsonString:info.askTagStr]));
            
            self.askTag = [([SimpleTableViewCellModel arrayWithJsonString:info.askTagStr]) valueForKey:@"tag_name"];
            
            //            NSLog(@"%@", cellData.askTag);
            
        } @catch (NSException *exception) {
            
            NSLog(@"解析tag");
            
        }
        
        
    }
    return self;
}

+ (NSArray *)analysisFromInfoNetworkMode:(NSArray *)infoArray {

    NSMutableArray *array = [NSMutableArray array];
    
    for (InfoNetworkModel *info in infoArray) {
        
        SimpleTableViewCellModel *cellData = [[SimpleTableViewCellModel alloc] initWithInfoNetworkModel:info];
        
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
