//
//  DiscoverViewController.m
//  wenwobei
//
//  Created by HanQi on 16/8/9.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "DiscoverViewController.h"
#import "Config.h"
#import "CarouselView.h"
#import "SimpleTableViewCell.h"
#import "AFNetworking.h"
#import "InfoNetworkModel.h"
#import "SimpleTableViewCellModel.h"
#import "MJRefresh.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "DetailViewController.h"
#import "MeView.h"
#import "UserInfo.h"
#import "DataBase.h"
#import "CarouselDataModel.h"
#import "SDCycleScrollView.h"
#import "WebViewController.h"
#import "TableHeaderView.h"
#import "ImageTableViewCell.h"

@interface DiscoverViewController() <UITableViewDelegate, UITableViewDataSource, SDCycleScrollViewDelegate, TableHeaderViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *carouselModel;
@property (nonatomic, strong) MeView *meView;

@property (nonatomic, strong) NSMutableArray *cellData;
@property (nonatomic, strong) UIButton *titleButton;
@property (nonatomic, strong) DataBase *dataBase;
@property (nonatomic, strong) UserInfo *userInfo;

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;


@end

@implementation DiscoverViewController

- (void)viewWillAppear:(BOOL)animated {
   
}

- (UserInfo *)userInfo {

    if (!_userInfo) {
    
        _userInfo = [UserInfo shareUserInfo];
    
    }
    return _userInfo;

}

- (NSMutableArray *)cellData {

    if (!_cellData) {
    
        _cellData = [NSMutableArray array];
        
        self.dataBase = [DataBase shareDataBase];
        
        NSArray *infoFromDB = [self.dataBase selectAllFromTable:@"allinfo"];
        
        NSArray *infos = [SimpleTableViewCellModel analysisFromInfoNetworkMode:infoFromDB];
        
        if (infos.count != 0) {
            
            [_cellData addObjectsFromArray:infos];
            
        } else {
        
            [self getInfoFromNetworkWithType:@"updata"];
        
        }
        
    
    }
    
    return _cellData;
    

}

- (NSMutableArray *)carouselModel {

    if (!_carouselModel) {
    
        _carouselModel = [NSMutableArray array];
        
        _carouselModel = [[NSMutableArray alloc] initWithArray:[self.dataBase selectAllFromTable:@"carousel"]];
        NSLog(@"%@", _carouselModel);
        
        [self cycleScrollView];
        
        if (_carouselModel.count <= 0) {
            
            [self getCarouselImageUrl];
        
        }
        
    
    }
    
    return _carouselModel;
    

}

- (SDCycleScrollView *)cycleScrollView {

    if (!_cycleScrollView) {
        
        NSMutableArray *imageStrings = [NSMutableArray array];
        
        for (int i = 0; i < self.carouselModel.count; i++) {
            
            CarouselDataModel *model = self.carouselModel[i];
            [imageStrings addObject:model.carouselImage];
            
        }
        
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180) delegate:self placeholderImage:[UIImage imageNamed:@"default_userhead"]];
        
        _cycleScrollView.imageURLStringsGroup = imageStrings;
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 290)];
        view.backgroundColor = [UIColor whiteColor];
        
        TableHeaderView *tableHeaderView = [[TableHeaderView alloc] initWithFrame:CGRectMake(0, 180, SCREEN_WIDTH, 110)];
        tableHeaderView.delegate = self;
        [view addSubview:tableHeaderView];
        
        [view addSubview:_cycleScrollView];
        
        self.tableView.tableHeaderView = view;

    
    
    }
    
    return _cycleScrollView;

}

- (void)viewDidLoad {
    
        
    [self userInfo];
    
    [self cellData];
    
    [self carouselModel];
    
    if (self.cellData.count == 0) {
        [self.tableView.mj_header beginRefreshing];
    }
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 60)];
    titleLable.center = CGPointMake(SCREEN_WIDTH/2, 35);
    titleLable.text = @"问我－美食";
    titleLable.font = [UIFont systemFontOfSize:20 weight:0.1];
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.textColor = TITLE_COLER;
    self.navigationItem.titleView = titleLable;

//    UIBarButtonItem *titleButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(navigationButtonClick:)];
    
    self.titleButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [self.titleButton setImage:[UIImage imageNamed:@"default_userhead"] forState:UIControlStateNormal];
    self.titleButton.imageView.layer.cornerRadius = 20;
    self.titleButton.imageView.layer.masksToBounds = YES;
    [self.titleButton addTarget:self action:@selector(navigationButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    titleButton.backgroundColor = [UIColor cyanColor];
    
    UIBarButtonItem *titleButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.titleButton];
    [self.navigationItem setLeftBarButtonItem:titleButtonItem];
    
    [self tableView];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        NSBlockOperation *taskNetwork = [NSBlockOperation blockOperationWithBlock:^{
//            [self.cellData removeAllObjects];
            [self getInfoFromNetworkWithType:@"updata"];
            [self getCarouselImageUrl];
        }];
        
        [taskNetwork start];
    }];
    
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        NSBlockOperation *taskNetwork = [NSBlockOperation blockOperationWithBlock:^{
            [self getInfoFromNetworkWithType:@"add"];
        }];
        [taskNetwork start];
    }];

    
    
    [self meView];
    
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    [self.view addGestureRecognizer:gesture];
    
}

- (void)swipeGesture:(UIPanGestureRecognizer *)gesture {

    NSLog(@"%@----------ok", gesture);

}

- (void)getInfoFromNetworkWithType:(NSString *)type {
    
    if ([type isEqualToString:@"updata"]) {
    
        self.userInfo.discoverPageNum = 0;
        [self.dataBase updataUserInfo];
    
    }
    
    @try {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manger = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        NSString *urlStr = @"http://www.wenwobei.com/ask/allask";
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        
        params[@"username"] = self.userInfo.userID;
        params[@"size"] = @"20";
        params[@"page"] = [NSString stringWithFormat:@"%d", self.userInfo.discoverPageNum];
        
        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlStr parameters:params error:nil];
        
        NSURLSessionDataTask *dataTask = [manger dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
            if (error) {
                NSLog(@"Error: %@", error);
            } else {
                
                NSDictionary *resulte = responseObject;
                NSString *resultCode = [NSString stringWithFormat:@"%@", [resulte valueForKey:@"code"]];
                if ([resultCode  isEqualToString: @"200"]) {
                    
                    NSArray *data = [resulte valueForKey:@"data"];
                    
                    NSArray *infoArray = [InfoNetworkModel analysisNetworkData:data];
                    
                    if (self.userInfo.discoverPageNum == 0) {
                        
                        [self.dataBase clearForTable:@"allinfo"];
                        [self.cellData removeAllObjects];
                        [self.tableView reloadData];
                    
                    }
                    
                    [self.dataBase insertArray:infoArray tableName:@"allinfo"];
                    
                    [self.cellData addObjectsFromArray:[SimpleTableViewCellModel analysisFromInfoNetworkMode:infoArray]];
                    
                    [self.tableView reloadData];
                    self.userInfo.discoverPageNum++;
                    [self.dataBase updataUserInfo];
                    
                    [self.tableView.mj_header endRefreshing];
                    [self.tableView.mj_footer endRefreshing];
                    
                }
                
            }
        }];
        [dataTask resume];
        
    } @catch (NSException *exception) {
        
    }

}

- (NSArray *)getCarouselImageUrl {
    
    NSMutableArray *carouelModel = [NSMutableArray array];

    @try {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manger = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        NSString *urlStr = @"http://www.wenwobei.com/carousel/getcarouselinfo";
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        
        params[@"username"] = self.userInfo.userID;
        params[@"type"] = @"show";
        
        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlStr parameters:params error:nil];
        
        NSURLSessionDataTask *dataTask = [manger dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
            if (error) {
                NSLog(@"Error: %@", error);
            } else {
                
                NSDictionary *resulte = responseObject;
                
//                NSLog(@"%@", resulte);
                NSString *resultCode = [NSString stringWithFormat:@"%@", [resulte valueForKey:@"code"]];
                if ([resultCode  isEqualToString: @"200"]) {
                    
                    [carouelModel addObjectsFromArray:[CarouselDataModel initWithData:[resulte valueForKey:@"data"]]];
                    
                    
                    
                    NSMutableArray *imageStrings = [NSMutableArray array];
                    
                    [self.carouselModel removeAllObjects];
                    [self.dataBase clearForTable:@"carousel"];
                    
                    for (int i = 0; i < carouelModel.count; i++) {
                        CarouselDataModel *model = carouelModel[i];
                        [imageStrings addObject:model.carouselImage];
                        
                        [self.carouselModel addObject:carouelModel[i]];
                        
                        [self.dataBase insert:carouelModel[i] talbeName:@"carousel"];
                        
                        
                    }
                    
                    self.cycleScrollView.imageURLStringsGroup = imageStrings;
                    
                    
                    
                }
                
            }
        }];
        [dataTask resume];
        
        
    } @catch (NSException *exception) {
        
    }
    
    return carouelModel;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    SimpleTableViewCellModel *model = self.cellData[indexPath.row];
    if (model.askImage.count == 0) {
        return 120;
    } else {
    
        return 320;
        
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.cellData.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ImageTableViewCell *cell = [ImageTableViewCell cellWithTableView:tableView identifier:@"cell" cellData:self.cellData[indexPath.row]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.cellData = self.cellData[indexPath.row];
    
//    SimpleTableViewCellModel *model = self.cellData[indexPath.row];
//    
//    [cell.photoImageView sd_setImageWithURL:[NSURL URLWithString:model.askImage[0]] placeholderImage:[UIImage imageNamed:@"default_userhead"]];
//    
//    [cell.userHeadImageView sd_setImageWithURL:[NSURL URLWithString:model.createByUrl] placeholderImage:[UIImage imageNamed:@"defaule_userhead"]];
    
    return cell;
    
}

- (UITableView *)tableView {

    if (!_tableView) {
    
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
//        CarouselView *carouselView = [[CarouselView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 136) imageArrayString:<#(NSArray *)#>];
//        carouselView.delegate = self;
//        _tableView.tableHeaderView = carouselView;
        
        
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = HQ_RGBA(244, 232, 227, 1);
        
        [self.view addSubview:_tableView];
    
    }
    
    return _tableView;


}


- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {

    NSLog(@"click----------->%ld", index);
    
    
    WebViewController *vc = [[WebViewController alloc] initWithData:self.carouselModel[index]];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];

}

- (void)navigationButtonClick:(UIBarButtonItem *)buttton {

    
//    MeViewController *vc = [[MeViewController alloc] init];
//    
//    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//    
//    self.modalPresentationStyle = UIModalPresentationCurrentContext;
//    
//    [self presentViewController:vc animated:NO completion:^{
//    
//        vc.view.center = CGPointMake(-SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
//        
//        [UIView animateWithDuration:0.3 animations:^{
//            vc.view.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
//        }];
//        
//    }];
    
//    self.tabBarController.tabBar.hidden = YES;
//    self.navigationController.navigationBar.hidden = YES;
    
    self.meView.center = CGPointMake(-SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    [UIView animateWithDuration:0.3 animations:^{
        
        self.meView.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
        
        self.navigationController.navigationBar.center = CGPointMake(SCREEN_WIDTH*3/2 - 70, self.navigationController.navigationBar.center.y);
        
        self.tabBarController.tabBar.center = CGPointMake(SCREEN_WIDTH*3/2 - 70, self.tabBarController.tabBar.center.y);
        
        self.tableView.center = CGPointMake(SCREEN_WIDTH*3/2 - 70, SCREEN_HEIGHT/2);
        
        self.titleButton.alpha = 0;
        
        
    }];
    

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    DetailViewController *vc = [[DetailViewController alloc] initWithData:self.cellData[indexPath.row]];
    
//    InfoNetworkModel *model = [[InfoNetworkModel alloc] initWithSimpleTableViewCellModel:self.cellData[indexPath.row]];
    
//    NSLog(@"%@", model);
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];


}

- (MeView *)meView {

    if (!_meView) {
        
        _meView = [[MeView alloc] init];
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(meViewClick:)];
        [_meView addGestureRecognizer:gesture];
        
        
        
        [self.view addSubview:_meView];
        
    
    }
    return _meView;

}

- (void)meViewClick:(UITapGestureRecognizer *)gesture {

    [UIView animateWithDuration:0.3 animations:^{
        
        self.meView.center = CGPointMake(-SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
        
        self.navigationController.navigationBar.center = CGPointMake(SCREEN_WIDTH*1/2, self.navigationController.navigationBar.center.y);
        
        self.tabBarController.tabBar.center = CGPointMake(SCREEN_WIDTH/2, self.tabBarController.tabBar.center.y);
        
        self.tableView.center = CGPointMake(SCREEN_WIDTH*1/2, SCREEN_HEIGHT/2);
        
        self.titleButton.alpha = 1;
        
    }];

}

- (void)tableHeaderView:(TableHeaderView *)view didClick:(UIView *)clickView atIndex:(NSInteger)index {

    NSLog(@"click------>%ld", index);
    
    
}

@end
