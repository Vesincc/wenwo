//
//  InfoNetworkModel.m
//  wenwobei
//
//  Created by HanQi on 16/8/11.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "InfoNetworkModel.h"
#import "SimpleTableViewCellModel.h"
#import "InfoDetailLiModel.h"

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

- (instancetype)initWithSimpleTableViewCellModel:(SimpleTableViewCellModel *)model
{
    self = [super init];
    if (self) {
        
        self.GeoX = model.GeoX;
        self.GeoY = model.GeoY;
        self.askContentHide = model.askContentHide;
        self.askIsFree = model.askIsFree;
        self.askLevel = model.askLevel;
        self.askPrice = model.askPrice;
        self.askReason = model.askReason;
        self.askType = model.askType;
        self.buyNum = model.buyNum;
        self.createBy = model.createBy;
        self.createByName = model.createByName;
        self.createByUrl = model.createByUrl;
        self.createdAt = model.createdAt;
        self.likeNum = model.likeNum;
        self.liked = model.liked;
        self.objectId = model.objectId;
        self.score = model.score;
        self.shopName = model.shopName;
        self.staus = model.staus;
        self.updatedAt = model.updatedAt;
        
//        NSLog(@"%@", self.objectId);
        
        @try {
            
            NSMutableDictionary *temp = [NSMutableDictionary dictionary];
//            temp[@"detail"] = model.askContentShowDetail;
            
            [temp setValue:model.askContentShowDetail forKey:@"detail"];
            NSString *detailLi;
            NSMutableArray *detailTemp = [NSMutableArray array];
            for (int i = 0; i < model.askContentShowDetailLi.count; i++) {
           
                InfoDetailLiModel *detailLiModel = model.askContentShowDetailLi[i];
                NSMutableDictionary *detailLiModelTemp = [NSMutableDictionary dictionary];
                [detailLiModelTemp setValue:detailLiModel.name forKey:@"name"];
                [detailLiModelTemp setValue:detailLiModel.val forKey:@"val"];
                
                
                
                [detailTemp addObject:detailLiModelTemp];
            
            }
            
            detailLi = [InfoNetworkModel jsonStringWithData:detailTemp];
            
//            NSLog(@"%@", detailLi);
            
            [temp setValue:detailLi forKey:@"detailLi"];
            
            self.askContentShow = [InfoNetworkModel jsonStringWithData:temp];
            
//            NSLog(@"%@", self.askContentShow);
            
                
            
        } @catch (NSException *exception) {
            
            NSLog(@"包装detail");
            
        }
        
        @try {
            
            NSString *imageString;
            
            NSMutableArray *imageArray = [NSMutableArray array];
            
            for (int i = 0; i < model.askImage.count; i++) {
            
                NSMutableDictionary *imageDic = [NSMutableDictionary dictionary];
                [imageDic setValue:model.askImage[i] forKey:@"image"];
                
                [imageArray addObject:imageDic];
            
            }
            imageString = [InfoNetworkModel jsonStringWithData:imageArray];
            
            self.askImage = imageString;
            
//            NSLog(@"%@", self.askImage);
            
            
            
        } @catch (NSException *exception) {
            
            NSLog(@"包装image");
            
        }

        @try {
            
            NSString *positionString;
            
            NSMutableDictionary *positionDic = [NSMutableDictionary dictionary];
            
            [positionDic setObject:model.askPositionProvince forKey:@"province"];
            [positionDic setObject:model.askPositionCity forKey:@"city"];
            [positionDic setObject:model.askPositionDistrict forKey:@"district"];
            [positionDic setObject:model.askPositionTownship forKey:@"township"];
            [positionDic setObject:model.askPositionDetail forKey:@"detail"];
            
            positionString = [InfoNetworkModel jsonStringWithData:positionDic];
            
            self.askPosition = positionString;
            
//            NSLog(@"%@", self.askPosition);
            
            
            
        } @catch (NSException *exception) {
            
            NSLog(@"包装position");
            
        }

        @try {
            
            NSMutableArray *tagArray = [NSMutableArray array];
            
            for (int i = 0; i < model.askTag.count; i++) {
            
                NSMutableDictionary *tagDic = [NSMutableDictionary dictionary];
                [tagDic setValue:model.askTag[i] forKey:@"tag_name"];
                
                [tagArray addObject:tagDic];
            
            }
            
            self.askTagStr = [InfoNetworkModel jsonStringWithData:tagArray];
            
//            NSLog(@"%@", self.askTagStr);
            
            
            
        } @catch (NSException *exception) {
            
            NSLog(@"包装tag");
            
        }
        
        
    }
    return self;
}

+ (NSString *)jsonStringWithData:(id)data {
    
    NSString *val;

    @try {
        
        val = [[NSString alloc] initWithData:[self toJSONData:data] encoding:NSUTF8StringEncoding];
        
        val = [val stringByReplacingOccurrencesOfString:@" " withString:@""];
        val = [val stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        
    } @catch (NSException *exception) {
        NSLog(@"失败");
    }
    
    return val;
    
}

+ (NSData *)toJSONData:(id)theData{
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData options:NSJSONWritingPrettyPrinted error:&error];
    
    if ([jsonData length] && error == nil){
        return jsonData;
    }else{
        NSLog(@"%@", error);
        return nil;
    }
}

- (instancetype)initWithID:(NSString *)objectID GeoX:(NSString *)GeoX GeoY:(NSString *)GeoY askContentHide:(NSString *)askContentHide askContentShow:(NSString *)askContentShow askImage:(NSString *)askImage askIsFree:(NSString *)askIsFree askLevel:(NSString *)askLevel askPosition:(NSString *)askPosition askPrice:(NSString *)askPrice askReason:(NSString *)askReason askTagStr:(NSString *)askTagStr askType:(NSString *)askType buyNum:(NSString *)buyNum createBy:(NSString *)createBy createByName:(NSString *)createByName createByUrl:(NSString *)createByUrl createdAt:(NSString *)createdAt likeNum:(NSString *)likeNum liked:(int)liked objectId:(NSString *)objectId score:(NSString *)score shopName:(NSString *)shopName staus:(NSString *)staus updatedAt:(NSString *)updatedAt
{
    self = [super init];
    if (self) {
        
        self.GeoX = GeoX;
        self.GeoY = GeoY;
        self.askContentHide = askContentHide;
        self.askContentShow = askContentShow;
        self.askImage = askImage;
        self.askIsFree = askIsFree;
        self.askLevel = askLevel;
        self.askPosition = askPosition;
        self.askPrice = askPrice;
        self.askReason = askReason;
        self.askTagStr = askTagStr;
        self.askType = askType;
        self.buyNum = buyNum;
        self.createBy = createBy;
        self.createByName = createByName;
        self.createByUrl = createByUrl;
        self.createdAt = createdAt;
        self.likeNum = likeNum;
        self.liked =  liked;
        self.objectId = objectID;
        self.score = score;
        self.shopName = shopName;
        self.staus = staus;
        self.updatedAt = updatedAt;
        
        
    }
    return self;
}

@end
