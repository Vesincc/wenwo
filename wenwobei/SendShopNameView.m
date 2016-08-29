//
//  SendShopNameView.m
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SendShopNameView.h"
#import "Config.h"

@implementation SendShopNameView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *note = [[UILabel alloc] initWithFrame:CGRectMake(40, 100, SCREEN_WIDTH - 80, 30)];
        note.text = @"请输入这家店的名字:";
        note.textColor = HQ_RGBA(200, 200, 200, 1);
        
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(40, 140, SCREEN_WIDTH - 80, 40)];
        self.textField.placeholder = @"这很重要，别写错了";
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
