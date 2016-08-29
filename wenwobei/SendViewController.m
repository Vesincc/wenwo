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
#import "SimpleTableViewCellModel.h"
#import "SendDetailView.h"
#import "SendReasonView.h"
#import "SendShopNameView.h"
#import "SendPositionView.h"
#import "SendPriceView.h"
#import "SendDataObserver.h"

@interface SendViewController() <SendSegmentViewDelegate, UIScrollViewDelegate, SendTotalViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIView *titleBar;
@property (nonatomic, strong) UIView *footerView;
@property (nonatomic, strong) SendTotalView *sendTotalView;
@property (nonatomic, strong) SendSegmentView *segment;
@property (nonatomic, strong) SendTypeView *sendTypeView;

@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UIButton *finishButton;

@property (nonatomic, strong) SendDetailView *sendDetailView;
@property (nonatomic, strong) SendReasonView *sendReasonView;
@property (nonatomic, strong) SendShopNameView *sendShopNameView;
@property (nonatomic, strong) SendPriceView *sendPriceView;
@property (nonatomic, strong) SendPositionView *sendPositionView;

@property (nonatomic, strong) SimpleTableViewCellModel *sendData;
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) SendDataObserver *imageDataObserver;
@property (nonatomic, strong) SendDataObserver *typeDataObserver;
@property (nonatomic, strong) SendDataObserver *reasonDataObserver;
@property (nonatomic, strong) SendDataObserver *detailDataObserver;
@property (nonatomic, strong) SendDataObserver *shopNameDataObserver;
@property (nonatomic, strong) SendDataObserver *positionDataObserver;
@property (nonatomic, strong) SendDataObserver *positionXDataObserver;
@property (nonatomic, strong) SendDataObserver *positionYDataObserver;
@property (nonatomic, strong) SendDataObserver *priceDataObserver;

@end

@implementation SendViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self scrollView];
    
    [self titleBar];
    
    [self segment];
    
    [self sendTypeView];
    
    [self footerView];
    
    [self sendDetailView];
    
    [self sendReasonView];
    
    [self sendShopNameView];
    
    [self sendPriceView];
    
    [self sendPositionView];
    
    [self observerInit];
    

}

- (void)observerInit {

    self.sendData = [[SimpleTableViewCellModel alloc] init];
    
    self.imageDataObserver = [[SendDataObserver alloc] init];
    self.imageDataObserver.name = @"image";
    
    [self addObserver:self.imageDataObserver forKeyPath:@"image" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)(self.sendTotalView)];
    
    
    self.typeDataObserver = [[SendDataObserver alloc] init];
    self.typeDataObserver.name = @"type";
    [self.sendData addObserver:self.typeDataObserver forKeyPath:@"askTag" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)(self.sendTotalView)];
    
    self.reasonDataObserver = [[SendDataObserver alloc] init];
    self.reasonDataObserver.name = @"reason";
    [self.sendData addObserver:self.reasonDataObserver forKeyPath:@"askReason" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)(self.sendTotalView)];
    
    self.detailDataObserver = [[SendDataObserver alloc] init];
    self.detailDataObserver.name = @"detail";
    [self.sendData addObserver:self.detailDataObserver forKeyPath:@"askContentShowDetail" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)(self.sendTotalView)];
    
    self.shopNameDataObserver = [[SendDataObserver alloc] init];
    self.shopNameDataObserver.name = @"shopName";
    [self.sendData addObserver:self.shopNameDataObserver forKeyPath:@"shopName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)(self.sendTotalView)];
    
    self.positionXDataObserver = [[SendDataObserver alloc] init];
    self.positionXDataObserver.name = @"positionX";
    [self.sendData addObserver:self.positionXDataObserver forKeyPath:@"GeoX" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)(self.sendTotalView)];
    self.positionYDataObserver = [[SendDataObserver alloc] init];
    self.positionYDataObserver.name = @"positionY";
    [self.sendData addObserver:self.positionYDataObserver forKeyPath:@"GeoY" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)(self.sendTotalView)];
    
    self.priceDataObserver = [[SendDataObserver alloc] init];
    self.priceDataObserver.name = @"price";
    [self.sendData addObserver:self.priceDataObserver forKeyPath:@"askPrice" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)(self.sendTotalView)];


}

- (void)dealloc {

    [self removeObserver:self.imageDataObserver forKeyPath:@"image"];
    [self.sendData removeObserver:self.typeDataObserver forKeyPath:@"askTag"];
    [self.sendData removeObserver:self.reasonDataObserver forKeyPath:@"askReason"];
    [self.sendData removeObserver:self.detailDataObserver forKeyPath:@"askContentShowDetail"];
    [self.sendData removeObserver:self.shopNameDataObserver forKeyPath:@"shopName"];
    [self.sendData removeObserver:self.positionXDataObserver forKeyPath:@"GeoX"];
    [self.sendData removeObserver:self.positionYDataObserver forKeyPath:@"GeoY"];
    [self.sendData removeObserver:self.priceDataObserver forKeyPath:@"askPrice"];


}

- (SendPositionView *)sendPositionView {
 
    if (!_sendPositionView) {
    
        _sendPositionView = [[SendPositionView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 5, 60, SCREEN_WIDTH, SCREEN_HEIGHT - 60)];
        
        _sendPositionView.backgroundColor = [UIColor yellowColor];
        
        [self.scrollView addSubview:_sendPositionView];
        
    
    }
    return _sendPositionView;
    
    
}

- (SendPriceView *)sendPriceView {

    if (!_sendPriceView) {
    
        _sendPriceView = [[SendPriceView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 6, 60, SCREEN_WIDTH, SCREEN_HEIGHT - 60)];
        
        [self.scrollView addSubview:_sendPriceView];
    
    
    }
    
    return  _sendPriceView;


}

- (SendShopNameView *)sendShopNameView {

    if (!_sendShopNameView) {
    
        _sendShopNameView = [[SendShopNameView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 4, 60, SCREEN_WIDTH, SCREEN_HEIGHT - 60)];
        
        [self.scrollView addSubview:_sendShopNameView];
    
    
    }
    
    return _sendShopNameView;


}

- (SendReasonView *)sendReasonView {

    if (!_sendReasonView) {
    
        _sendReasonView = [[SendReasonView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 2, 60, SCREEN_WIDTH, SCREEN_HEIGHT - 60)];
        
        
        [self.scrollView addSubview:_sendReasonView];
    
    }
    
    return  _sendReasonView;


}

- (SendDetailView *)sendDetailView {

    if (!_sendDetailView) {
    
        _sendDetailView = [[SendDetailView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 3, 60, SCREEN_WIDTH, SCREEN_HEIGHT - 60)];
        
        [self.scrollView addSubview:_sendDetailView];
    
    }
    return _sendDetailView;

}

- (UIScrollView *)scrollView {

    if (!_scrollView) {
    
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 7, SCREEN_HEIGHT);
        _scrollView.delegate = self;
        
        [self sendTotalView];
        
        [self.view addSubview:_scrollView];
        
        
    
    }

    return _scrollView;

}

- (UIView *)footerView {

    if (!_footerView) {
    
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 60)];
        
        UIButton *allShow = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 120, 34)];
        allShow.center = CGPointMake(100, 17);
        [allShow setBackgroundColor:TITLE_COLER];
        allShow.layer.cornerRadius = 17;
        allShow.layer.masksToBounds = YES;
        [allShow setTitle:@"  预览" forState:UIControlStateNormal];
        [allShow setImage:[UIImage imageNamed:@"edit"]  forState:UIControlStateNormal];
        [allShow.imageView setContentMode:UIViewContentModeLeft];
        allShow.tag = 1;
        [allShow addTarget:self action:@selector(footerClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_footerView addSubview:allShow];
        
        [self nextButton];
        [self finishButton];
        
        [self.view addSubview:_footerView];
    
    }
    
    return _footerView;

}

- (UIButton *)nextButton {

    if (!_nextButton) {
    
        _nextButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 120, 34)];
        _nextButton.center = CGPointMake(SCREEN_WIDTH - 100, 17);
        [_nextButton setBackgroundColor:TITLE_COLER];
        _nextButton.layer.cornerRadius = 17;
        _nextButton.layer.masksToBounds = YES;
        [_nextButton setTitle:@"下一步  " forState:UIControlStateNormal];
        [_nextButton setImage:[UIImage imageNamed:@"next"]  forState:UIControlStateNormal];
        [_nextButton.imageView setContentMode:UIViewContentModeRight];
        _nextButton.imageEdgeInsets = UIEdgeInsetsMake(0, 65, 0, -65);
        _nextButton.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 20);
        _nextButton.tag = 2;
        [_nextButton addTarget:self action:@selector(footerClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_footerView addSubview:_nextButton];
        
    }
    
    return _nextButton;

}

- (UIButton *)finishButton {

    if (!_finishButton) {
    
        _finishButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 120, 34)];
        _finishButton.center = CGPointMake(SCREEN_WIDTH - 100, 17);
        [_finishButton setBackgroundColor:TITLE_COLER];
        _finishButton.layer.cornerRadius = 17;
        _finishButton.layer.masksToBounds = YES;
        [_finishButton setTitle:@"完成" forState:UIControlStateNormal];
        
        _finishButton.tag = 3;
        [_finishButton addTarget:self action:@selector(footerClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_footerView addSubview:_finishButton];
    
    }
    
    return _finishButton;
  


}

- (SendTotalView *)sendTotalView {

    if (!_sendTotalView) {
    
        _sendTotalView = [[SendTotalView alloc] init];
        _sendTotalView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 60);
        
        _sendTotalView.delegate = self;
        
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
        
        
        UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 80, 40)];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        backButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [backButton setTitleColor:TITLE_COLER forState:UIControlStateNormal];
        
        [_titleBar addSubview:backButton];
        
        UIButton *sendButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 80 - 5, 20, 80, 40)];
        [sendButton setTitle:@"发布" forState:UIControlStateNormal];
        sendButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [sendButton setImage:[UIImage imageNamed:@"send"] forState:UIControlStateNormal];
        [sendButton addTarget:self action:@selector(sendButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [sendButton setTitleColor:TITLE_COLER forState:UIControlStateNormal];
        
        sendButton.imageEdgeInsets = UIEdgeInsetsMake(0, 40, 0, -40);
        sendButton.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 30);
        [_titleBar addSubview:sendButton];
        
        [_titleBar addSubview:titleLable];
        [self.view addSubview:_titleBar];
    
    }
    return _titleBar;

}

- (void)backButtonClick:(UIButton *)button {

    [self.segment removeFromSuperview];
    [self dismissViewControllerAnimated:self completion:^{
        
        
        
    }];


}

- (void)sendButtonClick:(UIButton *)button {

    NSLog(@"Clikc--->send");


}

- (SendSegmentView *)segment {

    if (!_segment) {
    
        _segment = [[SendSegmentView alloc] initWithFrame:CGRectMake(20, -60, SCREEN_WIDTH - 40, 60) index:0];
        _segment.delegate = self;
        
        [self.view addSubview:_segment];
    
    }


    return _segment;

}

- (SendTypeView *)sendTypeView {

    if (!_sendTypeView) {
    
        _sendTypeView = [[SendTypeView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 1, 60, SCREEN_WIDTH, SCREEN_HEIGHT - 60)];
//        _sendTypeView.backgroundColor = [UIColor cyanColor];
        
        
        
        [self.scrollView addSubview:_sendTypeView];
    
    }
    
    
    return _sendTypeView;



}

- (void)sendSegmentView:(SendSegmentView *)segment segmentDidClick:(UIButton *)button clickIndex:(int)index {

    [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * (index - 1), 0) animated:YES];


}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.x < 375) {
        
        self.segment.center = CGPointMake(SCREEN_WIDTH / 2, -30+(140*scrollView.contentOffset.x / SCREEN_WIDTH));
        self.footerView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT+30 - scrollView.contentOffset.x * 60/SCREEN_WIDTH);
    
    } else {
        
        self.segment.center = CGPointMake(SCREEN_WIDTH / 2, 110);
        self.footerView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT-60 + 30);
    }
    
    
    [self.finishButton removeFromSuperview];
    [self.footerView addSubview:self.nextButton];
    
//    [self.view addSubview:self.segment];
    
    if (scrollView.contentOffset.x == 0 * SCREEN_WIDTH) {
    
        [self.segment addSelected:1];
        
    } else if (scrollView.contentOffset.x == 1 * SCREEN_WIDTH) {
    
        [self.segment addSelected:2];
    
    } else if (scrollView.contentOffset.x == 2 * SCREEN_WIDTH) {
        
        [self.segment addSelected:3];
    
    } else if (scrollView.contentOffset.x == 3 * SCREEN_WIDTH) {
        
        [self.segment addSelected:4];
    
    } else if (scrollView.contentOffset.x == 4 * SCREEN_WIDTH) {
        
        [self.segment addSelected:5];
    
    } else if (scrollView.contentOffset.x == 5 * SCREEN_WIDTH) {
        
        [self.segment addSelected:6];
    
    } else if (scrollView.contentOffset.x == 6 * SCREEN_WIDTH) {
        
        [self.segment addSelected:7];
        [self.nextButton removeFromSuperview];
        [self.footerView addSubview:self.finishButton];
    }

}

- (void)footerClick:(UIButton *)button {

    NSLog(@"%ld", button.tag);
    if (button.tag == 1) {
    
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    
    } else if (button.tag == 2) {
    
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x +SCREEN_WIDTH, 0)  animated:YES];
    
    } else if (button.tag == 3) {
    
    
    }
    
   


}

- (void)sendTotalView:(SendTotalView *)sendTotalView viewDidClick:(SendTotalSimpleView *)sendTotalSimpleView viewTag:(NSInteger)tag {

    NSLog(@"Clikc------>%ld", tag);
    
    if (tag == 1) {
    
        
        
        [self userImageClick];
        
    
    
    } else {
    
    
        [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * (tag-1), 0) animated:YES];
    
    
    }


}

- (void)userImageClick {

    UIAlertController *imageSelecteAlert = [UIAlertController alertControllerWithTitle:@"选择图片" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    

    UIAlertAction *fromCamera = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
            [self selectImage:1];
        
        } else {
        
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"该设备暂无照相功能" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:^{
                
            }];
        
        }
        
        
    }];
    
    UIAlertAction *formPhoto = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self selectImage:2];
        
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [imageSelecteAlert addAction:fromCamera];
    [imageSelecteAlert addAction:formPhoto];
    [imageSelecteAlert addAction:cancel];
    
//    self.presentedViewController = imageSelecteAlert;
    
    
    
    [self presentViewController:imageSelecteAlert animated:YES completion:nil];


}


- (void)selectImage:(NSInteger)type {
    
    NSUInteger sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    if (type == 1) {
    
        sourceType = UIImagePickerControllerSourceTypeCamera;
    
    }
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = sourceType;
    
    [self presentViewController:imagePickerController animated:YES completion:^{}];


}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo {

    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    self.sendTotalView.image = image;
    self.image = image;

}

@end
