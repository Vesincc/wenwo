//
//  DrawUtils.h
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawUtils : NSObject

+ (UIView *)drawLine:(CGRect)rect lineColor:(UIColor *)color;

+ (UIView *)drawPoint:(CGFloat)radius center:(CGPoint)center pointColor:(UIColor *)color;
@end
