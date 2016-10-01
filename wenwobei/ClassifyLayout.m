//
//  ClassifyLayout.m
//  wenwobei
//
//  Created by HanQi on 16/9/29.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "ClassifyLayout.h"
#import "ClassifyCollectionViewSection.h"
#import "Config.h"

@interface ClassifyLayout()

@property (nonatomic, strong) NSMutableArray *attributes;

@end

@implementation ClassifyLayout

- (NSMutableArray *)attributes {

    if (!_attributes) {
    
        _attributes = [NSMutableArray array];
    
    }
    
    return _attributes;

}

- (void)createAttributes {

    NSInteger sectionCount = [self.collectionView numberOfSections];
    
    for (int i = 0; i < sectionCount; i++) {
        
        UICollectionViewLayoutAttributes *headerAttr = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:[[NSIndexPath alloc] initWithIndex:i]];
        
        UICollectionViewLayoutAttributes *sectionAttr = [self layoutAttributesForDecorationViewOfKind:@"section" atIndexPath:[[NSIndexPath alloc] initWithIndex:i]];
        
        [self.attributes addObject:headerAttr];
        [self.attributes addObject:sectionAttr];
        
        NSInteger cellCount = [self.collectionView numberOfItemsInSection:i];
        
        for (int j = 0; j < cellCount; j++) {
        
            NSIndexPath *cellIndexPath = [NSIndexPath indexPathForItem:j inSection:i];
            
            UICollectionViewLayoutAttributes *cellAttr = [self layoutAttributesForItemAtIndexPath:cellIndexPath];
            [self.attributes addObject:cellAttr];
            
        
        }
        
        
    }

    
}



- (void)prepareLayout {

    [super prepareLayout];
    
    [self.attributes removeAllObjects];
    [self createAttributes];
    
    [self registerClass:[ClassifyCollectionViewSection class] forDecorationViewOfKind:@"section"];
    

}

- (CGSize)collectionViewContentSize {
    
    NSInteger section = [self.collectionView numberOfSections];
    
    float cellHeight = 0;
    for (int i = 0; i < section; i++) {
        
        NSInteger cellForSection = [self.collectionView numberOfItemsInSection:i];
//        cellForSection += 1;
        cellForSection -= 6;
        cellHeight += 80;
        if (cellForSection > 0) {
            
            int row = (int)cellForSection/4;
            
            if ((int)cellForSection%4 != 0) {
                
                row++;
                
            }
            
            cellHeight = cellHeight + row*40;
            
        }
        
    }
    
    float countHeight = cellHeight + (section-1) * 10 - 20;
    
    return CGSizeMake(SCREEN_WIDTH, countHeight+40);
    
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    return self.attributes;
    

}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSInteger section = indexPath.section;
    NSInteger item = indexPath.item;
    
    float cellHeight = 0;
    for (int i = 0; i < section; i++) {
    
        NSInteger cellForSection = [self.collectionView numberOfItemsInSection:i];
//        cellForSection += 1;
        cellForSection -= 6;
        cellHeight += 80;
        if (cellForSection > 0) {
            
            int row = (int)cellForSection/4;
            
            if ((int)cellForSection%4 != 0) {
            
                row++;
                
            }

            cellHeight = cellHeight + row*40;
            
        }
    
    }
    
    float countHeight = cellHeight + (section-1) * 10 - 20;
    
    int row;
    int column;
    item++;
    if (item < 7) {
        
        column = item % 3;
        
        if (column == 0) {
        
            column += 3;
            
            row = (int)(item / 3);
            
            if (row > 0) {
            
                row -= 1;
            
            }
            
        } else {
        
            row = (int)(item / 3);
        
        }
    
        
        
        
    
    } else {
    
        int itemR = (int)(item - 6);
        row += 2;
        
        column = itemR % 4;
        
        if (column == 0) {
        
            column += 4;
            
            row += (int)(itemR / 4);
            
            if (row > 0) {
                
                row -= 1;
                
            }
        
        } else {
        
            row += (int)(itemR / 4);
        
        }
    
    }
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    if (item < 7) {
    
        attrs.frame = CGRectMake(10 + (SCREEN_WIDTH - 20)/4 + (column-1)*(SCREEN_WIDTH - 20)/4, countHeight + (row+1)*40, (SCREEN_WIDTH - 20)/4, 40);
        
    } else {
    
        attrs.frame = CGRectMake(10 + (column-1)*(SCREEN_WIDTH - 20)/4, countHeight + (row+1)*40, (SCREEN_WIDTH - 20)/4, 40);
        
    }
    
    return attrs;

}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    
    float cellHeight = 0;
    for (int i = 0; i < section; i++) {
        
        NSInteger cellForSection = [self.collectionView numberOfItemsInSection:i];
        //        cellForSection += 1;
        cellForSection -= 6;
        cellHeight += 80;
        if (cellForSection > 0) {
            
            int row = (int)cellForSection/4;
            
            if ((int)cellForSection%4 != 0) {
                
                row++;
                
            }
            
            cellHeight = cellHeight + row*40;
            
        }
        
    }
    
    float countHeight = cellHeight + (section-1) * 10 - 20;

    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:indexPath];
    attr.frame = CGRectMake(10, countHeight + 40, (SCREEN_WIDTH-20)/4, 80);
    return attr;

}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {

    NSInteger section = indexPath.section;
    
    float cellHeight = 0;
    for (int i = 0; i < section; i++) {
        
        NSInteger cellForSection = [self.collectionView numberOfItemsInSection:i];
//        cellForSection += 1;
        cellForSection -= 6;
        cellHeight += 80;
        if (cellForSection > 0) {
            
            int row = (int)cellForSection/4;
            
            if ((int)cellForSection%4 != 0) {
                
                row++;
                
            }
            
            cellHeight = cellHeight + row*40;
            
        }
        
    }
    
    float countHeight = cellHeight + (section-1) * 10 - 20;
    
    float ownHeight = 0;
    NSInteger cellForSection = [self.collectionView numberOfItemsInSection:section];
//    cellForSection += 1;
    cellForSection -= 6;
    ownHeight += 80;
    if (cellForSection > 0) {
        
        int row = (int)cellForSection/4;
        
        if ((int)cellForSection%4 != 0) {
            
            row++;
            
        }
        
        ownHeight = ownHeight + row*40;
        
    }
    
    
    UICollectionViewLayoutAttributes* attr = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:@"section" withIndexPath:indexPath];

    attr.frame = CGRectMake(10, countHeight+40, SCREEN_WIDTH-20, ownHeight);
    attr.zIndex = -1;
    return attr;
    
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {

    return YES;
    
}

@end
