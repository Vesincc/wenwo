//
//  SendSegmentView.m
//  wenwobei
//
//  Created by HanQi on 16/8/13.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SendSegmentView.h"
#import "Config.h"
#import "DrawUtils.h"

@interface SendSegmentView()

@property (nonatomic, strong) UIView *line1;
@property (nonatomic, strong) UIView *line2;
@property (nonatomic, strong) UIView *line3;
@property (nonatomic, strong) UIView *line4;
@property (nonatomic, strong) UIView *line5;
@property (nonatomic, strong) UIView *line6;

@property (nonatomic, strong) UIView *point1;
@property (nonatomic, strong) UIView *point2;
@property (nonatomic, strong) UIView *point3;
@property (nonatomic, strong) UIView *point4;
@property (nonatomic, strong) UIView *point5;
@property (nonatomic, strong) UIView *point6;
@property (nonatomic, strong) UIView *point7;

@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;
@property (nonatomic, strong) UIButton *button4;
@property (nonatomic, strong) UIButton *button5;
@property (nonatomic, strong) UIButton *button6;
@property (nonatomic, strong) UIButton *button7;

@property (nonatomic, strong) UIImageView *selectedView;

@end

@implementation SendSegmentView

- (instancetype)initWithFrame:(CGRect)frame index:(int)index
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = HQ_RGBA(250, 250, 250, 0.9);
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        [self initLines];
        
        [self initPints];
        
        [self initButtons];
    }
    return self;
}

- (void)initLines {

    self.line1 = [DrawUtils drawLine:CGRectMake(0, 0, (self.frame.size.width - 50)/6, 2) lineColor:HQ_RGBA(230, 230, 230, 1)];
    self.line1.center = CGPointMake(25 + 0*self.line1.frame.size.width +  self.line1.frame.size.width/ 2, self.frame.size.height / 2 - 1);
    
    self.line2 = [DrawUtils drawLine:CGRectMake(0, 0, (self.frame.size.width - 50)/6, 2) lineColor:HQ_RGBA(230, 230, 230, 1)];
    self.line2.center = CGPointMake(25 + 1*self.line1.frame.size.width +  self.line1.frame.size.width/ 2, self.frame.size.height / 2 - 1);
    
    self.line3 = [DrawUtils drawLine:CGRectMake(0, 0, (self.frame.size.width - 50)/6, 2) lineColor:HQ_RGBA(230, 230, 230, 1)];
    self.line3.center = CGPointMake(25 + 2*self.line1.frame.size.width +  self.line1.frame.size.width/ 2, self.frame.size.height / 2 - 1);
    
    self.line4 = [DrawUtils drawLine:CGRectMake(0, 0, (self.frame.size.width - 50)/6, 2) lineColor:HQ_RGBA(230, 230, 230, 1)];
    self.line4.center = CGPointMake(25 + 3*self.line1.frame.size.width +  self.line1.frame.size.width/ 2, self.frame.size.height / 2 - 1);
    
    self.line5 = [DrawUtils drawLine:CGRectMake(0, 0, (self.frame.size.width - 50)/6, 2) lineColor:HQ_RGBA(230, 230, 230, 1)];
    self.line5.center = CGPointMake(25 + 4*self.line1.frame.size.width +  self.line1.frame.size.width/ 2, self.frame.size.height / 2 - 1);
    
    self.line6 = [DrawUtils drawLine:CGRectMake(0, 0, (self.frame.size.width - 50)/6, 2) lineColor:HQ_RGBA(230, 230, 230, 1)];
    self.line6.center = CGPointMake(25 + 5*self.line1.frame.size.width +  self.line1.frame.size.width/ 2, self.frame.size.height / 2 - 1);
    
    
    [self addSubview:self.line1];
    [self addSubview:self.line2];
    [self addSubview:self.line3];
    [self addSubview:self.line4];
    [self addSubview:self.line5];
    [self addSubview:self.line6];
    

}

- (void)initPints {
    
    UITapGestureRecognizer *gesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pointClick:)];
    UITapGestureRecognizer *gesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pointClick:)];
    UITapGestureRecognizer *gesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pointClick:)];
    UITapGestureRecognizer *gesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pointClick:)];
    UITapGestureRecognizer *gesture5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pointClick:)];
    UITapGestureRecognizer *gesture6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pointClick:)];
    UITapGestureRecognizer *gesture7 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pointClick:)];

    self.point1 = [DrawUtils drawPoint:5 center:CGPointMake(25 + 0*self.line1.frame.size.width, self.frame.size.height / 2) pointColor:HQ_RGBA(79, 175, 203, 1)];
    self.point1.tag = 1;
    
    self.point2 = [DrawUtils drawPoint:5 center:CGPointMake(25 + 1*self.line1.frame.size.width, self.frame.size.height / 2) pointColor:HQ_RGBA(78, 116, 216, 1)];
    self.point2.tag = 2;
    
    self.point3 = [DrawUtils drawPoint:5 center:CGPointMake(25 + 2*self.line1.frame.size.width, self.frame.size.height / 2) pointColor:HQ_RGBA(205, 74, 75, 1)];
    self.point3.tag = 3;
    
    self.point4 = [DrawUtils drawPoint:5 center:CGPointMake(25 + 3*self.line1.frame.size.width, self.frame.size.height / 2) pointColor:HQ_RGBA(225, 185, 39, 1)];
    self.point4.tag = 4;
    
    self.point5 = [DrawUtils drawPoint:5 center:CGPointMake(25 + 4*self.line1.frame.size.width, self.frame.size.height / 2) pointColor:HQ_RGBA(78, 116, 216, 1)];
    self.point5.tag = 5;
    
    self.point6 = [DrawUtils drawPoint:5 center:CGPointMake(25 + 5*self.line1.frame.size.width, self.frame.size.height / 2) pointColor:HQ_RGBA(95, 172, 50, 1)];
    self.point6.tag = 6;
    
    self.point7 = [DrawUtils drawPoint:5 center:CGPointMake(25 + 6*self.line1.frame.size.width, self.frame.size.height / 2) pointColor:HQ_RGBA(225, 117, 49, 1)];
    self.point7.tag = 7;
    
    [self.point1 addGestureRecognizer:gesture1];
    [self.point2 addGestureRecognizer:gesture2];
    [self.point3 addGestureRecognizer:gesture3];
    [self.point4 addGestureRecognizer:gesture4];
    [self.point5 addGestureRecognizer:gesture5];
    [self.point6 addGestureRecognizer:gesture6];
    [self.point7 addGestureRecognizer:gesture7];

    [self addSubview:self.point1];
    [self addSubview:self.point2];
    [self addSubview:self.point3];
    [self addSubview:self.point4];
    [self addSubview:self.point5];
    [self addSubview:self.point6];
    [self addSubview:self.point7];


}

- (void)initButtons {

    self.button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, (self.frame.size.width - 10)/7, self.frame.size.height)];
    self.button1.center = self.point1.center;
    [self.button1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.button1.tag = 1;
    [self addSubview:self.button1];
    
    self.button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, (self.frame.size.width - 10)/7, self.frame.size.height)];
    self.button2.center = self.point2.center;
    [self.button2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.button2.tag = 2;
    [self addSubview:self.button2];
    
    self.button3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, (self.frame.size.width - 10)/7, self.frame.size.height)];
    self.button3.center = self.point3.center;
    [self.button3 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.button3.tag = 3;
    [self addSubview:self.button3];
    
    self.button4 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, (self.frame.size.width - 10)/7, self.frame.size.height)];
    self.button4.center = self.point4.center;
    [self.button4 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.button4.tag = 4;
    [self addSubview:self.button4];
    
    self.button5 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, (self.frame.size.width - 10)/7, self.frame.size.height)];
    self.button5.center = self.point5.center;
    [self.button5 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.button5.tag = 5;
    [self addSubview:self.button5];
    
    self.button6 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, (self.frame.size.width - 10)/7, self.frame.size.height)];
    self.button6.center = self.point6.center;
    [self.button6 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.button6.tag = 6;
    [self addSubview:self.button6];
    
    self.button7 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, (self.frame.size.width - 10)/7, self.frame.size.height)];
    self.button7.center = self.point7.center;
    [self.button7 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.button7.tag = 7;
    [self addSubview:self.button7];


}

- (void)pointClick:(UITapGestureRecognizer *)gesture {

//    NSLog(@"gesture---->%ld", gesture.view.tag);
    
    switch (gesture.view.tag) {
        case 1:
            [self btnClick:self.button1];
            break;
            
        case 2:
            [self btnClick:self.button2];
            break;
            
        case 3:
            [self btnClick:self.button3];
            break;
            
        case 4:
            [self btnClick:self.button4];
            break;
            
        case 5:
            [self btnClick:self.button5];
            break;
            
        case 6:
            [self btnClick:self.button6];
            break;
            
        case 7:
            [self btnClick:self.button7];
            break;
    }

}

- (void)btnClick:(UIButton *)button {

//    [self addSelected:(int)button.tag];
    
    if ([self.delegate respondsToSelector:@selector(sendSegmentView:segmentDidClick:clickIndex:)]) {
    
        [self.delegate sendSegmentView:self segmentDidClick:button clickIndex:(int)button.tag];
    
    }
    
}

- (void)addSelected:(int)index {
    
    if (self.selectedView) {
//        NSLog(@"remove");
        [self.selectedView removeFromSuperview];
    
    }
    
    self.button1.userInteractionEnabled = YES;
    self.button2.userInteractionEnabled = YES;
    self.button3.userInteractionEnabled = YES;
    self.button4.userInteractionEnabled = YES;
    self.button5.userInteractionEnabled = YES;
    self.button6.userInteractionEnabled = YES;
    self.button7.userInteractionEnabled = YES;
    
    [self addSubview:self.point1];
    [self addSubview:self.point2];
    [self addSubview:self.point3];
    [self addSubview:self.point4];
    [self addSubview:self.point5];
    [self addSubview:self.point6];
    [self addSubview:self.point7];

    if (index == 1) {
        self.button1.userInteractionEnabled = NO;
        [self.point1 removeFromSuperview];
        self.selectedView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        self.selectedView.center = self.point1.center;
        self.selectedView.image = [UIImage imageNamed:@"photo-2"];
        [self addSubview:self.selectedView];
        CGRect seletedFrame =  self.selectedView.frame;
        seletedFrame.size.width = 35;
        seletedFrame.size.height = 35;
        [UIView animateWithDuration:0.5 animations:^{
            
            self.selectedView.frame = seletedFrame;
            self.selectedView.center = self.point1.center;
        }];
    
    } else if (index == 2) {
    
        self.button2.userInteractionEnabled = NO;
        [self.point2 removeFromSuperview];
        self.selectedView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        self.selectedView.center = self.point2.center;
        self.selectedView.image = [UIImage imageNamed:@"tag-2"];
        [self addSubview:self.selectedView];
        CGRect seletedFrame =  self.selectedView.frame;
        seletedFrame.size.width = 35;
        seletedFrame.size.height = 35;
        [UIView animateWithDuration:0.5 animations:^{
            
            self.selectedView.frame = seletedFrame;
            self.selectedView.center = self.point2.center;
        }];
    
    
    } else if (index == 3) {
        
        self.button3.userInteractionEnabled = NO;
        [self.point3 removeFromSuperview];
        self.selectedView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        self.selectedView.center = self.point3.center;
        self.selectedView.image = [UIImage imageNamed:@"reason-2"];
        [self addSubview:self.selectedView];
        CGRect seletedFrame =  self.selectedView.frame;
        seletedFrame.size.width = 35;
        seletedFrame.size.height = 35;
        [UIView animateWithDuration:0.5 animations:^{
            
            self.selectedView.frame = seletedFrame;
            self.selectedView.center = self.point3.center;
        }];
    
    
    } else if (index == 4) {
    
        self.button4.userInteractionEnabled = NO;
        [self.point4 removeFromSuperview];
        self.selectedView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        self.selectedView.center = self.point4.center;
        self.selectedView.image = [UIImage imageNamed:@"detail-2"];
        [self addSubview:self.selectedView];
        CGRect seletedFrame =  self.selectedView.frame;
        seletedFrame.size.width = 35;
        seletedFrame.size.height = 35;
        [UIView animateWithDuration:0.5 animations:^{
            
            self.selectedView.frame = seletedFrame;
            self.selectedView.center = self.point4.center;
        }];
    
    } else if (index == 5) {
        
        self.button5.userInteractionEnabled = NO;
        [self.point5 removeFromSuperview];
        self.selectedView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        self.selectedView.center = self.point5.center;
        self.selectedView.image = [UIImage imageNamed:@"name-2"];
        [self addSubview:self.selectedView];
        CGRect seletedFrame =  self.selectedView.frame;
        seletedFrame.size.width = 35;
        seletedFrame.size.height = 35;
        [UIView animateWithDuration:0.5 animations:^{
            
            self.selectedView.frame = seletedFrame;
            self.selectedView.center = self.point5.center;
        }];
    
    
    } else if (index == 6) {
    
        self.button6.userInteractionEnabled = NO;
        [self.point6 removeFromSuperview];
        self.selectedView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        self.selectedView.center = self.point6.center;
        self.selectedView.image = [UIImage imageNamed:@"address-2"];
        [self addSubview:self.selectedView];
        CGRect seletedFrame =  self.selectedView.frame;
        seletedFrame.size.width = 35;
        seletedFrame.size.height = 35;
        [UIView animateWithDuration:0.5 animations:^{
            
            self.selectedView.frame = seletedFrame;
            self.selectedView.center = self.point6.center;
        }];
    
    } else if (index == 7) {
    
        self.button7.userInteractionEnabled = NO;
        [self.point7 removeFromSuperview];
        self.selectedView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        self.selectedView.center = self.point7.center;
        self.selectedView.image = [UIImage imageNamed:@"price-2"];
        [self addSubview:self.selectedView];
        CGRect seletedFrame =  self.selectedView.frame;
        seletedFrame.size.width = 35;
        seletedFrame.size.height = 35;
        [UIView animateWithDuration:0.5 animations:^{
            
            self.selectedView.frame = seletedFrame;
            self.selectedView.center = self.point7.center;
        }];
    
    }


}

@end
