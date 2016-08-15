//
//  SimpleTableViewCell.h
//  wenwobei
//
//  Created by HanQi on 16/8/9.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimpleTableViewCell;

@protocol SimpleTableViewCellDelegate <NSObject>

- (void)simpleTableViewCell:(SimpleTableViewCell *)cell likeViewDidClick:(UIView *)likeView;

@end

@interface SimpleTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView identifier:(NSString *)identifier;

- (instancetype)initWithReusedID:(NSString *)ID;

@property (nonatomic, copy) NSString *reusedID;
@property (nonatomic, strong) SimpleTableViewCell *cellData;
@property (nonatomic, weak) id <SimpleTableViewCellDelegate> delegate;

@property (nonatomic, strong) UIImageView *userHeadImageView;

@end
