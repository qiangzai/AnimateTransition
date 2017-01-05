//
//  Demo1DetailViewController.m
//  AnimateTransition
//
//  Created by  lizhongqiang on 2017/1/5.
//  Copyright © 2017年  lizhongqiang. All rights reserved.
//

#import "Demo1DetailViewController.h"
#import <Masonry.h>
#import "Transition1NavigationAnimate.h"

@interface Demo1DetailViewController ()<UINavigationControllerDelegate>
@property (nonatomic, strong) Transition1NavigationAnimate *popAnimate;
@end

@implementation Demo1DetailViewController
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.popAnimate = [[Transition1NavigationAnimate alloc] initWithAnimateType:animatePop andDuration:0.5f];
    
    self.targetView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 100, 200)];
    self.targetView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.targetView];
//    self.targetView.frame = CGRectMake(100, 0, 100, 200);
//    [self.targetView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(100, 200));
//        make.centerX.equalTo(self.view.mas_centerX);
//        make.top.equalTo(self.view.mas_top);
//    }];
    
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPop) {
        return self.popAnimate;
    }else {
        return nil;
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
