//
//  SendReasonView.m
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SendReasonView.h"
#import "Config.h"

@implementation SendReasonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *note = [[UILabel alloc] initWithFrame:CGRectMake(40, 100, SCREEN_WIDTH - 80, 30)];
        note.text = @"给一个让大家相信你的理由吧:";
        note.textColor = HQ_RGBA(200, 200, 200, 1);
        
        
        self.textView = [[UITextView alloc] initWithFrame:CGRectMake(40, 140, SCREEN_WIDTH - 80, 150)];
        self.textView.layer.borderColor = HQ_RGBA(230, 230, 230, 1).CGColor;
        self.textView.layer.borderWidth = 1;
        self.textView.layer.cornerRadius = 5;
        self.textView.layer.masksToBounds = YES;
        self.textView.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.textView];
        
        [self addSubview:note];
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endTextEdit)];
        [self addGestureRecognizer:gesture];
        
    }
    return self;
}

- (void)endTextEdit {

    [self.textView endEditing:YES];
    
    if ([self.delegate respondsToSelector:@selector(sendReasonView:textView:value:)]) {
    
        [self.delegate sendReasonView:self textView:self.textView value:self.textView.text];
    
    }

}

@end
