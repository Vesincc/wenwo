//
//  UserInfo.m
//  wenwobei
//
//  Created by HanQi on 16/9/4.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

static UserInfo *userInfo = nil;

+ (instancetype)shareUserInfo {
    
    @synchronized (self) {
        if (userInfo == nil) {
            
            userInfo = [[UserInfo alloc] init];
            
        }
    }
    
    return userInfo;
    
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {

    @synchronized (self) {
        if (!userInfo){
            
            userInfo = [super allocWithZone:zone];
            
            
        }
    }
    
    return userInfo;

}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        self.userID = [[NSString alloc] init];
//        self.userHeadUrl = [[NSString alloc] init];
//        self.userHeadImage = [[UIImage alloc] init];
//        self.userName = [[NSString alloc] init];
//        self.likeNum = 0;
//        self.shareNum = 0;
//        self.totalIncome = 0.00;
//        self.havedNum = 0;
        
        self.userID = @"573b0c63ad5b950057533669";
        self.userHeadUrl = @"";
        self.userHeadImage = [UIImage imageNamed:@"default_userhead"];
        self.userName = @"HanQi";
        self.likeNum = 37;
        self.shareNum = 12;
        self.totalIncome = 34.04;
        self.havedNum = 34;
        
    }
    return self;
}

@end
