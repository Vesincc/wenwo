//
//  SendPriceView.h
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SendPriceView;

@protocol SendPriceViewDelegate <NSObject>

- (void)sendPriceView:(SendPriceView *)view textField:(UITextField *)textField didEndEditValue:(NSString *)value;

@end

@interface SendPriceView : UIView

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, weak) id <SendPriceViewDelegate> delegate;
@end
