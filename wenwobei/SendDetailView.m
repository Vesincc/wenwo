//
//  SendDetailView.m
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SendDetailView.h"
#import "Config.h"

@interface SendDetailView() <UITextViewDelegate>

@property (nonatomic, strong) UILabel *textViewPlaceholder;

@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;

@end

@implementation SendDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.placeholderColor = HQ_RGBA(200, 200, 200, 1);
        self.placeholder = @"详细的介绍可能提高大家的付费意愿，比如美食的人均消费、环境、口味等，但千万别暴露了店名和地址，你懂的！";
        
        UILabel *note = [[UILabel alloc] initWithFrame:CGRectMake(40, 100, SCREEN_WIDTH - 80, 30)];
        note.text = @"请告诉我们一些详细信息:";
        note.textColor = HQ_RGBA(200, 200, 200, 1);
        
        self.textViewPlaceholder = [[UILabel alloc] initWithFrame:CGRectMake(2, 0, SCREEN_WIDTH - 80 - 4, 70)];
        self.textViewPlaceholder.numberOfLines = 0;
        self.textViewPlaceholder.textColor = self.placeholderColor;
        self.textViewPlaceholder.text = self.placeholder;
        self.textViewPlaceholder.textAlignment = NSTextAlignmentCenter;
        
        
        
        self.textView = [[UITextView alloc] initWithFrame:CGRectMake(40, 140, SCREEN_WIDTH - 80, 150)];
        self.textView.layer.borderColor = HQ_RGBA(230, 230, 230, 1).CGColor;
        self.textView.layer.borderWidth = 1;
        self.textView.layer.cornerRadius = 5;
        self.textView.layer.masksToBounds = YES;
        self.textView.font = [UIFont systemFontOfSize:15];
        self.textView.delegate = self;
        
        [self.textView addSubview:self.textViewPlaceholder];
    
        [self addSubview:self.textView];
        
        [self addSubview:note];
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textView)];
        
        [self addGestureRecognizer:gesture];
        
    }
    return self;
}

- (void)textViewEnd {

    [self.textView endEditing:YES];

}

- (void)textViewDidBeginEditing:(UITextView *)textView {

    [self.textViewPlaceholder removeFromSuperview];

}

- (void)textViewDidEndEditing:(UITextView *)textView {


    if (textView.text.length == 0) {
    
        [self.textView addSubview:self.textViewPlaceholder];
    
    }
    
    if ([self.delegate respondsToSelector:@selector(sendDetailView:textView:didEndEditValue:)]) {
    
        [self.delegate sendDetailView:self textView:self.textView didEndEditValue:self.textView.text];
    
    }

}

@end
