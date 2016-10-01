//
//  SpecialTableViewCell.m
//  wenwobei
//
//  Created by HanQi on 16/9/24.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SpecialTableViewCell.h"
#import "Config.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "CarouselDataModel.h"
#import "UIView+LSCore.h"

@interface SpecialTableViewCell()

@property (nonatomic, strong) UIView *wrap;
@property (nonatomic, strong) UIImageView *backImg;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIView *likeView;
@property (nonatomic, strong) UILabel *likeNum;
@property (nonatomic, strong) UIImageView *likeIcon;

@end

@implementation SpecialTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView identifier:(NSString *)identifier {
    
    SpecialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[SpecialTableViewCell alloc] init];
    
    }
    
    return cell;
    
    
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        [self wrap];
        
        
    }
    return self;
}

- (UIView *)wrap {

    if (!_wrap) {
    
        _wrap = [[UIView alloc] initWithFrame:CGRectMake(8, 8, SCREEN_WIDTH - 16, 160 - 8)];
        
        _wrap.layer.cornerRadius = 5;
        _wrap.layer.masksToBounds = YES;
        
        [self backImg];
        
        [self titleLable];
        
        [self likeView];
        
        [self addSubview:_wrap];
        
        
    }
    return _wrap;
    
}

- (UIImageView *)likeIcon {

    if (!_likeIcon) {
    
        _likeIcon = [[UIImageView alloc] initWithFrame:CGRectMake(8, 5, 40 - 16, 40 - 16)];
        _likeIcon.image= [UIImage imageNamed:@"like"];
        _likeIcon.layer.zPosition = 1;
        _likeIcon.alpha = 1;
        
        [self.likeView addSubview:_likeIcon];
    
    }
    
    return _likeIcon;

}

- (UILabel *)likeNum {
    
    if (!_likeNum) {
        
        _likeNum = [[UILabel alloc] initWithFrame:CGRectMake(0, 5 + 24, 40, 45 - 29)];
        _likeNum.text = @"12";
        _likeNum.textColor = [UIColor whiteColor];
        _likeNum.textAlignment = NSTextAlignmentCenter;
        _likeNum.font = [UIFont systemFontOfSize:13];
        _likeNum.layer.zPosition = 1;
        _likeNum.alpha = 1;
        
        [self.likeView addSubview:_likeNum];
    
    
    }
    return _likeNum;


}

- (UIView *)likeView {

    if (!_likeView) {
        
        _likeView = [[UIView alloc] initWithFrame:CGRectMake(self.wrap.frame.size.width - 55, 0, 40, 45)];
        _likeView.backgroundColor = [UIColor blackColor];
        _likeView.alpha = 0.7;
        [_likeView addRoundedCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight withRadii:CGSizeMake(5, 5)];
        
        [self likeIcon];
        
        [self likeNum];
        
        [self.wrap addSubview:_likeView];
    
    }
    return _likeView;
    
}

- (UILabel *)titleLable {

    if (!_titleLable) {
    
        _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(10, self.wrap.frame.size.height - 24, self.wrap.frame.size.width - 20, 20)];
        _titleLable.text = @"啊放假哈送到附近啊哭；说的；阿四级大风；阿四级大风；阿三";
        _titleLable.textColor = [UIColor whiteColor];
        _titleLable.font = [UIFont systemFontOfSize:15];
        
        [self.wrap addSubview:_titleLable];
        
    }
    return _titleLable;
    
}

- (UIImageView *)backImg {

    if (!_backImg) {
    
        _backImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.wrap.frame.size.width, self.wrap.frame.size.height)];
        _backImg.image = [UIImage imageNamed:@"default_userhead"];
        _backImg.contentMode = UIViewContentModeScaleAspectFill;
        
        [self.wrap addSubview:_backImg];
        
    }
    return _backImg;
    
}

-(void)setModel:(CarouselDataModel *)model {

    [self.backImg sd_setImageWithURL: [NSURL URLWithString:[model.carouselImage stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]] placeholderImage:[UIImage imageNamed:@"default_userhead"]];
    
    
    self.titleLable.text = model.carouselName;
    
    if (model.liked == 0) {
    
        self.likeIcon.image = [UIImage imageNamed:@"like"];
        
    } else {
    
        self.likeIcon.image = [UIImage imageNamed:@"like_selected"];
        
    }
//    NSLog(@"%d", model.likeNum);
    
    self.likeNum.text = [NSString stringWithFormat:@"%d", (int)model.likeNum];

}

@end
