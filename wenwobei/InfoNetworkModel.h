//
//  InfoNetworkModel.h
//  wenwobei
//
//  Created by HanQi on 16/8/11.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SimpleTableViewCellModel;
@interface InfoNetworkModel : NSObject

@property (nonatomic, strong) NSString *GeoX;
@property (nonatomic, strong) NSString *GeoY;
@property (nonatomic, strong) NSString *askContentHide;
@property (nonatomic, strong) NSString *askContentShow;
@property (nonatomic, strong) NSString *askImage;
@property (nonatomic, strong) NSString *askIsFree;
@property (nonatomic, strong) NSString *askLevel;
@property (nonatomic, strong) NSString *askPosition;
@property (nonatomic, strong) NSString *askPrice;
@property (nonatomic, strong) NSString *askReason;
@property (nonatomic, strong) NSString *askTagStr;
@property (nonatomic, strong) NSString *askType;
@property (nonatomic, strong) NSString *buyNum;
@property (nonatomic, strong) NSString *createBy;
@property (nonatomic, strong) NSString *createByName;
@property (nonatomic, strong) NSString *createByUrl;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *likeNum;
@property (nonatomic, assign) int liked;
@property (nonatomic, strong) NSString *objectId;
@property (nonatomic, strong) NSString *score;
@property (nonatomic, strong) NSString *shopName;
@property (nonatomic, strong) NSString *staus;
@property (nonatomic, strong) NSString *updatedAt;

+ (NSArray *)analysisNetworkData:(NSArray *)networkData;

- (instancetype)initWithSimpleTableViewCellModel:(SimpleTableViewCellModel *)model;

- (instancetype)initWithID:(NSString *)objectID GeoX:(NSString *)GeoX GeoY:(NSString *)GeoY askContentHide:(NSString *)askContentHide askContentShow:(NSString *)askContentShow askImage:(NSString *)askImage askIsFree:(NSString *)askIsFree askLevel:(NSString *)askLevel askPosition:(NSString *)askPosition askPrice:(NSString *)askPrice askReason:(NSString *)askReason askTagStr:(NSString *)askTagStr askType:(NSString *)askType buyNum:(NSString *)buyNum createBy:(NSString *)createBy createByName:(NSString *)createByName createByUrl:(NSString *)createByUrl createdAt:(NSString *)createdAt likeNum:(NSString *)likeNum liked:(int)liked objectId:(NSString *)objectId score:(NSString *)score shopName:(NSString *)shopName staus:(NSString *)staus updatedAt:(NSString *)updatedAt;

@end
