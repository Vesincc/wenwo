//
//  UserInfo.h
//  wenwobei
//
//  Created by HanQi on 16/9/4.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserInfo : NSObject

@property (nonatomic, strong) NSString *userHeadUrl;
@property (nonatomic, strong) UIImage *userHeadImage;
@property (nonatomic, strong) NSString *userHeadImageName;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, assign) int likeNum;
@property (nonatomic, assign) int shareNum;
@property (nonatomic, assign) float totalIncome;
@property (nonatomic, assign) int discoverPageNum;

@property (nonatomic, assign) int havedNum;

+ (instancetype)shareUserInfo;

@end
