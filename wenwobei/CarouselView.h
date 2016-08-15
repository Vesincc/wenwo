//
//  CarouselView.h
//  Carousel
//
//  Created by HanQi on 16/7/27.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CarouselView;

@protocol CarouseViewDelegate <NSObject>

-(void) carouselView:(CarouselView *)view clickImageView:(UIImageView *)imageView index:(NSInteger)index;

@end

@interface CarouselView : UIView

@property (nonatomic, assign) BOOL autoCarousel;
@property (nonatomic, assign) float carouselTime;

@property (nonatomic, weak) id <CarouseViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)images;

@end
