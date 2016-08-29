//
//  SendTypeView.m
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SendTypeView.h"
#import "Config.h"
#import "DrawUtils.h"

@implementation SendTypeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.type = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, SCREEN_WIDTH - 100, 50)];
//        self.type.backgroundColor = [UIColor redColor];
        self.type.placeholder = @"请选择或输入美食的类别";
        self.type.textAlignment = NSTextAlignmentCenter;
        
        UIView *line = [DrawUtils drawLine:CGRectMake(50, 140, SCREEN_WIDTH - 100, 1) lineColor:HQ_RGBA(230, 230, 230, 2)];
        
        [self addSubview:line];
        
        [self addSubview:self.type];
        
    }
    return self;
}

@end
