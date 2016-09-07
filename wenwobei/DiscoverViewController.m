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

@interface DiscoverViewController() <UITableViewDelegate, UITableViewDataSource, CarouseViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *carouselImages;
@property (nonatomic, strong) MeView *meView;

@property (nonatomic, strong) NSMutableArray *cellData;
@property (nonatomic, assign) int pageNum;
@property (nonatomic, strong) UIButton *titleButton;

@end

@implementation DiscoverViewController

- (void)viewWillAppear:(BOOL)animated {
   
}

- (void)viewDidLoad {
    self.pageNum = 0;
    self.cellData = [NSMutableArray array];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        NSBlockOperation *taskNetwork = [NSBlockOperation blockOperationWithBlock:^{
            self.pageNum = 0;
            [self.cellData removeAllObjects];
            [self getInfoFromNetwork];
        }];
        [taskNetwork start];
    }];
    
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
    
    [self carouselImages];
    
    [self tableView];
    
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        NSBlockOperation *taskNetwork = [NSBlockOperation blockOperationWithBlock:^{
            [self getInfoFromNetwork];
        }];
        [taskNetwork start];
    }];
    [self.tableView.mj_footer endRefreshing];
    
    
    [self meView];
    
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    [self.view addGestureRecognizer:gesture];
    
}

- (void)swipeGesture:(UIPanGestureRecognizer *)gesture {

    NSLog(@"%@----------ok", gesture);

}

- (void)getInfoFromNetwork {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manger = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSString *urlStr = @"http://www.wenwobei.com/ask/allask";
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"username"] = @"573b0c63ad5b950057533669";
    params[@"size"] = @"20";
    params[@"page"] = [NSString stringWithFormat:@"%d", self.pageNum];
    
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlStr parameters:params error:nil];
    
    NSURLSessionDataTask *dataTask = [manger dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            
//            NSLog(@"%@", responseObject);
            NSDictionary *resulte = responseObject;
            NSString *resultCode = [NSString stringWithFormat:@"%@", [resulte valueForKey:@"code"]];
//            NSLog(@"%@", resultCode.class);
            if ([resultCode  isEqualToString: @"200"]) {
            
                NSArray *data = [resulte valueForKey:@"data"];
                
                NSArray *infoArray = [InfoNetworkModel analysisNetworkData:data];
                
                [self.cellData addObjectsFromArray:[SimpleTableViewCellModel analysisFromInfoNetworkMode:infoArray]];
                
                self.pageNum++;
                [self.tableView reloadData];
                [self.tableView.mj_header endRefreshing];
                [self.tableView.mj_footer endRefreshing];
            }
            
        }
    }];
    [dataTask resume];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 125;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.cellData.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    SimpleTableViewCell *cell = [[SimpleTableViewCell alloc] initWithReusedID:@"discoverTableViewCell"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.cellData = self.cellData[indexPath.row];
    
    SimpleTableViewCellModel *model = self.cellData[indexPath.row];
    
    [cell.userHeadImageView sd_setImageWithURL:[NSURL URLWithString:model.createByUrl] placeholderImage:[UIImage imageNamed:@"default_userhead"]];
    
    return cell;
    
}

- (UITableView *)tableView {

    if (!_tableView) {
    
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        CarouselView *carouselView = [[CarouselView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 136) imageArray:self.carouselImages];
        carouselView.delegate = self;
        _tableView.tableHeaderView = carouselView;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = HQ_RGBA(244, 232, 227, 1);
        
        [self.view addSubview:_tableView];
    
    }
    
    return _tableView;


}

-(NSMutableArray *)carouselImages {

    if (!_carouselImages) {
    
        _carouselImages = [NSMutableArray array];
        
        for (int i = 0; i < 3; i++) {
        
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d_banner", i+1]];
            
            [_carouselImages addObject:image];
        
        }
    
    }
    return _carouselImages;

}

-(void) carouselView:(CarouselView *)view clickImageView:(UIImageView *)imageView index:(NSInteger)index {

    NSLog(@"click--->%ld", index);
    
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

@end
