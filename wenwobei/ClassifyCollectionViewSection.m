//
//  ClassifyCollectionViewSection.m
//  wenwobei
//
//  Created by HanQi on 2016/9/30.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "ClassifyCollectionViewSection.h"
#import "Config.h"

@interface ClassifyCollectionViewSection()

@property (nonatomic, strong) UIColor *rowColor;
@property (nonatomic, strong) UIColor *borderColor;

@end

@implementation ClassifyCollectionViewSection

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.layer.borderColor = self.borderColor.CGColor;
        self.layer.borderWidth = 1.3;
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/4, 80)];
        headerView.backgroundColor = self.borderColor;
        [self addSubview:headerView];
        
//        int countRow = (self.frame.size.height / 40);
        int countRow = 15;
        
        for (int i = 0; i < countRow; i++) {
        
            UIView *view = [[UIView alloc] init];
            
            if (i < 2) {
            
                view.frame = CGRectMake(self.frame.size.width/4, 40*(i), self.frame.size.width * 3/4, 40);
                
            } else {
            
                view.frame = CGRectMake(0, 40*(i), self.frame.size.width, 40);
                
            }
            
            if (i % 2 == 0) {
            
                view.backgroundColor = self.rowColor;
                
            
            } else {
            
                view.backgroundColor = [UIColor whiteColor];
                
            }
            
            [self addSubview:view];
            
        }
        
        for (int i = 0; i < countRow; i++) {
            
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = HQ_RGBA(240, 240, 240, 1);
            
            if (i < 2) {
            
                view.frame = CGRectMake(self.frame.size.width/4, 40*(i+1) - 0.5, self.frame.size.width * 3/4, 1);
                
            } else {
                
                view.frame = CGRectMake(0, 40*(i+1) - 0.5, self.frame.size.width, 1);
            
            }
            
            [self addSubview:view];
            
        }
        
        for (int i = 1; i < 4; i++) {
            
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = HQ_RGBA(240, 240, 240, 1);
            
            if (i == 1) {
            
                view.frame = CGRectMake(self.frame.size.width*i/4-0.5, 80, 1, countRow * 40);
                
            } else {
            
                view.frame = CGRectMake(self.frame.size.width*i/4-0.5, 0, 1, countRow * 40);
            }
            
            [self addSubview:view];
            
        }
        
        
    }
    return self;
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {

    UICollectionViewLayoutAttributes *attr = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    
    return attr;

}

- (UIColor *)borderColor {

    if (!_borderColor) {
    
        _borderColor = HQ_RGBA(246, 196, 163, 1);
        
    }
    
    return _borderColor;
    
}

- (UIColor *)rowColor {

    if (!_rowColor) {
    
        _rowColor = HQ_RGBA(252, 249, 247, 1);
        
    }
    
    return _rowColor;

}

@end
