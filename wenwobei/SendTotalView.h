//
//  SendTotalView.h
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SendTotalSimpleView.h"

@interface SendTotalView : UIView

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) SendTotalSimpleView *selectImageView;
@property (nonatomic, strong) SendTotalSimpleView *selectTypeView;
@property (nonatomic, strong) SendTotalSimpleView *selectReasonView;
@property (nonatomic, strong) SendTotalSimpleView *selectDetailView;
@property (nonatomic, strong) SendTotalSimpleView *selectShopNameView;
@property (nonatomic, strong) SendTotalSimpleView *selectPositionView;
@property (nonatomic, strong) SendTotalSimpleView *selectPriceView;

@end
