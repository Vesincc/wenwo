//
//  SendTotalSimpleView.h
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendTotalSimpleView : UIView

@property (nonatomic, assign) CGFloat height;
@property (nonatomic, strong) NSString *viewType;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIView *mainView;

@property (nonatomic, strong) UIColor *finishLineColor;
@property (nonatomic, copy) NSString *finishImageName;
@property (nonatomic, strong) UIImage *imageFinish;
@property (nonatomic, copy) NSString *defaultImageName;
@property (nonatomic, strong) UIColor *defaultLineColor;

- (instancetype)initWithFrame:(CGRect)frame iconImageNamed:(NSString *)imageName finishedIconImageName:(NSString *)finishImageName lineColor:(UIColor *)color mainView:(UIView *)mainView;

@end
