//
//  ImageTableViewCell.h
//  wenwobei
//
//  Created by HanQi on 16/9/19.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SimpleTableViewCellModel;
@interface ImageTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *photoImageView;
@property (nonatomic, strong) UIImageView *userHeadImageView;

@property (nonatomic, strong) ImageTableViewCell *cellData;

+ (instancetype)cellWithTableView:(UITableView *)tableView identifier:(NSString *)identifier cellData:(SimpleTableViewCellModel *)cellData;

- (instancetype)initWithReusedID:(NSString *)ID cellData:(SimpleTableViewCellModel *)cellData;

@end
