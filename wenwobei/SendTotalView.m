//
//  SendTotalView.m
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SendTotalView.h"
#import "Config.h"
#import <Foundation/Foundation.h>
#import "SendTotalViewObserver.h"
#import "ImageObserver.h"

@interface SendTotalView()

@property (nonatomic, strong) SendTotalViewObserver *observer;
@property (nonatomic, strong) ImageObserver *imageObserver;

@end

@implementation SendTotalView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self scrollView];
//        self.image = [[UIImage alloc] init];
        
        self.observer = [[SendTotalViewObserver alloc] init];
        self.observer.name = @"SendTotalView";
        
        [self.selectImageView addObserver:self.observer forKeyPath:@"height" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)(self)];
        [self.selectTypeView addObserver:self.observer forKeyPath:@"height" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)(self)];
        [self.selectReasonView addObserver:self.observer forKeyPath:@"height" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)(self)];
        [self.selectDetailView addObserver:self.observer forKeyPath:@"height" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)(self)];
        [self.selectShopNameView addObserver:self.observer forKeyPath:@"height" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)(self)];
        [self.selectPositionView addObserver:self.observer forKeyPath:@"height" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)(self)];
        [self.selectPriceView addObserver:self.observer forKeyPath:@"height" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)(self)];
        
        
        self.imageObserver = [[ImageObserver alloc] init];
        self.imageObserver.name = @"image";
        
        [self addObserver:self.imageObserver forKeyPath:@"image" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)(self)];
        
//        CGRect imageFrame = self.selectImageView.frame;
//        imageFrame.size.height = 110;
//        self.selectImageView.frame = imageFrame;
        
        
        
    }
    return self;
}

- (void)dealloc {
    
//    NSLog(@"%@", self.selectImageView.observationInfo);
    
    [self.selectImageView removeObserver:self.observer forKeyPath:@"height"];
    [self.selectTypeView removeObserver:self.observer forKeyPath:@"height"];
    [self.selectReasonView removeObserver:self.observer forKeyPath:@"height"];
    [self.selectDetailView removeObserver:self.observer forKeyPath:@"height"];
    [self.selectShopNameView removeObserver:self.observer forKeyPath:@"height"];
    [self.selectPositionView removeObserver:self.observer forKeyPath:@"height"];
    [self.selectPriceView removeObserver:self.observer forKeyPath:@"height"];
    
    [self removeObserver:self.imageObserver forKeyPath:@"image"];
    
}

- (UIScrollView *)scrollView {

    if (!_scrollView) {
    
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, SCREEN_HEIGHT - 60)];
        _scrollView.bounces = NO;
        
        [self selectImageView];
        
        [self selectTypeView];
        
        [self selectReasonView];
        
        [self selectDetailView];
        
        [self selectShopNameView];
        
        [self selectPositionView];
        
        [self selectPriceView];
        
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 30 + self.selectImageView.frame.size.height + self.selectTypeView.frame.size.height + self.selectReasonView.frame.size.height + self.selectDetailView.frame.size.height + self.selectShopNameView.frame.size.height + self.selectPositionView.frame.size.height + self.selectPriceView.frame.size.height + 30);
        
        
        
        [self addSubview:_scrollView];
    
    }
    return _scrollView;


}

- (SendTotalSimpleView *)selectImageView {

    if (!_selectImageView) {
    
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 80 - 40, 40)];
        titleLable.text = @"图片";
        titleLable.font = [UIFont systemFontOfSize:19];
        
        self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check_image"]];
        self.imageView.frame = CGRectMake(10, 40, SCREEN_WIDTH - 80 - 40, (SCREEN_WIDTH - 80 - 40) * self.imageView.image.size.height / self.imageView.image.size.width);
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.layer.masksToBounds = YES;
        self.imageView.layer.borderColor = HQ_RGBA(230, 230, 230, 1).CGColor;
        self.imageView.layer.borderWidth = 1;
        self.imageView.layer.cornerRadius = 10;
        
        _selectImageView = [[SendTotalSimpleView alloc] initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, titleLable.frame.size.height + self.imageView.frame.size.height) iconImageNamed:@"photo-1" finishedIconImageName:@"photo-2" lineColor:HQ_RGBA(79, 175, 203, 1) mainView:titleLable];
        _selectImageView.viewType = @"image";
        [_selectImageView.mainView addSubview:self.imageView];
        _selectImageView.tag = 1;
        
        UITapGestureRecognizer *geasture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewDidClick:)];
        [_selectImageView addGestureRecognizer:geasture];
        
        [self.scrollView addSubview:_selectImageView];
    
    }
    return _selectImageView;


}

- (SendTotalSimpleView *)selectTypeView {

    if (!_selectTypeView) {
    
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 80 - 40, 40)];
        titleLable.text = @"美食类别";
        titleLable.font = [UIFont systemFontOfSize:19];
        
        UILabel *contentLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, SCREEN_WIDTH - 80 - 40, 50)];
        contentLable.text = @"请填写类别";
        contentLable.textColor = HQ_RGBA(150, 150, 150, 1);
        
        _selectTypeView = [[SendTotalSimpleView alloc] initWithFrame:CGRectMake(0, 30 + self.selectImageView.frame.size.height, SCREEN_WIDTH, titleLable.frame.size.height + contentLable.frame.size.height) iconImageNamed:@"tag-1" finishedIconImageName:@"tag-2" lineColor:HQ_RGBA(78, 116, 216, 1) mainView:titleLable];
        [_selectTypeView.mainView addSubview:contentLable];
        _selectTypeView.viewType = @"type";
        _selectTypeView.tag = 2;
        
        UITapGestureRecognizer *geasture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewDidClick:)];
        [_selectTypeView addGestureRecognizer:geasture];
        
        [self.scrollView addSubview:_selectTypeView];
    
    }
    
    return _selectTypeView;


}

- (SendTotalSimpleView *)selectReasonView {

    if (!_selectReasonView) {
    
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 80 - 20, 40)];
        titleLable.text = @"推荐理由";
        titleLable.font = [UIFont systemFontOfSize:19];
        
        UILabel *contentLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, SCREEN_WIDTH - 80 - 40, 50)];
        contentLable.text = @"请填写推荐理由";
        contentLable.textColor = HQ_RGBA(150, 150, 150, 1);
        
        _selectReasonView = [[SendTotalSimpleView alloc] initWithFrame:CGRectMake(0, 30 + self.selectImageView.frame.size.height + self.selectTypeView.frame.size.height, SCREEN_WIDTH, titleLable.frame.size.height + contentLable.frame.size.height) iconImageNamed:@"reason-1" finishedIconImageName:@"reason-2" lineColor:HQ_RGBA(205, 74, 75, 1) mainView:titleLable];
        [_selectReasonView.mainView addSubview:contentLable];
        _selectReasonView.tag = 3;
        _selectReasonView.viewType = @"reason";
        
        UITapGestureRecognizer *geasture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewDidClick:)];
        [_selectReasonView addGestureRecognizer:geasture];
        
        [self.scrollView addSubview:_selectReasonView];
    
    }
    return _selectReasonView;

}

- (SendTotalSimpleView *)selectDetailView {

    if (!_selectDetailView) {
    
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 80 - 20, 40)];
        titleLable.text = @"美食详情";
        titleLable.font = [UIFont systemFontOfSize:19];
        
        UILabel *contentLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, SCREEN_WIDTH - 80 - 40, 50)];
        contentLable.text = @"请填写美食详情";
        contentLable.textColor = HQ_RGBA(150, 150, 150, 1);
        
        _selectDetailView = [[SendTotalSimpleView alloc] initWithFrame:CGRectMake(0, 30 + self.selectImageView.frame.size.height + self.selectTypeView.frame.size.height + self.selectReasonView.frame.size.height, SCREEN_WIDTH, titleLable.frame.size.height + contentLable.frame.size.height) iconImageNamed:@"detail-1" finishedIconImageName:@"detail-2" lineColor:HQ_RGBA(225, 185, 39, 1) mainView:titleLable];
        [_selectDetailView.mainView addSubview:contentLable];
        _selectDetailView.tag = 4;
        _selectDetailView.viewType = @"detail";
        
        UITapGestureRecognizer *geasture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewDidClick:)];
        [_selectDetailView addGestureRecognizer:geasture];
        
        [self.scrollView addSubview:_selectDetailView];
        
    }
    return _selectDetailView;

}

- (SendTotalSimpleView *)selectShopNameView {

    if (!_selectShopNameView) {
    
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 80 - 20, 40)];
        titleLable.text = @"店名";
        titleLable.font = [UIFont systemFontOfSize:19];
        
        UILabel *contentLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, SCREEN_WIDTH - 80 - 40, 50)];
        contentLable.text = @"请填写店名";
        contentLable.textColor = HQ_RGBA(150, 150, 150, 1);
        
        _selectShopNameView = [[SendTotalSimpleView alloc] initWithFrame:CGRectMake(0, 30 + self.selectImageView.frame.size.height + self.selectTypeView.frame.size.height + self.selectReasonView.frame.size.height + self.selectDetailView.frame.size.height, SCREEN_WIDTH, titleLable.frame.size.height + contentLable.frame.size.height) iconImageNamed:@"name-1" finishedIconImageName:@"name-2" lineColor:HQ_RGBA(78, 116, 216, 1) mainView:titleLable];
        [_selectShopNameView.mainView addSubview:contentLable];
        _selectShopNameView.viewType = @"shopName";
        _selectShopNameView.tag = 5;
        UITapGestureRecognizer *geasture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewDidClick:)];
        [_selectShopNameView addGestureRecognizer:geasture];
        
        [self.scrollView addSubview:_selectShopNameView];
    
    }
    
    return _selectShopNameView;


}

- (SendTotalSimpleView *)selectPositionView {

    if (!_selectPositionView) {
    
        
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 80 - 20, 40)];
        titleLable.text = @"地址";
        titleLable.font = [UIFont systemFontOfSize:19];
        
        UILabel *contentLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, SCREEN_WIDTH - 80 - 40, 50)];
        contentLable.text = @"请填写美食地址并在地图上标注";
        contentLable.textColor = HQ_RGBA(150, 150, 150, 1);
        
        _selectPositionView = [[SendTotalSimpleView alloc] initWithFrame:CGRectMake(0, 30 + self.selectImageView.frame.size.height + self.selectTypeView.frame.size.height + self.selectReasonView.frame.size.height + self.selectDetailView.frame.size.height + self.selectShopNameView.frame.size.height, SCREEN_WIDTH, titleLable.frame.size.height + contentLable.frame.size.height) iconImageNamed:@"address-1" finishedIconImageName:@"address-2" lineColor:HQ_RGBA(95, 172, 50, 1) mainView:titleLable];
        [_selectPositionView.mainView addSubview:contentLable];
        _selectPositionView.viewType = @"position";
        _selectPositionView.tag = 6;
        UITapGestureRecognizer *geasture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewDidClick:)];
        [_selectPositionView addGestureRecognizer:geasture];
        
        [self.scrollView addSubview:_selectPositionView];
    
    }
    
    return _selectPositionView;


}

- (SendTotalSimpleView *)selectPriceView {

    if (!_selectPriceView) {
    
        
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 80 - 20, 40)];
        titleLable.text = @"信息价格";
        titleLable.font = [UIFont systemFontOfSize:19];
        
        UILabel *contentLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, SCREEN_WIDTH - 80 - 40, 50)];
        contentLable.text = @"请填写查看这条信息的价格";
        contentLable.textColor = HQ_RGBA(150, 150, 150, 1);
        contentLable.userInteractionEnabled = NO;
        
        _selectPriceView = [[SendTotalSimpleView alloc] initWithFrame:CGRectMake(0, 30 + self.selectImageView.frame.size.height + self.selectTypeView.frame.size.height + self.selectReasonView.frame.size.height + self.selectDetailView.frame.size.height + self.selectShopNameView.frame.size.height + self.selectPositionView.frame.size.height, SCREEN_WIDTH, titleLable.frame.size.height + contentLable.frame.size.height) iconImageNamed:@"price-1" finishedIconImageName:@"price-2" lineColor:HQ_RGBA(225, 117, 49, 1) mainView:titleLable];
        [_selectPriceView.mainView addSubview:contentLable];
//        _selectPriceView.backgroundColor = [UIColor redColor];
        _selectPriceView.viewType = @"price";
        _selectPriceView.tag = 7;
        UITapGestureRecognizer *geasture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewDidClick:)];
        [_selectPriceView addGestureRecognizer:geasture];
        
        _selectPriceView.line.backgroundColor = [UIColor clearColor];
        [self.scrollView addSubview:_selectPriceView];
    
    }
    
    return _selectPriceView;


}

- (void)viewDidClick:(UITapGestureRecognizer *)gesture {
    
    NSLog(@"1");

    if ([self.delegate respondsToSelector:@selector(sendTotalView:viewDidClick:viewTag:)]) {
    
        [self.delegate sendTotalView:self viewDidClick:(SendTotalSimpleView *)gesture.view viewTag:gesture.view.tag];
    
    }


}

@end
