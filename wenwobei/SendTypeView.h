//
//  SendTypeView.h
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SendTypeView;

@protocol SendTypeViewDelegate <NSObject>

- (void)sendTypeView:(SendTypeView *)sendTypeView textField:(UITextField *)textField value:(NSString *)value;

@end

@interface SendTypeView : UIView

- (void)endTextFieldEdit;

@property (nonatomic, strong) UITextField *type;

@property (nonatomic, weak) id <SendTypeViewDelegate> delegate;

@end
