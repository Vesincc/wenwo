//
//  UserInfo.m
//  wenwobei
//
//  Created by HanQi on 16/9/4.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "UserInfo.h"
#import "DataBase.h"

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
//        self.userHeadImageName = [[NSString alloc] init];
//        self.userName = [[NSString alloc] init];
//        self.likeNum = 0;
//        self.shareNum = 0;
//        self.totalIncome = 0.00;
//        self.havedNum = 0;
        
        DataBase *dataBase = [DataBase shareDataBase];
        [dataBase selectAllFromTable:@"userinfo"];
        
//        self.userID = @"573b0c63ad5b950057533669";
//        self.userHeadUrl = @"";
//        self.userHeadImageName = @"default_userhead";
//        self.userHeadImage = [UIImage imageNamed:self.userHeadImageName];
//        self.userName = @"HanQi";
//        self.likeNum = 1;
//        self.shareNum = 1;
//        self.totalIncome = 14.04;
//        self.havedNum = 1;
//        self.discoverPageNum = 0;
        
    }
    return self;
}

- (void)LoadFromDataBaseID:(NSString *)userID userHeadUrl:(NSString *)userHeadUrl  {

    


}

@end
