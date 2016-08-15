//
//  SimpleTableViewCell.m
//  wenwobei
//
//  Created by HanQi on 16/8/9.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SimpleTableViewCell.h"
#import "Config.h"
#import "SimpleTableViewCellModel.h"


@interface SimpleTableViewCell()

@property (nonatomic, assign) BOOL defalutViewControll;

@property (nonatomic, strong) UIView *wrap;


@property (nonatomic, strong) UIView *likeView;
@property (nonatomic, strong) UIImageView *likeIcon;
@property (nonatomic, strong) UILabel *likeNum;

@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *detailLable;
@property (nonatomic, strong) UILabel *freeLable;

@property (nonatomic, strong) UILabel *priceInfoLable;

@property (nonatomic, strong) UILabel *positionLable;
@property (nonatomic, strong) UILabel *timeLable;

@end

@implementation SimpleTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView identifier:(NSString *)identifier {

    SimpleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
    
        cell = [[SimpleTableViewCell alloc] initWithReusedID:identifier];
    
    }
    
    return cell;


}


- (instancetype)initWithReusedID:(NSString *)ID
{
    
    self.reusedID = ID;
    return [self init];
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.defalutViewControll = NO;
        self.backgroundColor = [UIColor clearColor];
        if (self.reusedID == nil || [self.reusedID isEqualToString: @""]) {
        
            self.reusedID = @"cell";
            
        }
        
        
        self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.reusedID];
        
        if (self) {
        
            [self wrap];
            
            [self userHeadImageView];
            
            [self likeView];
            
            [self titleLable];
            
            [self detailLable];
            
//            [self priceInfoLable];
            
            [self positionLable];
            
            [self timeLable];
        
        }
        
        return self;
        
    }
    return self;
}

- (UILabel *)timeLable {

    if (!_timeLable) {
    
        _timeLable  = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 15 - 100, 90, 100, 20)];
        
        _timeLable.font = [UIFont systemFontOfSize:13];
        _timeLable.textAlignment = NSTextAlignmentRight;
        _timeLable.text = @"2016.07.22";
        _timeLable.textColor = HQ_RGBA(100, 100, 100, 1);
        
        [self.wrap addSubview:_timeLable];
        
    
    }
    
    return _timeLable;

}

- (UILabel *)positionLable {

    if (!_positionLable) {
    
        _positionLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 15 - 50, 15, 50, 20)];
        _positionLable.font = [UIFont systemFontOfSize:13];
        _positionLable.textAlignment = NSTextAlignmentRight;
        _positionLable.text = @"双流区";
        _positionLable.textColor = HQ_RGBA(100, 100, 100, 1);
    
        [self.wrap addSubview:_positionLable];
    
    }

    return _positionLable;

}

- (UILabel *)likeNum {

    if (!_likeNum) {
    
        _likeNum = [[UILabel alloc] initWithFrame:CGRectMake(35, 3, 35, 20)];
        _likeNum.text = @"12";
        _likeNum.textColor = HQ_RGBA(100, 100, 100, 1);
        
        [self.likeView addSubview:_likeNum];
    
    
    }
    
    return _likeNum;

}

- (UILabel *)priceInfoLable {

    if (!_priceInfoLable) {
    
        _priceInfoLable = [[UILabel alloc] initWithFrame:CGRectMake(100, 90, 100, 24)];
        _priceInfoLable.text = @"0.5元瞅瞅";
        _priceInfoLable.backgroundColor = HQ_RGBA(45, 204, 166, 1);
        _priceInfoLable.layer.cornerRadius = 12;
        _priceInfoLable.textColor = [UIColor whiteColor];
        _priceInfoLable.layer.masksToBounds = YES;
        _priceInfoLable.textAlignment = NSTextAlignmentCenter;
        _priceInfoLable.font = [UIFont systemFontOfSize:15];
        
        [self.wrap addSubview:_priceInfoLable];
    
    }
    
    return _priceInfoLable;

}

- (UILabel *)freeLable {

    if (!_freeLable) {
    
        _freeLable = [[UILabel alloc]initWithFrame:CGRectMake(100, 90, 100, 24)];
        _freeLable.text = @"限时免费";
        _freeLable.backgroundColor = TITLE_COLER;
        _freeLable.layer.cornerRadius = 12;
        _freeLable.textColor = [UIColor whiteColor];
        _freeLable.layer.masksToBounds = YES;
        _freeLable.textAlignment = NSTextAlignmentCenter;
        _freeLable.font = [UIFont systemFontOfSize:15];
    
        [self.wrap addSubview:_freeLable];
    
    }
    return _freeLable;


}

- (UILabel *)detailLable {

    if (!_detailLable) {
    
        _detailLable = [[UILabel alloc] initWithFrame:CGRectMake(105, 37, SCREEN_WIDTH - 105 - 15, 40)];
        _detailLable.text = @"详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情";
        _detailLable.numberOfLines = 2;
        _detailLable.font = [UIFont systemFontOfSize:15];
        _detailLable.textColor = HQ_RGBA(100, 100, 100, 1);
        [self.wrap addSubview:_detailLable];
    
    
    }
    return _detailLable;


}

- (UILabel *)titleLable {

    if (!_titleLable) {
    
        _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(105, 10, 200, 30)];
        _titleLable.text = @"小吃小吃";
        _titleLable.font = [UIFont systemFontOfSize:18 weight:0.1];
//        _titleLable.backgroundColor = [UIColor cyanColor];
        
        [self.wrap addSubview:_titleLable];
    
    }
    
    return _titleLable;


}

- (UIImageView *)likeIcon {

    if (!_likeIcon) {
    
        _likeIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"like"]];
        _likeIcon.frame = CGRectMake(0, 0, 20, 20);
        _likeIcon.center = CGPointMake(20, 13);
        
        [self.likeView addSubview:_likeIcon];
    
    }
    return _likeIcon;


}

- (UIView *)likeView {

    if (!_likeView) {
    
        _likeView = [[UIView alloc] initWithFrame:CGRectMake(15, 85, 70, 26)];
        _likeView.layer.borderWidth = 1;
        _likeView.layer.borderColor = HQ_RGBA(200, 200, 200, 1).CGColor;;
        _likeView.layer.cornerRadius = 13;
        _likeView.layer.masksToBounds = YES;
        _likeView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(likeViewClick:)];
        [_likeView addGestureRecognizer:gesture];
        
        [self likeIcon];
        
        [self likeNum];
        
        [self.wrap addSubview:_likeView];
    
    }
    return _likeView;


}



-(UIView *)wrap {

    if (!_wrap) {
    
        _wrap = [[UIView alloc] initWithFrame:CGRectMake(0, 5, SCREEN_WIDTH, 125 - 5)];
        
        _wrap.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:_wrap];
        
    }
    return _wrap;

}

- (UIImageView *)userHeadImageView {

    if (!_userHeadImageView) {
        
        _userHeadImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"default_userhead"]];
        
        _userHeadImageView.frame = CGRectMake(15, 10, 70, 70);
        _userHeadImageView.layer.borderColor = HQ_RGBA(200, 200, 200, 1).CGColor;
        _userHeadImageView.layer.borderWidth = 1;
        _userHeadImageView.layer.cornerRadius = 5;
        _userHeadImageView.layer.masksToBounds = YES;
        
        [self.wrap addSubview:_userHeadImageView];
    }
    
    return _userHeadImageView;


}

- (void)likeViewClick:(UITapGestureRecognizer *)gesture {
    
    NSLog(@"%@", gesture.view);

    if ([self.delegate respondsToSelector:@selector(simpleTableViewCell:likeViewDidClick:)]) {
    
        [self.delegate simpleTableViewCell:self likeViewDidClick:gesture.view];
    
    }


}

- (void)setCellData:(SimpleTableViewCellModel *)cellData {

//    if (cellData.createByUrl != nil) {
//        
//        self.userHeadImageView.image = [UIImage imageNamed:@"default_userhead"];
//        
//        NSBlockOperation *taskLoadImage = [NSBlockOperation blockOperationWithBlock:^{
//            NSURL *imageUrl = [NSURL URLWithString:cellData.createByUrl];
//            NSData *dataImage = [NSData dataWithContentsOfURL:imageUrl];
//            self.userHeadImageView.image = [UIImage imageWithData:dataImage];
//        }];
//        [taskLoadImage start];
//    }
    
  
    
    
    self.likeNum.text = cellData.likeNum;
    
    self.titleLable.text = cellData.askTag;
    
    if ([cellData.score intValue] < 10) {
    
        [self.priceInfoLable removeFromSuperview];
        [self addSubview:self.freeLable];
    
    } else {
    
        self.priceInfoLable.text = [NSString stringWithFormat:@"%@元瞅瞅", cellData.askPrice];
        [self.freeLable removeFromSuperview];
        [self addSubview:self.priceInfoLable];
        
    }
    
    self.detailLable.text = cellData.askContentShowDetail;
    
    self.positionLable.text = cellData.askPositionDistrict;
    
    self.timeLable.text = [cellData.updatedAt substringToIndex:10];
    
    if (cellData.liked == 1) {
    
        self.likeIcon.image = [UIImage imageNamed:@"like_selected"];
    
    } else {
    
        self.likeIcon.image = [UIImage imageNamed:@"like"];
    
    }
    
}

@end
