//
//  SendTotalSimpleView.m
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SendTotalSimpleView.h"
#import "DrawUtils.h"
#import "Config.h"

@implementation SendTotalSimpleView

- (instancetype)initWithFrame:(CGRect)frame iconImageNamed:(NSString *)imageName finishedIconImageName:(NSString *)finishImageName lineColor:(UIColor *)color mainView:(UIView *)mainView
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.finishLineColor = color;
        self.imageFinish = [UIImage imageNamed:finishImageName];
        
        self.icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        self.icon.frame = CGRectMake(0, 0, 40, 40);
        self.icon.center = CGPointMake(50, 20);
        
        self.line = [DrawUtils drawLine:CGRectMake(49.25, 40, 1.5, self.frame.size.height - 40) lineColor:HQ_RGBA(230, 230, 230, 1)];
        
        self.mainView = [[UIView alloc] initWithFrame:CGRectMake(80, 0, SCREEN_WIDTH - 80, self.frame.size.height)];
        self.mainView.backgroundColor = [UIColor clearColor];
        
        [self.mainView addSubview:mainView];
        [self addSubview:self.icon];
        [self addSubview:self.line];
        [self addSubview:self.mainView];
    }
    return self;
}
- (void)setFrame:(CGRect)frame {

    [super setFrame:frame];
    
    if(self.height != frame.size.height) {
    
        self.height = frame.size.height;
    
    }
    
    
    CGRect lineFram = self.line.frame;
    if (frame.size.height < self.icon.frame.size.height) {
    
        lineFram.size.height = 0;
    
    } else {
    
        lineFram.size.height = frame.size.height - self.icon.frame.size.height;
        
    }
    self.line.frame = lineFram;


}


@end
