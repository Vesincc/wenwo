//
//  SendReasonView.h
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SendReasonView;

@protocol SendReasonViewDelegate <NSObject>

- (void)sendReasonView:(SendReasonView *)reasonView textView:(UITextView *)textView value:(NSString *)value;

@end

@interface SendReasonView : UIView

@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, weak) id <SendReasonViewDelegate> delegate;

@end
