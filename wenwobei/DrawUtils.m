//
//  DrawUtils.m
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "DrawUtils.h"

@implementation DrawUtils

+ (UIView *)drawLine:(CGRect)rect lineColor:(UIColor *)color {

    UIView *view = [[UIView alloc] init];
    view.frame = rect;
    view.backgroundColor = color;
    
    return view;
}

+ (UIView *)drawPoint:(CGFloat)radius center:(CGPoint)center pointColor:(UIColor *)color {

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2*radius, 2*radius)];
    view.center = center;
    view.layer.cornerRadius = radius;
    view.layer.masksToBounds = YES;
    view.backgroundColor = color;
    
    return view;

}


@end
