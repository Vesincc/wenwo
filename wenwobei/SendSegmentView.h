//
//  SendSegmentView.h
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SendSegmentView;
@protocol SendSegmentViewDelegate <NSObject>

- (void)sendSegmentView:(SendSegmentView *)segment segmentDidClick:(UIButton *)button clickIndex:(int)index;

@end

@interface SendSegmentView : UIView

- (instancetype)initWithFrame:(CGRect)frame index:(int)index;
- (void)addSelected:(int)index;

@property (nonatomic, weak) id <SendSegmentViewDelegate> delegate;

@end
