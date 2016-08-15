//
//  CarouselView.m
//  Carousel
//
//  Created by HanQi on 16/7/27.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "CarouselView.h"

@interface CarouselView() <UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageController;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation CarouselView

- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)images
{
    self = [super initWithFrame:frame];
    if (self) {
        self.images = [[NSMutableArray alloc] initWithArray:images];
        
        [self.images insertObject:images[images.count-1] atIndex:0];
        [self.images addObject:images[0]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self scrollView];
            
        });
        
        
    }
    return self;
}

-(UIScrollView *)scrollView {

    if (!_scrollView) {
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        _scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * (self.images.count), self.scrollView.frame.size.height);
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.bounces = NO;
        
        
        for (int i = 0; i < self.images.count; i++) {
        
            self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.scrollView.frame.size.height)];
            
            self.imageView.userInteractionEnabled = YES;
            
            self.imageView.image = self.images[i];
            
            UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(GestureAction:)];
            if (i == 0) {
                
                self.imageView.tag = self.images.count-1;
            
            } else if (i == self.images.count - 1) {
                
                self.imageView.tag = 0;
            
            } else {
            
                self.imageView.tag = i-1;
            
            }
            
            
            
            [self.imageView addGestureRecognizer:gesture];
            
            [_scrollView addSubview:self.imageView];
        
        }
        
        
        _scrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
        
        self.pageController = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height-20, self.frame.size.width, 20)];
        
        //设置总页数
        self.pageController.numberOfPages = self.images.count-2;
        self.pageController.pageIndicatorTintColor = [UIColor lightGrayColor];
        //设置显示某页面
        self.pageController.currentPage = 0;
        self.pageController.currentPageIndicatorTintColor = [UIColor orangeColor];
        
        
        self.autoCarousel = YES;
        self.carouselTime = 5;
        
        [self startTimer];
        
        
        [self addSubview:_scrollView];
        [self addSubview:self.pageController];
    }
    
    return _scrollView;
    
}

-(void)startTimer {
    
    if (self.autoCarousel == NO) {
        return;
    }

    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.carouselTime target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];


}

-(void)changeImage {

    CGPoint nowPosition = self.scrollView.contentOffset;
    CGPoint offset = CGPointMake(nowPosition.x+self.frame.size.width, 0);
    
    
    [self.scrollView setContentOffset:offset animated:YES];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGPoint point = scrollView.contentOffset;
    
    int page = point.x/self.frame.size.width - 1;
    self.pageController.currentPage = page;
    
    if (point.x == 0) {
    
        CGPoint offset = CGPointMake(self.frame.size.width*(self.images.count-2), 0);
        
        [self.scrollView setContentOffset:offset animated:NO];
        self.pageController.currentPage = self.images.count-2;
        
    } else if (point.x == self.frame.size.width*(self.images.count-1)) {
    
        CGPoint offset = CGPointMake(self.frame.size.width, 0);
        
        [self.scrollView setContentOffset:offset animated:NO];
        self.pageController.currentPage = 0;
    
    }
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    [self timerOff];
}

- (void)timerOff {
    
    [self.timer invalidate];
    self.timer=nil;

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    [self startTimer];

}

- (void)GestureAction:(UITapGestureRecognizer *)gesture {
    
    if ([self.delegate respondsToSelector:@selector(carouselView:clickImageView:index:)]) {
        
        [self.delegate carouselView:self clickImageView:(UIImageView *)(gesture.view) index:gesture.view.tag];
    }

}

@end
