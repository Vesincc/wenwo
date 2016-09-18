//
//  DataBase.m
//  wenwobei
//
//  Created by HanQi on 16/9/7.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "DataBase.h"
#import "FMDB.h"
#import "InfoNetworkModel.h"
#import "UserInfo.h"
#import "CarouselDataModel.h"

@implementation DataBase

static DataBase *dataBase = nil;

+ (instancetype)shareDataBase {
    
    @synchronized (self) {
        if (dataBase == nil) {
            
            dataBase = [[DataBase alloc] init];
            
        }
    }
    
    return dataBase;
    
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    @synchronized (self) {
        if (!dataBase){
            
            dataBase = [super allocWithZone:zone];
            
            
        }
    }
    
    return dataBase;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSString *dataBaseName = @"wenwo.sqlite";
        
        NSString *dataBasePath = [[(NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)) lastObject]stringByAppendingPathComponent:dataBaseName];

        
        self.db = [FMDatabase databaseWithPath:dataBasePath];
        
        NSLog(@"%@", [self createTables]?@"YES":@"NO");
        
        
    }
    return self;
}

- (BOOL)createTables {
    
    if ([self.db open]) {
        
        if (![self.db executeUpdate:@"create table if not exists allinfo(objectId text primary key UNIQUE, GeoX text, GeoY text, askContentHide text, askContentShow text, askImage text, askIsFree text, askLevel text, askPosition text, askPrice text, askReason text, askTagStr text, askType text, buyNum text, createBy text, createByName text, createByUrl text, createdAt text, likeNum text, liked integer, score text, shopName text, staus text, updatedAt text)"]) {
            
            return NO;
            
        };
        
        
        if (![self.db executeUpdate:@"create table if not exists likeinfo(objectId text primary key, GeoX text, GeoY text, askContentHide text, askContentShow text, askImage text, askIsFree text, askLevel text, askPosition text, askPrice text, askReason text, askTagStr text, askType text, buyNum text, createBy text, createByName text, createByUrl text, createdAt text, likeNum text, liked integer, score text, shopName text, staus text, updatedAt text)"]) {
            
            
            return NO;
            
        }
        
        
        if (![self.db executeUpdate:@"create table if not exists userinfo (userID text primary key, userHeadUrl text, userHeadImageName text, userName text, likeNum integer, shareNum integer, totalIncome real, havedNum integer, discoverPageNum integer)"]) {
            
            return NO;
            
        }
        
        if (![self.db executeUpdate:@"create table if not exists carousel (objectId text primary key, carouselClickURL text, carouselImage text, carouselName text, createdAt text, likeNum integer, liked integer, show integer, updatedAt text)"]) {
            
            return NO;
            
        }
        
        [self.db close];
        
        return YES;
    
    
    } else {
    
        return NO;
    
    
    }

}

- (BOOL)insertArray:(NSArray *)models tableName: (NSString *)table {

    int flag = 0;
    
    for (int i = 0; i < models.count; i++) {
        
        InfoNetworkModel *model = (InfoNetworkModel *)models[i];

        if (![self insert:model talbeName:table]) {
        
            NSLog(@"error");
            flag++;
        
        }
    
    
    }
    
    if (flag == 0) {
    
        return YES;
        
    } else {
        
        return NO;
    
    }

    return YES;

}

- (BOOL)insert:(id)data talbeName:(NSString *)table {
    
    if ([self.db open]) {
        
//        NSLog(@"%@", table);
    
        if ([table isEqualToString:@"allinfo"]) {
            
            InfoNetworkModel *model = data;
            
        
            if (![self.db executeUpdate:@"insert or replace into allinfo (objectId, GeoX, GeoY, askContentHide, askContentShow, askImage, askIsFree, askLevel, askPosition, askPrice, askReason, askTagStr, askType, buyNum, createBy, createByName, createByUrl, createdAt, likeNum, liked, score, shopName, staus, updatedAt) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", model.objectId, model.GeoX, model.GeoY, model.askContentHide, model.askContentShow, model.askImage, model.askIsFree, model.askLevel, model.askPosition, model.askPrice, model.askReason, model.askTagStr, model.askType, model.buyNum, model.createBy, model.createByName, model.createByUrl, model.createdAt, model.likeNum, [NSNumber numberWithInt:model.liked], model.score, model.shopName, model.staus, model.updatedAt]) {

                NSLog(@"error");
                
                return NO;
                
            }

        
        } else if ([table isEqualToString:@"likeinfo"]) {
            
            InfoNetworkModel *model = data;
            
            
            if (![self.db executeUpdate:@"insert or replace into likeinfo (objectId, GeoX, GeoY, askContentHide, askContentShow, askImage, askIsFree, askLevel, askPosition, askPrice, askReason, askTagStr, askType, buyNum, createBy, createByName, createByUrl, createdAt, likeNum, liked, score, shopName, staus, updatedAt) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", model.objectId, model.GeoX, model.GeoY, model.askContentHide, model.askContentShow, model.askImage, model.askIsFree, model.askLevel, model.askPosition, model.askPrice, model.askReason, model.askTagStr, model.askType, model.buyNum, model.createBy, model.createByName, model.createByUrl, model.createdAt, model.likeNum, [NSNumber numberWithInt:model.liked], model.score, model.shopName, model.staus, model.updatedAt]) {
                
                NSLog(@"error");
                
                return NO;
                
            }

        
        
        } else if ([table isEqualToString:@"carousel"]) {
            
            CarouselDataModel *model = data;
            
            if (![self.db executeUpdate:@"insert or replace into carousel (objectId, carouselClickURL, carouselImage, carouselName, createdAt, likeNum, liked, show, updatedAt) values (?, ?, ?, ?, ?, ?, ?, ?, ?)", model.objectId, model.carouselClickURL, model.carouselImage, model.carouselName, model.createdAt, [NSNumber numberWithInt:model.likeNum], [NSNumber numberWithInt:model.liked], [NSNumber numberWithInt:model.show], model.updatedAt]) {
            
                NSLog(@"error");
                
                return NO;
            
            
            }
        
        }
        
        [self.db close];
        
        return YES;
    
    } else {
    
        return NO;
    
    }

}

//- (BOOL)insertUserInfo {
//    
//    UserInfo *info = [UserInfo shareUserInfo];
//
//    if ([self.db open]) {
//        
//        if (![self.db executeQuery:[NSString stringWithFormat:@"insert into userinfo (userHeadUrl, userHeadImage, userID, userName, likeNum, shareNum, totalIncome, havedNum, ) values ('%@', '%@', '%@', '%@', '%d', '%d', '%f', '%d')", info.userHeadUrl, info.userHeadImage, info.userID, info.userName, info.likeNum, info.shareNum, info.totalIncome, info.havedNum]]) {
//        
//            
//            return NO;
//        
//        }
//        
//        
//        [self.db close];
//        
//        return  YES;
//    
//    } else {
//    
//        return  NO;
//    
//    }
//
//}

- (NSArray *)selectAllFromTable:(NSString *)table {

    NSMutableArray *array = [NSMutableArray array];
    
    if ([self.db open]) {
        
        FMResultSet *re =  [self.db executeQuery:[NSString stringWithFormat:@"select * from %@", table]];
        
        
        if ([table isEqualToString:@"userinfo"]) {
            
            while ([re next]) {
                
                UserInfo *userInfo = [UserInfo shareUserInfo];
                
                userInfo.userID = [re stringForColumn:@"userID"];
                userInfo.userHeadUrl = [re stringForColumn:@"userHeadUrl"];
                userInfo.userHeadImageName = [re stringForColumn:@"userHeadImageName"];
                userInfo.userName = [re stringForColumn:@"userName"];
                userInfo.likeNum = [re intForColumn:@"likeNum"];
                userInfo.shareNum = [re intForColumn:@"shareNum"];
                userInfo.totalIncome = [re doubleForColumn:@"totalIncome"];
                userInfo.havedNum = [re intForColumn:@"havedNum"];
                userInfo.discoverPageNum = [re intForColumn:@"discoverPageNum"];
                
                @try {
                    userInfo.userHeadImage = [UIImage imageNamed:userInfo.userHeadImageName];
                } @catch (NSException *exception) {
                    NSLog(@"load userHeadImage");
                }
            }
        
        
        } else if ([table isEqualToString:@"allinfo"] || [table isEqualToString:@"likeinfo"]) {
        
            while ([re next]) {
                
                InfoNetworkModel *model = [[InfoNetworkModel alloc] initWithID:[re stringForColumn:@"objectId"] GeoX:[re stringForColumn:@"GeoX"] GeoY:[re stringForColumn:@"GeoY"] askContentHide:[re stringForColumn:@"askContentHide"] askContentShow:[re stringForColumn:@"askContentShow"] askImage:[re stringForColumn:@"askImage"] askIsFree:[re stringForColumn:@"askIsFree"] askLevel:[re stringForColumn:@"askLevel"] askPosition:[re stringForColumn:@"askPosition"] askPrice:[re stringForColumn:@"askPrice"] askReason:[re stringForColumn:@"askReason"] askTagStr:[re stringForColumn:@"askTagStr"] askType:[re stringForColumn:@"askType"] buyNum:[re stringForColumn:@"buyNum"] createBy:[re stringForColumn:@"createBy"] createByName:[re stringForColumn:@"createByName"] createByUrl:[re stringForColumn:@"createByUrl"] createdAt:[re stringForColumn:@"createdAt"] likeNum:[re stringForColumn:@"likeNum"] liked:[re intForColumn:@"liked"] objectId:[re stringForColumn:@"objectId"] score:[re stringForColumn:@"score"] shopName:[re stringForColumn:@"shopName"] staus:[re stringForColumn:@"staus"] updatedAt:[re stringForColumn:@"updatedAt"]];
                
                
                //                    NSLog(@"%@", model.objectId);
                
                [array addObject:model];
                
            }
        
        
        } else if ([table isEqualToString:@"carousel"]) {
        
            while ([re next]) {
                
                CarouselDataModel *model = [[CarouselDataModel alloc] initWithCarouselClickURL:[re stringForColumn:@"carouselClickURL"] carouselImage:[re stringForColumn:@"carouselImage"] carouselName:[re stringForColumn:@"carouselName"] createdAt:[re stringForColumn:@"createdAt"] likeNum:[re intForColumn:@"likeNum"] liked:[re intForColumn:@"liked"] objectId:[re stringForColumn:@"objectId"] show:[re intForColumn:@"show"] updatedAt:[re stringForColumn:@"updatedAt"]];
                
                [array addObject:model];
                
                
            }
        
        
        }
        
        [self.db close];
        
        return array;

    
    } else {
    
        return array;
    
    }

}

- (BOOL)clearForTable:(NSString *)tableName {

    if ([self.db open]) {
    
        if ([tableName isEqualToString:@"allinfo"]) {
        
            if (![self.db executeUpdate:@"delete from allinfo"]) {
                
                NSLog(@"清空");
                return NO;
                
            }
        
        } else if ([tableName isEqualToString:@"carousel"]) {
        
            if (![self.db executeUpdate:@"delete from carousel"]) {
                
                NSLog(@"清空");
                return NO;
                
            }
        
        }
        [self.db close];
        
        return YES;
    
    } else {
    
        return NO;
    
    }

}


- (BOOL)updata:(InfoNetworkModel *)model table:(NSString *)table {


    
    return YES;


}

- (BOOL)updataUserInfo {

    if ([self.db open]) {
        UserInfo *userInfo = [UserInfo shareUserInfo];
        
        NSLog(@"%d---->updataUserInfo", userInfo.discoverPageNum);
    
        if (![self.db executeUpdate:@"insert or replace into userinfo (userID, userHeadUrl, userHeadImageName, userName, likeNum, shareNum, totalIncome, havedNum, discoverPageNum) values (?, ?, ?, ?, ?, ?, ?, ?, ?)",userInfo.userID, userInfo.userHeadUrl, userInfo.userHeadImageName, userInfo.userName, [NSNumber numberWithInt:userInfo.likeNum], [NSNumber numberWithInt:userInfo.shareNum], [NSNumber numberWithFloat:userInfo.totalIncome], [NSNumber numberWithInt:userInfo.havedNum], [NSNumber numberWithInt:userInfo.discoverPageNum]]) {
        
            NSLog(@"error");
            return NO;
       
        }
        

        return YES;
        
        
    
    } else {
    
        return NO;
    
    }

}



@end
