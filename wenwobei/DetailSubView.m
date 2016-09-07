//
//  DetailSubView.m
//  wenwobei
//
//  Created by HanQi on 16/9/6.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "DetailSubView.h"
#import "Config.h"

@implementation DetailSubView

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title detail:(NSString *)detail other:(UIView *)view
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 20, 20)];
        self.icon.layer.cornerRadius = self.icon.frame.size.width/2;
        self.icon.layer.masksToBounds = YES;
        self.icon.image = [UIImage imageNamed:imageName];
        [self addSubview:self.icon];
        
        self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(40, 5, SCREEN_WIDTH - 40 - 20, 20)];
//        [self.titleLable setNumberOfLines:0];
//        self.titleLable.lineBreakMode = UILineBreakModeWordWrap;
        self.titleLable.text = title;
        self.titleLable.font = [UIFont systemFontOfSize:17 weight:0.3];
        [self addSubview:self.titleLable];
        
        self.mainView = [[UIView alloc] init];
        
        
        self.detailLable = [[UILabel alloc] initWithFrame:CGRectMake(40, 40, SCREEN_WIDTH - 40 - 20, 0)];
        self.detailLable.font = [UIFont systemFontOfSize:15];
        self.detailLable.text = detail;
        [self.detailLable setNumberOfLines:0];
        CGSize size = CGSizeMake(SCREEN_WIDTH - 40 - 20,2000);
        CGSize detailLabelSize = [detail sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
        self.detailLable.frame = CGRectMake(40, 40, SCREEN_WIDTH-40-20, detailLabelSize.height);
        [self.mainView addSubview:self.detailLable];
        
        UIView *wrap = [[UIView alloc] initWithFrame:CGRectMake(0, 40 + self.detailLable.frame.size.height, SCREEN_WIDTH, view.frame.size.height)];
        [wrap addSubview:view];
        [self.mainView addSubview:wrap];
        
        self.mainView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.detailLable.frame.size.height + wrap.frame.size.height);
        self.frame = CGRectMake(0, self.frame.origin.y, SCREEN_WIDTH, self.detailLable.frame.size.height + wrap.frame.size.height + 40 + 20);
        
//        self.backgroundColor = [UIColor redColor];
        [self addSubview:self.mainView];
        
        
    }
    return self;
}

@end
