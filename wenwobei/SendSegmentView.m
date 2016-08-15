//
//  SendSegmentView.m
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SendSegmentView.h"
#import "Config.h"

@interface SendSegmentView()

@end

@implementation SendSegmentView

- (instancetype)initWithFrame:(CGRect)frame index:(int)index
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = HQ_RGBA(250, 250, 250, 0.9);
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
    }
    return self;
}
@end
