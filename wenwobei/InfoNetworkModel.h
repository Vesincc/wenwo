//
//  InfoNetworkModel.h
//  wenwobei
//
//  Created by HanQi on 16/8/11.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoNetworkModel : NSObject

@property (nonatomic, copy) NSString *GeoX;
@property (nonatomic, copy) NSString *GeoY;
@property (nonatomic, copy) NSString *askContentHide;
@property (nonatomic, copy) id askContentShow;
@property (nonatomic, copy) NSString *askImage;
@property (nonatomic, copy) NSString *askIsFree;
@property (nonatomic, copy) NSString *askLevel;
@property (nonatomic, copy) NSString *askPosition;
@property (nonatomic, copy) NSString *askPrice;
@property (nonatomic, copy) NSString *askReason;
@property (nonatomic, copy) NSString *askTagStr;
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

+ (NSArray *)analysisNetworkData:(NSArray *)networkData;

@end
