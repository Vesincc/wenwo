//
//  SendTotalViewObserver.m
//  wenwobei
//
//  Created by HanQi on 16/8/15.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SendTotalViewObserver.h"
#import "SendTotalSimpleView.h"
#import "SendTotalView.h"
#import "Config.h"

@implementation SendTotalViewObserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {

    SendTotalSimpleView *view = object;
    
    SendTotalView *totalView = (__bridge SendTotalView *)(context);
    
    NSLog(@"------ %@ 在监听 ------", self.name);
    NSLog(@"change: %@", change);
    NSLog(@"object: %@", view.viewType);

    CGRect frame = totalView.selectTypeView.frame;
    frame.origin.y = 30 + totalView.selectImageView.frame.size.height;
    totalView.selectTypeView.frame = frame;
    
    frame = totalView.selectReasonView.frame;
    frame.origin.y = 30 + totalView.selectImageView.frame.size.height + totalView.selectTypeView.frame.size.height;
    totalView.selectReasonView.frame = frame;
    
    frame = totalView.selectDetailView.frame;
    frame.origin.y = 30 + totalView.selectImageView.frame.size.height + totalView.selectTypeView.frame.size.height + totalView.selectReasonView.frame.size.height;
    totalView.selectDetailView.frame = frame;

    frame = totalView.selectShopNameView.frame;
    frame.origin.y = 30 + totalView.selectImageView.frame.size.height + totalView.selectTypeView.frame.size.height + totalView.selectReasonView.frame.size.height + totalView.selectDetailView.frame.size.height;
    totalView.selectShopNameView.frame = frame;
    
    frame = totalView.selectPositionView.frame;
    frame.origin.y = 30 + totalView.selectImageView.frame.size.height + totalView.selectTypeView.frame.size.height + totalView.selectReasonView.frame.size.height + totalView.selectDetailView.frame.size.height + totalView.selectShopNameView.frame.size.height;
    totalView.selectPositionView.frame = frame;
    
    frame = totalView.selectPriceView.frame;
    frame.origin.y = 30 + totalView.selectImageView.frame.size.height + totalView.selectTypeView.frame.size.height + totalView.selectReasonView.frame.size.height + totalView.selectDetailView.frame.size.height + totalView.selectShopNameView.frame.size.height + totalView.selectPositionView.frame.size.height;
    totalView.selectPriceView.frame = frame;
    
    totalView.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 30 + totalView.selectImageView.frame.size.height + totalView.selectTypeView.frame.size.height + totalView.selectReasonView.frame.size.height + totalView.selectDetailView.frame.size.height + totalView.selectShopNameView.frame.size.height + totalView.selectPositionView.frame.size.height + totalView.selectPriceView.frame.size.height + 30);

}

@end
