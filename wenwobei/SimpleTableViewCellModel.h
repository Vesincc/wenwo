//
//  SimpleTableViewCellModel.h
//  wenwobei
//
//  Created by HanQi on 16/8/11.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpleTableViewCellModel : NSObject

@property (nonatomic, copy) NSString *GeoX;
@property (nonatomic, copy) NSString *GeoY;

@property (nonatomic, copy) NSString *askContentHide;
@property (nonatomic, copy) NSString *askContentShowDetail;
@property (nonatomic, copy) NSArray *askContentShowDetailLi;

@property (nonatomic, copy) NSString *askImage;
@property (nonatomic, copy) NSString *askIsFree;
@property (nonatomic, copy) NSString *askLevel;

@property (nonatomic, copy) NSString *askPositionProvince;
@property (nonatomic, copy) NSString *askPositionCity;
@property (nonatomic, copy) NSString *askPositionDistrict;
@property (nonatomic, copy) NSString *askPositionTownship;
@property (nonatomic, copy) NSString *askPositionDetail;

@property (nonatomic, copy) NSString *askPrice;
@property (nonatomic, copy) NSString *askReason;
@property (nonatomic, copy) NSString *askType;
@property (nonatomic, copy) NSString *buyNum;
@property (nonatomic, copy) NSString *createBy;
@property (nonatomic, copy) NSString *createByName;
@property (nonatomic, copy) NSString *createByUrl;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *likeNum;
@property (nonatomic, assign) int liked;
@property (nonatomic, copy) NSString *objectId;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *shopName;
@property (nonatomic, copy) NSString *staus;
@property (nonatomic, copy) NSString *updatedAt;

@property (nonatomic, copy) NSString *askTag;

+ (NSArray *)analysisFromInfoNetworkMode:(NSArray *)infoArray;

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

+ (NSArray *)arrayWithJsonString:(NSString *)jsonString;

@end
