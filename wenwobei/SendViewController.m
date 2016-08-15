//
//  SendViewController.m
//  wenwobei
//
//  Created by HanQi on 16/8/9.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SendViewController.h"
#import "Config.h"
#import "SendTotalView.h"
#import "SendSegmentView.h"
#import "SendTypeView.h"

@interface SendViewController()

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIView *titleBar;
@property (nonatomic, strong) SendTotalView *sendTotalView;
@property (nonatomic, strong) SendSegmentView *segment;
@property (nonatomic, strong) SendTypeView *sendTypeView;


@end

@implementation SendViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self scrollView];
    
    [self titleBar];
    
    [self segment];
    
    [self sendTypeView];

}

- (UIScrollView *)scrollView {

    if (!_scrollView) {
    
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 7, SCREEN_HEIGHT);
        
        [self sendTotalView];
        
        [self.view addSubview:_scrollView];
        
        
    
    }

    return _scrollView;

}

- (SendTotalView *)sendTotalView {

    if (!_sendTotalView) {
    
        _sendTotalView = [[SendTotalView alloc] init];
        _sendTotalView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 60);
        
        
//        CGRect imageFrame = _sendTotalView.selectImageView.frame;
//        imageFrame.size.height = 100;
//        _sendTotalView.selectImageView.frame = imageFrame;
        
//        _sendTotalView.selectImageView.line.backgroundColor = _sendTotalView.selectImageView.finishLineColor;
//        _sendTotalView.selectImageView.icon.image = _sendTotalView.selectImageView.imageFinish;
        
        [self.scrollView addSubview:_sendTotalView];
        
    
    }
    return _sendTotalView;

}

- (UIView *)titleBar {

    if (!_titleBar) {
        
        _titleBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
        _titleBar.backgroundColor = HQ_RGBA(248, 243, 243, 1);
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 40)];
        titleLable.center = CGPointMake(SCREEN_WIDTH/2, 40);
        titleLable.text = @"分享";
        titleLable.font = [UIFont systemFontOfSize:20 weight:0.1];
        titleLable.textAlignment = NSTextAlignmentCenter;
        titleLable.textColor = TITLE_COLER;
        UIView *border = [[UIView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, 0.5)];
        border.backgroundColor = HQ_RGBA(200, 200, 200, 1);
        [_titleBar addSubview:border];
        
        [_titleBar addSubview:titleLable];
        [self.view addSubview:_titleBar];
    
    }
    return _titleBar;

}

- (SendSegmentView *)segment {

    if (!_segment) {
    
        _segment = [[SendSegmentView alloc] initWithFrame:CGRectMake(20, 60 + 20, SCREEN_WIDTH - 40, 60) index:0];
        
        
        [self.view addSubview:_segment];
    
    }


    return _segment;

}

- (SendTypeView *)sendTypeView {

    if (!_sendTypeView) {
    
        _sendTypeView = [[SendTypeView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 1, 60, SCREEN_WIDTH, SCREEN_HEIGHT - 60)];
        _sendTypeView.backgroundColor = [UIColor cyanColor];
        
        [self.scrollView addSubview:_sendTypeView];
    
    }
    
    
    return _sendTypeView;



}

@end
