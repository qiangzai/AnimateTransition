//
//  HomeViewController.m
//  AnimateTransition
//
//  Created by  lizhongqiang on 2017/1/4.
//  Copyright © 2017年  lizhongqiang. All rights reserved.
//

#import "HomeViewController.h"
#import <Masonry.h>
#import "Demo1ViewController.h"
#import "Demo2ViewController.h"
#import "Demo3ViewController.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *homeTableView;
@property (nonatomic, strong) NSArray *listArr;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"transition animate";
    self.listArr = @[@"collectionviewcontroller",@"push && pop",@"push && pop && path"];
    self.homeTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.homeTableView.dataSource = self;
    self.homeTableView.delegate = self;
    self.homeTableView.rowHeight = 70;
    [self.homeTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.homeTableView];
    [self.homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.listArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        Demo1ViewController *demo1VC = [[Demo1ViewController alloc] init];
        [self.navigationController pushViewController:demo1VC animated:YES];
    }else if (indexPath.row == 1) {
        Demo2ViewController *demo2VC = [[Demo2ViewController alloc] init];
        [self.navigationController pushViewController:demo2VC animated:YES];
    }else if (indexPath.row == 2) {
        Demo3ViewController *demo3VC = [[Demo3ViewController alloc] init];
        [self.navigationController pushViewController:demo3VC animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
