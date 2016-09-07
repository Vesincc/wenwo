//
//  SendDetailView.h
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SendDetailView;

@protocol SendDetailViewDelegate <NSObject>

- (void)sendDetailView:(SendDetailView *)view textView:(UITextView *)textView didEndEditValue:(NSString *)value;

@end

@interface SendDetailView : UIView

@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, weak) id <SendDetailViewDelegate> delegate;

@end
