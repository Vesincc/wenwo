//
//  SpecialViewController.m
//  wenwobei
//
//  Created by HanQi on 16/9/24.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SpecialViewController.h"
#import "Config.h"
#import "AFNetworking.h"
#import "UserInfo.h"
#import "CarouselDataModel.h"
#import "SpecialTableViewCell.h"
#import "WebViewController.h"

@interface SpecialViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UserInfo *userInfo;

@property (nonatomic, strong) NSMutableArray *carouselModel;

@end

@implementation SpecialViewController

- (void)viewWillAppear:(BOOL)animated {

    self.title = @"美食专题";

}

- (void)viewDidLoad {
    
    [self userInfo];
    
    [self getData];
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
//    self.title = @"美食专题";
    
    [self tableView];
    
}

- (UserInfo *)userInfo {

    if (!_userInfo) {
    
        _userInfo = [UserInfo shareUserInfo];
        
    }
    
    return _userInfo;

}

- (UITableView *)tableView {

    if (!_tableView) {
    
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self.view addSubview:_tableView];
        
    }
    
    return _tableView;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

//    return 4;
    return self.carouselModel.count;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 160;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    SpecialTableViewCell *cell = [SpecialTableViewCell cellWithTableView:tableView identifier:@"special"];
    cell.model = self.carouselModel[indexPath.row];
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    WebViewController *vc = [[WebViewController alloc] initWithData:self.carouselModel[indexPath.row]];
    
    [self.navigationController pushViewController:vc animated:YES];

}

- (void)getData {

    NSMutableArray *carouelModel = [NSMutableArray array];
    
    @try {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manger = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        NSString *urlStr = @"http://www.wenwobei.com/carousel/getcarouselinfo";
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        
        params[@"username"] = self.userInfo.userID;
        params[@"type"] = @"all";
        
        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlStr parameters:params error:nil];
        
        NSURLSessionDataTask *dataTask = [manger dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
            if (error) {
                NSLog(@"Error: %@", error);
            } else {
                
                NSDictionary *resulte = responseObject;
                
//                                NSLog(@"%@", resulte);
                NSString *resultCode = [NSString stringWithFormat:@"%@", [resulte valueForKey:@"code"]];
                if ([resultCode  isEqualToString: @"200"]) {
                    
                    [carouelModel addObjectsFromArray:[CarouselDataModel initWithData:[resulte valueForKey:@"data"]]];
                    
                    
                    [self.carouselModel removeAllObjects];
                    self.carouselModel = [NSMutableArray arrayWithArray:carouelModel];
                    [self.tableView reloadData];
                    
                    
                    
                    
                }
                
            }
        }];
        [dataTask resume];
        
        
    } @catch (NSException *exception) {
        
    }
    


}


@end
