//
//  DataBase.h
//  wenwobei
//
//  Created by HanQi on 16/9/7.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
@class InfoNetworkModel;
@interface DataBase : NSObject

@property (nonatomic, strong) FMDatabase *db;

+ (instancetype)shareDataBase;

- (BOOL)insert:(id)model talbeName:(NSString *)table;

- (BOOL)insertUserInfo;

- (NSArray *)selectAllFromTable:(NSString *)table;

- (BOOL)updata:(id)model table:(NSString *)table;

- (BOOL)insertArray:(NSArray *)models tableName: (NSString *)table;

- (BOOL)clearForTable:(NSString *)tableName;

- (BOOL)updataUserInfo;

@end
