//
//  SendShopNameView.h
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SendShopNameView;

@protocol SendShopNameViewDelegate <NSObject>

- (void)sendShopNameView:(SendShopNameView *)view textField:(UITextField *)textField didEndEditValue:(NSString *)value;

@end

@interface SendShopNameView : UIView

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, weak) id <SendShopNameViewDelegate> delegate;

@end
