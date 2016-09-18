//
//  TableHeaderView.m
//  wenwobei
//
//  Created by HanQi on 16/9/19.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "TableHeaderView.h"
#import "Config.h"

@interface TableHeaderView()

@property (nonatomic, strong) UIView *classify;
@property (nonatomic, strong) UIView *card;
@property (nonatomic, strong) UIView *special;

@end

@implementation TableHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self classify];
        
        [self card];
        
        [self special];
        
    }
    return self;
}

-(UIView *)classify {

    if (!_classify) {
    
        _classify = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/3, self.frame.size.height)];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
        imageView.center = CGPointMake(_classify.frame.size.width/2, 40);
        imageView.image = [UIImage imageNamed:@"classify"];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, _classify.frame.size.height - 40, SCREEN_WIDTH/3, 20)];
        title.text = @"分类查找";
        title.font = [UIFont systemFontOfSize:15];
        title.textColor = HQ_RGBA(120, 120, 120, 1);
        title.textAlignment = NSTextAlignmentCenter;
        
        [_classify addSubview:title];
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClicked:)];
        [_classify addGestureRecognizer:gesture];
        
        [_classify addSubview:imageView];
        _classify.tag = 0;
        
        [self addSubview:_classify];
    
    }
    
    return _classify;


}

- (UIView *)card {

    if (!_card) {
    
        _card = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3, self.frame.size.height)];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
        imageView.center = CGPointMake(_card.frame.size.width/2, 40);
        imageView.image = [UIImage imageNamed:@"card"];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, _card.frame.size.height - 40, SCREEN_WIDTH/3, 20)];
        title.text = @"精选美食卡片";
        title.font = [UIFont systemFontOfSize:15];
        title.textColor = HQ_RGBA(120, 120, 120, 1);
        title.textAlignment = NSTextAlignmentCenter;
        
        [_card addSubview:title];
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClicked:)];
        [_card addGestureRecognizer:gesture];
        
        [_card addSubview:imageView];
        _card.tag = 1;
        
        [self addSubview:_card];
        
    
    }
    
    
    return _card;

}

- (UIView *)special {

    if (!_special) {
    
        _special = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 2/3, 0, SCREEN_WIDTH/3, self.frame.size.height)];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
        imageView.center = CGPointMake(_special.frame.size.width/2, 40);
        imageView.image = [UIImage imageNamed:@"special"];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, _special.frame.size.height - 40, SCREEN_WIDTH/3, 20)];
        title.text = @"美食专题";
        title.font = [UIFont systemFontOfSize:15];
        title.textColor = HQ_RGBA(120, 120, 120, 1);
        title.textAlignment = NSTextAlignmentCenter;
        
        [_special addSubview:title];
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClicked:)];
        [_special addGestureRecognizer:gesture];
        
        [_special addSubview:imageView];
        _special.tag = 2;
        
        [self addSubview:_special];
        
    
    }
    
    
    return _special;
    

}

- (void)didClicked:(UITapGestureRecognizer *)gesture {

    
//    NSLog(@"%ld", gesture.view.tag);

    if ([self.delegate respondsToSelector:@selector(tableHeaderView:didClick:atIndex:)]) {
    
        [self.delegate tableHeaderView:self didClick:gesture.view atIndex:gesture.view.tag];
    
    }
    
}


@end
