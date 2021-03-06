//
//  ViewController.m
//  YWLogisticsQueryDemo
//
//  Created by Candy on 2018/2/10.
//  Copyright © 2018年 com.scsskc. All rights reserved.
//

#import "ViewController.h"

#import "LogisticsQueryViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"YWLogisticsQueryDemo";
    
    // 查询最新物流信息按钮
    UIButton *queryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    queryBtn.frame = CGRectMake(0, 0, 200, 50);
    queryBtn.center = self.view.center;
    [queryBtn setTitle:@"点我查询最新物流信息" forState:UIControlStateNormal];
    [queryBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [queryBtn setBackgroundColor:[UIColor orangeColor]];
    [queryBtn addTarget:self action:@selector(queryBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:queryBtn];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:nil];

}

- (void)queryBtnAction {
    
    // 这里的 'shentong' 等参数 来自快递100 帮助文档 - https://www.kuaidi100.com/openapi/api_post.shtml
    YWLogisticModel *model = [[YWLogisticModel alloc] init];
    model.logisticCode = @"shentong";
    model.logisticCompany = @"申通快递";
    model.logisticNumber = @"3345541356152";
    model.goodsPicUrlStr = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3696414240,752471806&fm=58";
//    model.goodsPicUrlStr = @"http://img.daimg.com/uploads/allimg/171228/3-1G22Q34R8.jpg";
    LogisticsQueryViewController *logisticsQueryVC = [[LogisticsQueryViewController alloc] init];
    logisticsQueryVC.model = model;
    
    [self.navigationController pushViewController:logisticsQueryVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
