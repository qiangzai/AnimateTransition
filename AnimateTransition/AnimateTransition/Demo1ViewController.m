//
//  Demo1ViewController.m
//  AnimateTransition
//
//  Created by  lizhongqiang on 2017/1/4.
//  Copyright © 2017年  lizhongqiang. All rights reserved.
//

#import "Demo1ViewController.h"
#import <Masonry.h>
#import "Demo1CollectionViewCell.h"
#import "Define.h"
#import "Demo1DetailViewController.h"
#import "Transition1NavigationAnimate.h"

@interface Demo1ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource, UINavigationControllerDelegate>
@property (nonatomic, strong) UICollectionView *collectView;
@property (nonatomic, strong) Transition1NavigationAnimate *pushAnimate;

@end

@implementation Demo1ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.delegate = nil;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.pushAnimate = [[Transition1NavigationAnimate alloc] init];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(kScreenWidth / 3 - 20, (kScreenWidth / 3 - 20) * 1.3);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = 20;
    flowLayout.minimumInteritemSpacing = 20;
    
    self.collectView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectView.delegate = self;
    self.collectView.dataSource = self;
    [self.collectView registerClass:[Demo1CollectionViewCell class] forCellWithReuseIdentifier:@"demo1Cell"];
    [self.view addSubview:self.collectView];
    [self.collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Demo1CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"demo1Cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Demo1CollectionViewCell *cell = (Demo1CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    self.targetView = cell;
    Demo1DetailViewController *detailVC = [[Demo1DetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return self.pushAnimate;
//        return nil;
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
