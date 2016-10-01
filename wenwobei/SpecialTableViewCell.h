//
//  SpecialTableViewCell.h
//  wenwobei
//
//  Created by HanQi on 16/9/24.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CarouselDataModel;
@interface SpecialTableViewCell : UITableViewCell

@property (nonatomic, strong) CarouselDataModel *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView identifier:(NSString *)identifier;

@end
