//
//  DCHomeVC.m
//  FireControl
//
//  Created by 杨忠平 on 2020/10/6.
//  Copyright © 2020 杨忠平. All rights reserved.
//

#import "DCHomeVC.h"
#import "SDCycleScrollView.h"
#import "SVHomeViewCell.h"
#import "DCCompanyNewsCell.h"
// 528
#define MaxChangeScrollY (kNavBarAndStatusBarHeight + 46)
static NSString *const SVHomeViewCellID = @"SVHomeViewCell";
static NSString *const DCCompanyNewsCellID = @"DCCompanyNewsCell";

@interface DCHomeVC ()<SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
///// 顶部view容器
//@property (weak, nonatomic) UIView *navView;
//@property (weak, nonatomic) UIView *navCoverView;
///// 自定义navigation View
//@property (weak, nonatomic) UIView *navigationView;
///// 自定义navigation View
//@property (weak, nonatomic) UIView *headAlphaView;
///// 当前
//@property (weak, nonatomic) CAGradientLayer *gradientLayer;
///// 列表
//@property (weak, nonatomic) UICollectionView *collectionView;
///// 顶部精选
//@property (weak, nonatomic) UIScrollView *headScrollView;
///// 搜索按钮
//@property (weak, nonatomic) UIButton *searchBtn;
//
///// 热搜数据
//@property (strong, nonatomic) NSArray *hotSearchData;
///// 顶部精选数据
//@property (strong, nonatomic) NSMutableArray *topRecommedData;
///// 轮播数据
//@property (strong, nonatomic) NSMutableArray *bannerViewData;
///// 列表数据
//@property (strong, nonatomic) NSMutableArray *collectionViewData;

//图片轮播
@property (nonatomic,strong) SDCycleScrollView *roastingView;
@property (weak, nonatomic) IBOutlet SDCycleScrollView *bannerView;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
//title数组
@property (nonatomic,strong) NSMutableArray *titleArr;
@property (nonatomic,strong) NSMutableArray *titleImg;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DCHomeVC

- (NSMutableArray *)titleArr
{
    if (_titleArr == nil) {
        _titleArr = [NSMutableArray arrayWithObjects:@"工程设计",@"工程设计",@"工程设计",@"工程设计",@"工程设计",@"工程设计",@"工程设计",@"工程设计", nil];
    }
    return _titleArr;
}

- (NSMutableArray *)titleImg
{
    if (_titleImg == nil) {
        _titleImg = [NSMutableArray arrayWithObjects:@"ic_xzhy",@"ic_xzhy",@"ic_xzhy",@"ic_xzhy",@"ic_xzhy",@"ic_xzhy",@"ic_xzhy",@"ic_xzhy", nil];
    }
    return _titleImg;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
   self.edgesForExtendedLayout = UIRectEdgeNone;
      
      NSArray *imagesURLStrings = @[
          @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
          @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
          @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
      ];
      
      // 图片配文字
      NSArray *titles = @[@"感谢您的支持，如果下载的",
                          @"如果代码在使用过程中出现问题",
                          @"您可以发邮件到gsdios@126.com",
                          @"感谢您的支持"
                          ];
      

      self.bannerView.imageURLStringsGroup = imagesURLStrings;
      self.bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
      self.bannerView.delegate = self;
      self.bannerView.titlesGroup = titles;
      self.bannerView.currentPageDotColor = [UIColor yellowColor]; // 自定义分页控件小圆标颜色
      self.bannerView.placeholderImage = [UIImage imageNamed:@"placeholder"];
    
    /// 加载UICollectionView
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"SVHomeViewCell" bundle:nil] forCellWithReuseIdentifier:SVHomeViewCellID];
  //  [self.view addSubview:self.roastingView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"DCCompanyNewsCell" bundle:nil] forCellReuseIdentifier:DCCompanyNewsCellID];
}

#pragma mark - tableView的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DCCompanyNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DCCompanyNewsCell"];
    if (!cell) {
        cell = [[DCCompanyNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DCCompanyNewsCellID];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


#pragma mark - UICollectionView的代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleArr.count;
}

//每个UICollectionView展示的内容
-( UICollectionViewCell *)collectionView:( UICollectionView *)collectionView cellForItemAtIndexPath:( NSIndexPath *)indexPath {
    SVHomeViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SVHomeViewCellID forIndexPath:indexPath];
    cell.titleLabel.text = self.titleArr[indexPath.row];
    cell.img.image = [UIImage imageNamed:self.titleImg[indexPath.row]];
    return cell;
}

- ( CGSize )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:( NSIndexPath *)indexPath {
//    return CGSizeMake (80,80);
    return CGSizeMake(ScreenW/5, 80);
}

//定义每个UICollectionView 的边距
-( UIEdgeInsets )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:( NSInteger )section {
    return UIEdgeInsetsMake (0,0,0,0);
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    [self.navigationController pushViewController:[NSClassFromString(@"DemoVCWithXib") new] animated:YES];
}






@end
