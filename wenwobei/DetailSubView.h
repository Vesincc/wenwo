//
//  DetailSubView.h
//  wenwobei
//
//  Created by HanQi on 16/9/6.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailSubView : UIView

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIView *mainView;

@property (nonatomic, strong) UILabel *detailLable;

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title detail:(NSString *)detail other:(UIView *)view;

@end
