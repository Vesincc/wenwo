//
//  DetailViewController.m
//  wenwobei
//
//  Created by HanQi on 16/8/30.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "DetailViewController.h"
#import "SimpleTableViewCellModel.h"
#import "Config.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "DetailSubView.h"

@interface DetailViewController () <UINavigationBarDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIView *imageInfoView;
@property (nonatomic, strong) DetailSubView *reasonView;
@property (nonatomic, strong) DetailSubView *detailView;
@property (nonatomic, strong) DetailSubView *shopNameView;
@property (nonatomic, strong) DetailSubView *addressView;

@end

@implementation DetailViewController

- (instancetype)initWithData:(SimpleTableViewCellModel *)data
{
    self = [super init];
    if (self) {
        self.detailData = data;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.detailData.askTag[0];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self scrollView];
    
    
    
    
    
    
}


- (DetailSubView *)addressView {

    if (!_addressView) {
    
        _addressView = [[DetailSubView alloc] initWithFrame:CGRectMake(0, self.shopNameView.frame.origin.y + self.shopNameView.frame.size.height, SCREEN_WIDTH, 2000) imageName:@"address-2" title:@"地址" detail:[NSString stringWithFormat:@"%@%@%@%@%@", self.detailData.askPositionProvince, self.detailData.askPositionCity, self.detailData.askPositionDistrict, self.detailData.askPositionTownship, self.detailData.askPositionDetail] other:nil];
        
        if ([self.detailData.shopName isEqualToString:@"请购买以后查看"]) {
        
            _addressView.detailLable.text = @"请购买以后查看";
            
        }
        
        [self.scrollView addSubview:_addressView];
        
    }
    
    return _addressView;

}

- (DetailSubView *)shopNameView {

    if (!_shopNameView) {
    
        _shopNameView = [[DetailSubView alloc] initWithFrame:CGRectMake(0, self.detailView.frame.origin.y + self.detailView.frame.size.height, SCREEN_WIDTH, 2000) imageName:@"name-2" title:@"店名" detail:self.detailData.shopName other:nil];
        
        [self.scrollView addSubview:_shopNameView];
    
    }
    return _shopNameView;

}

- (DetailSubView *)reasonView {

    if (!_reasonView) {
        
        _reasonView = [[DetailSubView alloc] initWithFrame:CGRectMake(0, 270, SCREEN_WIDTH, 2000) imageName:@"reason-2" title:@"推荐理由" detail:self.detailData.askReason other:nil];
        
        [self.scrollView addSubview:_reasonView];
    
    }
    return _reasonView;
    
}

- (DetailSubView *)detailView {

    if (!_detailView) {
    
        _detailView = [[DetailSubView alloc] initWithFrame:CGRectMake(0, self.reasonView.frame.origin.y + self.reasonView.frame.size.height, SCREEN_WIDTH, 2000) imageName:@"detail-2" title:@"美食详情" detail:self.detailData.askContentShowDetail other:nil];
        [self.scrollView addSubview:_detailView];
    
    }
    
    return _detailView;
    
}

- (UIScrollView *)scrollView {

    if (!_scrollView) {
    
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _scrollView.showsVerticalScrollIndicator = NO;
        
        [self imageInfoView];
        
        [self reasonView];
        
        [self detailView];
        
        [self shopNameView];
        
        [self addressView];
        
        _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width, self.imageInfoView.frame.size.height + self.reasonView.frame.size.height + self.detailView.frame.size.height + self.shopNameView.frame.size.height + self.addressView.frame.size.height);
        
        [self.view addSubview:_scrollView];
    
    }
    return _scrollView;


}

- (UIView *)imageInfoView {

    if (!_imageInfoView) {
    
        _imageInfoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 260)];
        
//        _imageInfoView.backgroundColor = [UIColor redColor];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _imageInfoView.frame.size.width, _imageInfoView.frame.size.height)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.layer.masksToBounds = YES;
        @try {
            
            if (![self.detailData.askImage[0] isEqualToString:@""]) {
            
                [imageView sd_setImageWithURL:[NSURL URLWithString:self.detailData.askImage[0]] placeholderImage:[UIImage imageNamed:@"default_userhead"]];
                
            } else {
            
                [imageView sd_setImageWithURL:[NSURL URLWithString:self.detailData.createByUrl] placeholderImage:[UIImage imageNamed:@"default_userhead"]];
                
            }
        
        } @catch (NSException *exception) {
            
        }
        
        [_imageInfoView addSubview:imageView];
        
        
        UILabel *nameLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, SCREEN_WIDTH, 60)];
        nameLable.text = [NSString stringWithFormat:@"      %@", self.detailData.createByName];
        nameLable.font = [UIFont systemFontOfSize:20];
        nameLable.textColor = [UIColor whiteColor];
        [_imageInfoView addSubview:nameLable];
        
        UIView *wrap = [[UIView alloc] initWithFrame:CGRectMake(0, 195, SCREEN_WIDTH, 50)];
//        wrap.backgroundColor = [UIColor redColor];
        [_imageInfoView addSubview:wrap];
        
        UIView *like = [[UIView alloc] initWithFrame:CGRectMake(20, 10, 80, 35)];
        like.backgroundColor = [UIColor whiteColor];
        like.layer.cornerRadius = 4;
        like.layer.masksToBounds = YES;
        [wrap addSubview:like];
        
        UIImageView *likeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 4, 27, 27)];
        if (self.detailData.liked == 0) {
            likeImageView.image = [UIImage imageNamed:@"like"];
        
        } else {
        
            likeImageView.image = [UIImage imageNamed:@"like_selected"];
        
        }
        [like addSubview:likeImageView];
        
        UILabel *likeNum = [[UILabel alloc] initWithFrame:CGRectMake(40, 4, like.frame.size.width-27 - 10 - 3, 27)];
        likeNum.text = self.detailData.likeNum;
        likeNum.textColor = [UIColor blackColor];
        [like addSubview:likeNum];
        
        UIView *buy = [[UIView alloc] initWithFrame:CGRectMake(110, 10, 100, 35)];
        
        UILabel *notice = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, buy.frame.size.width, buy.frame.size.height)];
        notice.textColor = [UIColor whiteColor];
        notice.textAlignment = NSTextAlignmentCenter;
        
        
        if (self.detailData.score.integerValue < 10) {
        
            buy.backgroundColor = TITLE_COLER;
            notice.text = @"限时免费";
            
            
        } else {
            
            buy.backgroundColor = HQ_RGBA(45, 204, 166, 1);
            notice.text = [NSString stringWithFormat:@"%@ 元查看", self.detailData.askPrice];
        
        }
        buy.layer.cornerRadius = 4;
        buy.layer.masksToBounds = YES;
        [buy addSubview:notice];
        [wrap addSubview:buy];
        
        [self.scrollView addSubview:_imageInfoView];
        
    
    }
    
    
    return _imageInfoView;


}

- (void)back {

    [self.navigationController popViewControllerAnimated:YES];

}

@end
