//
//  CarouselDataModel.m
//  wenwobei
//
//  Created by HanQi on 16/9/16.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "CarouselDataModel.h"

@implementation CarouselDataModel

- (instancetype)initWithCarouselClickURL:(NSString *)carouselClickURL carouselImage:(NSString *)carouselImage carouselName:(NSString *)carouselName createdAt:(NSString *)createdAt likeNum:(NSInteger)likeNum liked:(NSInteger)liked objectId:(NSString *)objectId show:(NSInteger)show updatedAt:(NSString *)updatedAt
{
    self = [super init];
    if (self) {
        self.carouselClickURL = carouselClickURL;
        self.carouselImage = carouselImage;
        self.carouselName = carouselName;
        self.createdAt = createdAt;
        self.likeNum = likeNum;
        self.liked = liked;
        self.objectId = objectId;
        self.show = show;
        self.updatedAt = updatedAt;
    }
    return self;
}

+ (NSArray *)initWithData:(id)data {

    NSMutableArray *array = [NSMutableArray array];
    
//    NSLog(@"%@", data);
    @try {
        
        NSArray *JsonData = data;
        
//        NSLog(@"%@", JsonData[0]);
        
        for (int i = 0; i < JsonData.count; i++) {
        
            NSDictionary *dic = JsonData[i];
            
            CarouselDataModel *model = [[CarouselDataModel alloc] initWithCarouselClickURL:dic[@"carouselClickURL"] carouselImage:dic[@"carouselImage"] carouselName:dic[@"carouselName"] createdAt:dic[@"createdAt"] likeNum:dic[@"likeNum"] liked:dic[@"liked"] objectId:dic[@"objectId"] show:dic[@"show"] updatedAt:dic[@"updatedAt"]];
            
//            NSLog(@"%@, %@, %@, %@, %d, %d, %@, %d, %@", model.carouselClickURL, model.carouselImage, model.carouselName, model.createdAt, model.likeNum, model.liked, model.objectId, model.show, model.updatedAt);
            
            [array addObject:model];
        
        }
        
        
    } @catch (NSException *exception) {

        NSLog(@"error---------->CarouselDataModel");
        
    }
//    NSLog(@"%@", array);
    
    return array;
    
    

}

@end
