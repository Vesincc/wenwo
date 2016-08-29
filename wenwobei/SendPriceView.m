//
//  SendPriceView.m
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SendPriceView.h"
#import "Config.h"

@implementation SendPriceView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *note = [[UILabel alloc] initWithFrame:CGRectMake(40, 100, SCREEN_WIDTH - 80, 30)];
        note.text = @"请填写这条信息的查看价格吧:";
        note.textColor = HQ_RGBA(200, 200, 200, 1);
        
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(40, 140, SCREEN_WIDTH - 80, 40)];
        self.textField.placeholder = @"价格设置范围是0.0-5.0元";
        self.textField.layer.borderColor = HQ_RGBA(230, 230, 230, 1).CGColor;
        self.textField.layer.borderWidth = 1;
        self.textField.layer.cornerRadius = 5;
        self.textField.layer.masksToBounds = YES;
        
        
        [self addSubview:note];
        [self addSubview:self.textField];
        
    }
    return self;
}

@end
