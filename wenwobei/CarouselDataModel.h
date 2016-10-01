//
//  CarouselDataModel.h
//  wenwobei
//
//  Created by HanQi on 16/9/16.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarouselDataModel : NSObject

@property (nonatomic, strong) NSString *carouselClickURL;
@property (nonatomic, strong) NSString *carouselImage;
@property (nonatomic, strong) NSString *carouselName;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) NSInteger likeNum;
@property (nonatomic, assign) NSInteger liked;
@property (nonatomic, strong) NSString *objectId;
@property (nonatomic, assign) NSInteger show;
@property (nonatomic, strong) NSString *updatedAt;

+ (NSArray *)initWithData:(id)data;

- (instancetype)initWithCarouselClickURL:(NSString *)carouselClickURL carouselImage:(NSString *)carouselImage carouselName:(NSString *)carouselName createdAt:(NSString *)createdAt likeNum:(int)likeNum liked:(int)liked objectId:(NSString *)objectId show:(NSInteger)show updatedAt:(NSString *)updatedAt;

@end
