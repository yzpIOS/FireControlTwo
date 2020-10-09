//
//  SVLandingVC.m
//  SAVI
//
//  Created by Sorgle on 17/4/20.
//  Copyright © 2017年 Sorgle. All rights reserved.
//

#import "SVLandingVC.h"
//#import "SVRegisteredOneVC.h"
//#import "SVRetrievePasswordOneVC.h"
//#import "JWXUtils.h"
//#import "SVSaviTool.h"
//#import "SVBaseVC.h"
#import "SVTabBar.h"
//#import "SVModuleModel.h"
#import <objc/runtime.h>

@interface SVLandingVC () <UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textFieldOne;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTwo;
@property (weak, nonatomic) IBOutlet UIView *viewOne;
@property (weak, nonatomic) IBOutlet UIView *viewTwo;
@property (nonatomic,strong) UIImageView *bgview;
@property (weak, nonatomic) IBOutlet UIButton *login;

@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UIButton *experienceButton;
@property (weak, nonatomic) IBOutlet UIButton *registeredButton;
@property (weak, nonatomic) IBOutlet UIView *viewThree;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *oneViewTopContent;


@property (nonatomic,assign) int num;

@end

@implementation SVLandingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //适配ios11偏移问题
    UIBarButtonItem *backltem = [[UIBarButtonItem alloc]initWithImage:nil style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backltem;
    
    //把状态栏(UIStatusBar)字体颜色设置为白色
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //设置view的圆角
    self.viewOne.layer.cornerRadius = 25;
    self.viewTwo.layer.cornerRadius = 25;
    self.login.layer.cornerRadius = 25;
    
//    self.viewOne.backgroundColor = RGBA(250, 250, 250, 0.3);
//    self.viewTwo.backgroundColor = RGBA(250, 250, 250, 0.3);
//   // self.login.backgroundColor = RGBA(49, 193, 123, 0.7);
//
//    //    self.registeredButton.hidden = YES;
//    //    self.experienceButton.hidden = YES;
//    //    self.resetButton.hidden = YES;
//    //    self.viewThree.hidden = YES;
//
//   // [self.textFieldOne setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
//   // [self.textFieldTwo setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
//
//   NSMutableAttributedString *placeholderString = [[NSMutableAttributedString alloc] initWithString:self.textFieldOne.placeholder attributes:@{NSForegroundColorAttributeName : self.textFieldOne.placeholder.color}];
//    self.textFieldOne.attributedPlaceholder = placeholderString;
//
//
//    NSMutableAttributedString *placeholderStringTwo = [[NSMutableAttributedString alloc] initWithString:self.textFieldTwo.placeholder attributes:@{NSForegroundColorAttributeName : self.textFieldOne.placeholder.color}];
//    self.textFieldTwo.attributedPlaceholder = placeholderStringTwo;
//
//    //self.textFieldOne.attributedPlaceholder = placeholderString;
////
////    作者：注定我要浪迹天涯
////    链接：https://www.jianshu.com/p/ef55a82304d8
////    来源：简书
////    著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
//
//
//    self.navigationController.delegate = self;
//    //更改返回箭头颜色
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    //去掉左边的导航栏的文字
//    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
//    //设置背景色
//    self.navigationController.navigationBar.barTintColor = navigationBackgroundColor;
//
//
//
//    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        switch (status) {
//            case AFNetworkReachabilityStatusNotReachable:{
//
//                //无网络
//                self.num = 0;
//
//                break;
//            }
//            case AFNetworkReachabilityStatusReachableViaWiFi:{
//
//                //wifi网络
//                self.num = 1;
//
//                break;
//            }
//            case AFNetworkReachabilityStatusReachableViaWWAN:{
//
//                //无线网络
//                self.num = 1;
//
//                break;
//            }
//            default:
//                break;
//        }
//    }];
//    //开启监听网络对像
//    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
//
//
//
//    //单例
//    [SVUserManager loadUserInfo];
//    NSString *account = [SVUserManager shareInstance].account;
//    NSString *passwd = [SVUserManager shareInstance].passwd;
//
//    //给textField付值
//    self.textFieldOne.text = account;
//    self.textFieldTwo.text = passwd;
//    //判断是否直接登陆
//    if (account != nil && passwd != nil) {
//
//        self.bgview.hidden = NO;
//        //延时
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//            if (self.num == 0) {
//                self.bgview.hidden = YES;
//                [SVTool TextButtonAction:self.view withSing:@"亲,没有网络"];
//                return;
//            }
//
//            [self loginInterfacePhone:self.textFieldOne.text withPassword:self.textFieldTwo.text];
//
//        });
//    }
//
//
//    //增加监听，当键盘出现或改变时收出消息
//     [[NSNotificationCenter defaultCenter] addObserver:self
//                                              selector:@selector(keyboardWillShow:)
//                                                  name:UIKeyboardWillShowNotification
//                                                object:nil];
//
//     //增加监听，当键退出时收出消息
//     [[NSNotificationCenter defaultCenter] addObserver:self
//                                              selector:@selector(keyboardWillHide:)
//                                                  name:UIKeyboardWillHideNotification
//                                                object:nil];
//
//
}


//- (void)keyboardWillShow:(NSNotification *)aNotification
//{
//    //获取键盘的高度
//
//    NSDictionary *userInfo = [aNotification userInfo];
//    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
//    CGRect keyboardRect = [aValue CGRectValue];
//    int height = keyboardRect.size.height;
//    int width = keyboardRect.size.width;
////    self.addCustomView.center = CGPointMake(ScreenW / 2, ScreenH - height - 120);
////    self.login.center = CGPointMake(ScreenW / 2, CGRectGetMaxY(self.textFieldTwo.frame) +10);
////    self.login.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
////    self.login.frame = CGRectMake(20, CGRectGetMaxY(self.textFieldTwo.frame) +10, ScreenW - 40, 50);
//    self.oneViewTopContent.constant = -120;
//    NSLog(@"键盘高度是  %d",height);
//    NSLog(@"键盘宽度是  %d",width);
//
//
//}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];// 1
//   // [self.textFieldTwo becomeFirstResponder];// 2
//
//}


////当键退出时调用
//- (void)keyboardWillHide:(NSNotification *)aNotification
//{
//    self.oneViewTopContent.constant = 0;
//}
//
///**
// 当界面消失的时间调用这个方法
// */
//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    //销毁监听网络对像
//    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
//
//}

//每次来都走这个地方
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//
//}

//#pragma make - navigationController代理方法
//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//
//    //隐藏导航栏
//    BOOL isVC = [viewController isKindOfClass:[self class]];
//    [self.navigationController setNavigationBarHidden:isVC animated:YES];
//}

#pragma mark - 相关按钮的点击事件
//跳转到找回密码界面
- (IBAction)jumpToRetrievePassword:(id)sender {
//    self.hidesBottomBarWhenPushed = YES;
//    SVRetrievePasswordOneVC *viewController = [[SVRetrievePasswordOneVC alloc] init];
//    [self.navigationController pushViewController:viewController animated:YES];
//    self.hidesBottomBarWhenPushed = YES;
}

//跳转到注册帐号界面
- (IBAction)jumpToRegisteredAccount:(id)sender {
//    self.hidesBottomBarWhenPushed = YES;
//    SVRegisteredOneVC *viewController = [[SVRegisteredOneVC alloc] init];
//    [self.navigationController pushViewController:viewController animated:YES];
//    self.hidesBottomBarWhenPushed = YES;
}

//登陆按键
- (IBAction)landingButton {
//    if ([SVTool isBlankString:self.textFieldOne.text]) {
//        [SVTool TextButtonAction:self.view withSing:@"请输入手机号"];
//    }else if ([SVTool isBlankString:self.textFieldTwo.text]){
//        [SVTool TextButtonAction:self.view withSing:@"请输入密码"];
//    }else{
//        [self requestData];
//    }
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    SVTabBar *tabbar = [[SVTabBar alloc]init];
    window.rootViewController = tabbar;
}

#pragma mark - 体验帐号网络请求跳转按钮
- (IBAction)experienceAccount {
    
//    if (self.num == 0) {
//        self.bgview.hidden = YES;
//        [SVTool TextButtonAction:self.view withSing:@"亲,没有网络"];
//        return;
//    }
//
//    [SVTool IndeterminateButtonAction:self.view withSing:nil];
//
//    [self loginInterfacePhone:@"13861745552" withPassword:@"123456"];
//
    
}

#pragma mark- 登陆按钮的网络请求与跳转
//登陆按钮请求
-(void)requestData{
    
//    if (self.num == 0) {
//        self.bgview.hidden = YES;
//        [SVTool TextButtonAction:self.view withSing:@"亲,没有网络"];
//        return;
//    }
//
//    [SVTool IndeterminateButtonAction:self.view withSing:nil];
//
//    [self loginInterfacePhone:self.textFieldOne.text withPassword:self.textFieldTwo.text];
    
     //跳转
               
}

/**
 登陆接口请求
 
 @param phone 帐号
 @param password 密码
 */
//-(void)loginInterfacePhone:(NSString *)phone withPassword:(NSString *)password{  //这里有报错  2018.1.08
//
//    //    self.bgview.hidden = NO;
//
//    //创建url /api/Login
//    NSString *urlStr = [URLhead stringByAppendingString:@"/api/Login/UserLogin"];
//    //时间戳
//    NSString *timestamp = [JWXUtils genTimeStamp];
//    //随机数
//    NSString *nonce = [NSString stringWithFormat:@"%d",arc4random()%1000000-1];
//    //密码
//    NSString *pwd = password;
//    //密码进行MD5加密
//    NSString *pwdMD5=[JWXUtils EncodingWithMD5:pwd].uppercaseString;
//    //加入数组进行排序
//    NSArray *values=[[NSArray alloc]initWithObjects:pwdMD5,timestamp,nonce, nil];
//    //转成字符串产生签名
//    NSString  *signature=[JWXUtils asSortAndSubString:values];
//    //把签名再次进行Hash MD5加密
//    signature=[JWXUtils EncodingWithMD5:signature];
//    //接收加密后的签名
//    NSString *Signature = signature;
//    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
//    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
//    //创建可变字典
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    [parameters setObject:phone forKey:@"userName"];
//    [parameters setObject:timestamp forKey:@"timestamp"];
//    // cell.detailTextLabel.text = [NSString stringWithFormat:@"v%@",[SVUserManager shareInstance].sv_oldVersion];
//    [parameters setObject:[NSString stringWithFormat:@"%@ %@",app_Name,app_Version] forKey:@"operatingPlatform"];
//    [parameters setObject:[NSString stringWithFormat:@"IOS %@",phoneVersion] forKey:@"systemName"];
//    [parameters setObject:nonce forKey:@"nonce"];
//    [parameters setObject:Signature forKey:@"signature"];
//    NSLog(@"parameters= %@",parameters);
//
//    [[SVSaviTool sharedSaviTool] POST:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        //解析数据
//
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
//
//        NSLog(@"urlStr= %@",urlStr);
//
//        NSLog(@"dict54534= %@",dict);
//
//        if ([dict[@"succeed"] integerValue] == 1) {
//            NSDictionary *dic = [dict dictionaryForKeySafe:@"values"];
//            NSDictionary *infoDic = dict[@"userInfo"];
//            NSDictionary *userconfig = infoDic[@"userconfig"];
//           NSString *sv_uc_dixianStr =userconfig[@"sv_uc_dixian"];
//            //行业信息
//            [SVUserManager shareInstance].sv_uit_cache_name = infoDic[@"sv_uit_cache_name"];
//
//            [SVUserManager shareInstance].dec_payment_method = [NSString stringWithFormat:@"%@",infoDic[@"dec_payment_method"]];
//
////            [SVUserManager shareInstance].sv_uit_cache_name = userconfig[@"dec_payment_method"];
//
//            NSString *sv_uc_isenablepwd = [NSString stringWithFormat:@"%@",userconfig[@"sv_uc_isenablepwd"]];
//            if (kStringIsEmpty(sv_uc_isenablepwd)) {
//                [SVUserManager shareInstance].sv_uc_isenablepwd = @"0";
//            }else{
//                [SVUserManager shareInstance].sv_uc_isenablepwd = sv_uc_isenablepwd;
//            }
//            NSLog(@"sv_uc_isenablepwd = %@",sv_uc_isenablepwd);
//
//            NSData *data = [sv_uc_dixianStr dataUsingEncoding:NSUTF8StringEncoding];
//            NSDictionary *sv_uc_dixian = [NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingAllowFragments error:nil];
//
//             [SVUserManager shareInstance].sv_uc_dixian = sv_uc_dixian;
//
//            NSArray *moduleConfigList = infoDic[@"moduleConfigList"];
//            if (!kArrayIsEmpty(moduleConfigList)) {
//                for (NSDictionary *detaiDic in moduleConfigList) {
//                    if ([detaiDic[@"sv_user_module_code"] isEqualToString:@"ZeroInventorySales"]) {
//                        NSArray *childInfolist = detaiDic[@"childInfolist"];
//                        if (!kArrayIsEmpty(childInfolist)) {
//                            NSDictionary *dic=childInfolist[0];
//                            if (!kDictIsEmpty(dic)) {
//                                NSArray *childDetailList = dic[@"childDetailList"];
//                                if (!kArrayIsEmpty(childDetailList)) {
//                                    NSDictionary *lastDic = childDetailList[0];
//
//                                    if (!kDictIsEmpty(lastDic)) {
//                                        NSString*sv_detail_is_enable=lastDic[@"sv_detail_is_enable"];
//                                        [SVUserManager shareInstance].ZeroInventorySales_sv_detail_is_enable = sv_detail_is_enable;
//                                    }
//                                }
//
//                            }
//
//                        }
//
//                    }
//                }
//            }
//
//            #pragma mark - 获取满赠送
//            if (!kArrayIsEmpty(moduleConfigList)) {
//                for (NSDictionary *detaiDic in moduleConfigList) {
//                    if ([detaiDic[@"sv_user_module_code"] isEqualToString:@"Preferential"]) {
//                        NSArray *childInfolist = detaiDic[@"childInfolist"];
//                        if (!kArrayIsEmpty(childInfolist)) {
//                            NSDictionary *dic=childInfolist[0];
//                            if ([[NSString stringWithFormat:@"%@",dic[@"sv_user_config_code"]] isEqualToString:@"TopUpGiving"]) {// 充值赠送
//                                if (!kDictIsEmpty(dic)) {
//                                    NSArray *childDetailList = dic[@"childDetailList"];
//                                    if (!kArrayIsEmpty(childDetailList)) {
////                                        NSDictionary *lastDic = childDetailList[0];
////
////                                        if (!kDictIsEmpty(lastDic)) {
////                                            NSString*sv_detail_is_enable=lastDic[@"sv_detail_is_enable"];
////                                            [SVUserManager shareInstance].ZeroInventorySales_sv_detail_is_enable = sv_detail_is_enable;// 充值送积分或者金额
////                                        }
//                                        // 这里就拿到了里面的明细
//
//                                        [SVUserManager shareInstance].childDetailList = childDetailList;
//                                    }
//
//                                }
//                            }else if ([[NSString stringWithFormat:@"%@",dic[@"sv_user_config_code"]] isEqualToString:@"ChargeGiving"]){// 充次赠送
//
//                            }else if ([[NSString stringWithFormat:@"%@",dic[@"sv_user_config_code"]] isEqualToString:@"ConsumptionReduction"]){// 消费减免
//
//                            }
//
//                        }
//
//
//
//                    }
//                }
//                       }
//
//            //用单例保存信息
//            [SVUserManager shareInstance].account = phone;
//            [SVUserManager shareInstance].passwd = password;
//            [SVUserManager shareInstance].access_token = dic[@"access_token"];
//            NSLog(@"[SVUserManager shareInstance].access_token= %@",[SVUserManager shareInstance].access_token);
//          //  [SVUserManager shareInstance].sv_app_config = dic[@"sv_app_config"];
//            //分店权限
//            [SVUserManager shareInstance].isStore = dic[@"isStore"];
//
//
//            [SVUserManager shareInstance].sv_app_config_dic = dic[@"sv_app_config"];
//            NSDictionary *config_dic = [SVUserManager shareInstance].sv_app_config_dic;
//            SVModuleModel *model = [SVModuleModel mj_objectWithKeyValues:config_dic];
//            [SVUserManager shareInstance].sv_app_config = model.module;
//
//         //   sv_uc_dixian
//
//            NSLog(@"[SVUserManager shareInstance].sv_app_config= %@",[SVUserManager shareInstance].sv_app_config);
//            if ([dict[@"is_SalesclerkLogin"] integerValue] == 1) {
//                //操作员名字
//                [SVUserManager shareInstance].sv_employee_name = [NSString stringWithFormat:@"%@",dic[@"sv_employee_name"]];
//
//            }else{
//                NSDictionary *dic_two = dict[@"userInfo"];
//                [SVUserManager shareInstance].sv_employee_name = [NSString stringWithFormat:@"%@",dic_two[@"sv_ul_name"]];
//
//            }
//
//            NSString *sp_salesclerk_privilege= [NSString stringWithFormat:@"%@",dic[@"sp_salesclerk_privilege"]];
//            NSLog(@"sp_salesclerk_privilege = %@",dic[@"sp_salesclerk_privilege"]);
//            if (kStringIsEmpty(sp_salesclerk_privilege)) {
//                   [SVUserManager shareInstance].sv_versionpowersDict = nil;
//            }else{
//                NSString *sp_salesclerk_privilege= [NSString stringWithFormat:@"%@",dic[@"sp_salesclerk_privilege"]];
//                if ([sp_salesclerk_privilege isEqualToString:@"<null>"]) {
//                     [SVUserManager shareInstance].sv_versionpowersDict = nil;
//                }else{
//                    NSData *data2 = [dic[@"sp_salesclerk_privilege"] dataUsingEncoding:NSUTF8StringEncoding];
//                    NSDictionary *sp_salesclerk_privilegeDict = [NSJSONSerialization JSONObjectWithData: data2 options:NSJSONReadingAllowFragments error:nil];
//                                                NSLog(@"8888888sp_salesclerk_privilegeDict = %@",sp_salesclerk_privilegeDict);
//                                                [SVUserManager shareInstance].sv_versionpowersDict = sp_salesclerk_privilegeDict;
//                }
//
//            }
//
//
//            [SVUserManager shareInstance].user_id = dic[@"user_id"];
//
//            [SVUserManager saveUserInfo];
//
//            // [SVUserManager saveUserInfo];
//            //NSArray *array = dic[]
//
//            //用偏好设置，保存帐号\密码\ID
//            //            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//            //            [defaults setObject:self.textFieldOne.text forKey:@"account"];
//            //            [defaults setObject:self.textFieldTwo.text forKey:@"passwd"];
//            //            [defaults setObject:dic[@"access_token"] forKey:@"access_token"];
//            //            [defaults setObject:dic[@"user_id"] forKey:@"user_id"];
//            //            [defaults synchronize];
//
//
//
//
//            //用户数据的请求
//            [self requestUserData];
//            [self requestBigClassData];
//            /*
//             跳转到主界面
//             */
//
//            //延迟1秒开始跳转，目前让数据有足够时间去请求用户数据
//            //dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            //
//            //    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//            //    SVTabBar *tabbar = [[SVTabBar alloc]init];
//            //    window.rootViewController = tabbar;
//            //    //跳转时会有动画效果，从下慢慢往上
//            //    //[self presentViewController:tabbar animated:YES completion:nil];
//            //});
//
//
//        } else {
//
//            self.bgview.hidden = YES;
//            [MBProgressHUD hideHUDForView:self.view animated:YES];
//            [SVTool TextButtonAction:self.view withSing:@"账号与密码不一致"];
//
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        self.bgview.hidden = YES;
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
//        [SVTool TextButtonAction:self.view withSing:@"登陆请求失败"];
//    }];
//
//}




#pragma mark - 用户数据请求
//- (void)requestUserData{
//
//    [SVUserManager loadUserInfo];
//
//    //URL
//    //NSString *urlStr = [URLhead stringByAppendingString:@"/system/GetUserinfo?key=%@&accountno=%@",[SVUserManager shareInstance].access_token,[SVUserManager shareInstance].account];
//    NSString *urlStr = [URLhead stringByAppendingFormat:@"/system/GetUserinfo?key=%@&accountno=%@",[SVUserManager shareInstance].access_token,[SVUserManager shareInstance].account];
//    NSLog(@"urlStr = %@",urlStr);
//
//    //请求数据
//    [[SVSaviTool sharedSaviTool] GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        //解析数据
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"dict9999888 = %@",dict);
//
//        if ([dict[@"succeed"] integerValue] == 1) {
//            NSDictionary *dic = [dict dictionaryForKeySafe:@"values"];
//
//            //头像
//            [SVUserManager shareInstance].sv_us_logo = dic[@"sv_us_logo"];
//            //店铺名称
//            [SVUserManager shareInstance].sv_us_name = dic[@"sv_us_name"];
//            //店铺简称
//            [SVUserManager shareInstance].sv_us_shortname = dic[@"sv_us_shortname"];
//            //注册时间
//            [SVUserManager shareInstance].sv_ul_regdate = dic[@"sv_ul_regdate"];
//            //店铺电话
//            [SVUserManager shareInstance].sv_us_phone = dic[@"sv_us_phone"];
//            //店主名称
//            [SVUserManager shareInstance].sv_ul_name = [NSString stringWithFormat:@"%@",dic[@"sv_ul_name"]];
//            //手机号码
//            [SVUserManager shareInstance].sv_ul_mobile = dic[@"sv_ul_mobile"];
//            //电子邮件
//            [SVUserManager shareInstance].sv_ul_email = dic[@"sv_ul_email"];
//            //行业种类
//            [SVUserManager shareInstance].sv_uit_name = dic[@"sv_uit_name"];
//            //地址
//            [SVUserManager shareInstance].sv_us_address = dic[@"address"];
//            //版本
//            [SVUserManager shareInstance].sv_versionid = [NSString stringWithFormat:@"%@",dic[@"sv_versionid"]];
//            [SVUserManager shareInstance].sv_versionname = dic[@"sv_versionname"];
//            //分店权限
//           // [SVUserManager shareInstance].isStore = dic[@"isStore"];
//
//
//            [SVUserManager shareInstance].sv_uit_cache_id = dic[@"sv_us_industrytype"];
//            [SVUserManager shareInstance].cityname = dic[@"cityname"];
//            [SVUserManager shareInstance].disname = dic[@"disname"];
//            //操作员权限
//            [SVUserManager shareInstance].is_SalesclerkLogin = dic[@"is_SalesclerkLogin"];
//            //操作员ID
//            [SVUserManager shareInstance].sv_employeeid = [NSString stringWithFormat:@"%@",dic[@"sv_employeeid"]];
//
//            [SVUserManager shareInstance].dec_payment_method = [NSString stringWithFormat:@"%@",dic[@"dec_payment_method"]];
//
//
////            //操作员名字
////            [SVUserManager shareInstance].sv_employee_name = [NSString stringWithFormat:@"%@",dic[@"sv_employee_name"]];
//
//            [SVUserManager saveUserInfo];
//
//        } else {
//            [SVTool TextButtonActionWithSing:@"数据出错,信息请求失败"];
//        }
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//        [SVTool TextButtonAction:self.view withSing:@"网络开小差了"];
//
//    }];
//}

#pragma mark - 商品大分类数据请求
//-(void)requestBigClassData{
//    [SVUserManager loadUserInfo];
//    NSString *token = [SVUserManager shareInstance].access_token;
//
//    //URL
//    NSString *urlStr = [URLhead stringByAppendingString:@"/product/GetFirstCategory"];
//    //创建可变字典
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    //将key放到字典里
//    [parameters setObject:token forKey:@"key"];
//    //请求数据
//    [[SVSaviTool sharedSaviTool] GET:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        //解析数据
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"urlStr = %@",urlStr);
//        if ([dic[@"succeed"] intValue] == 1) {
//
//            //NSMutableArray *valuesArr = dic[@"values"];
//
//            NSArray *valuesArr= [dic arrayForKeySafe:@"values"];
//
//            //偏好设置
//            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//
//            NSMutableArray *bigNameArr = [NSMutableArray array];
//            NSMutableArray *bigIDArr = [NSMutableArray array];
//
//            [bigNameArr addObject:@"全部商品"];
//
//            [bigIDArr addObject:@"0"];
//
//            if (![SVTool isEmpty:valuesArr]) {
//
//                //将数组里边的字典遍历一次,就可以拿到每个字典里的东西了
//                for (NSDictionary *dict in valuesArr) {
//
//                    [bigNameArr addObject:dict[@"sv_pc_name"]];
//
//                    [bigIDArr addObject:dict[@"productcategory_id"]];
//
//                }
//
//            }
//
//            [defaults setObject:bigNameArr forKey:@"bigName_Arr"];
//            [defaults setObject:bigIDArr forKey:@"bigID_Arr"];
//
//            [defaults synchronize];
//
//            //跳转
//            UIWindow *window = [UIApplication sharedApplication].keyWindow;
//            SVTabBar *tabbar = [[SVTabBar alloc]init];
//            window.rootViewController = tabbar;
//        } else {
//
//            self.bgview.hidden = YES;
//            [MBProgressHUD hideHUDForView:self.view animated:YES];
//            [SVTool TextButtonAction:self.view withSing:@"登陆数据请求失败"];
//
//        }
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        self.bgview.hidden = YES;
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
//        [SVTool TextButtonAction:self.view withSing:@"登陆数据请求失败"];
//    }];
//}



#pragma mark - 懒加载
-(UIImageView *)bgview{
    if (_bgview == nil) {
        _bgview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
        if (ScreenH == 812) {
            _bgview.image = [UIImage imageNamed:@"LaudingImage_02"];
        } else {
            _bgview.image = [UIImage imageNamed:@"LaudingImage"];
        }
        
        [self.view addSubview:_bgview];
    }
    return _bgview;
}

@end
