//
//  ClassifyViewController.m
//  wenwobei
//
//  Created by HanQi on 16/9/24.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "ClassifyViewController.h"
#import "Config.h"
#import "ClassifyCollectionViewCell.h"
#import "ClassifyCollectionViewHeader.h"
#import "ClassifyLayout.h"
#import "AFNetworking.h"

@interface ClassifyViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *allKeys;
@property (nonatomic, strong) NSMutableArray *valueForKey;

@end

@implementation ClassifyViewController

- (void)viewDidLoad {
    
    [self getTagForNet];
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self collectionView];
    
    
    
}

- (NSMutableArray *)valueForKey {

    if (!_valueForKey) {
    
        _valueForKey = [NSMutableArray array];
    
    }
    
    return _valueForKey;

}

- (NSMutableArray *)allKeys {

    if (!_allKeys) {
    
        _allKeys = [NSMutableArray array];
        
    }
    
    return _allKeys;

}

- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
//        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
//        
        ClassifyLayout *layout = [[ClassifyLayout alloc] init];

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[ClassifyCollectionViewCell class] forCellWithReuseIdentifier:@"ClassifyCell"];
        
        [_collectionView registerClass:[ClassifyCollectionViewHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        
        [self.view addSubview:_collectionView];
        
    }
    
    return _collectionView;

}

- (void)viewWillAppear:(BOOL)animated {

    self.title = @"分类查找";
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    NSArray *arr = self.valueForKey[indexPath.section];
    NSLog(@"%ld----%ld----->%@", indexPath.section, indexPath.item, arr[indexPath.item]);
    

}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    NSArray *arr = self.valueForKey[section];
    return arr.count;

}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    ClassifyCollectionViewCell *cell = (ClassifyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ClassifyCell" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor yellowColor];
    NSArray *arr = self.valueForKey[indexPath.section];
    cell.textLable.text = arr[indexPath.item];
    
//    NSLog(@"%@", self.valueForKey[indexPath.section]);
    
    return cell;
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    ClassifyCollectionViewHeader *view = (ClassifyCollectionViewHeader *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
//    view.backgroundColor = [UIColor redColor];
    
    view.textLable.text = self.allKeys[indexPath.section];
    
    return view;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {

    return CGSizeMake(100, 80);
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return self.valueForKey.count;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake(100, 100);
}

- (void)getTagForNet {

    @try {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manger = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        NSString *urlStr = @"http://www.wenwobei.com/ask/getalltag";
        
        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlStr parameters:nil error:nil];
        
        NSURLSessionDataTask *dataTask = [manger dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
            if (error) {
                NSLog(@"Error: %@", error);
            } else {
                
                NSDictionary *resulte = responseObject;
                
                
                
                NSString *resultCode = [NSString stringWithFormat:@"%@", [resulte valueForKey:@"code"]];
                if ([resultCode  isEqualToString: @"200"]) {
                    
                    NSDictionary *type = [resulte valueForKey:@"type"];
                    
                    self.allKeys = [[NSMutableArray alloc] initWithArray:[type allKeys]];
                    
//                    NSLog(@"%@", self.allKeys);
                    
                    for (int i = 0; i < self.allKeys.count; i++) {
                        
                        NSMutableArray *array = [NSMutableArray array];
                        
                        NSArray *value = [type valueForKey:[NSString stringWithFormat:@"%@", self.allKeys[i]]];
                        
//                        NSLog(@"%@", value);
                        
                        for (int j = 0; j < value.count; j++) {
                            
                            NSString *str = [value[j] valueForKey:@"tagName"];
                            
//                            NSLog(@"%@", str);
                            
                            [array addObject:str];
                            
                        }
                        
                        [self.valueForKey addObject:array];
//                        NSLog(@"%@", self.valueForKey);
                        
                        
                    }
                    
                    for (int i = 0; i < self.allKeys.count; i++) {
                    
                        if ([self.allKeys[i] isEqualToString:@"热门"]) {
                        
                            [self.allKeys exchangeObjectAtIndex:0 withObjectAtIndex:i];
                            [self.valueForKey exchangeObjectAtIndex:0 withObjectAtIndex:i];
                        
                        }
                    
                    }
                    
                    [self.collectionView reloadData];
                    

                }
                
            }
        }];
        [dataTask resume];
        
    } @catch (NSException *exception) {
        
    }

}

@end
