//
//  TabbarViewController.m
//  zhijiangjun
//
//  Created by iOSdeveloper on 2017/6/11.
//  Copyright © 2017年 ZhiJiangjun-iOS. All rights reserved.
//

#import "TabbarViewController.h"
#import "FacePageViewController.h"
#import "TJViewController.h"
#import "KnowledgeViewController.h"
#import "MineViewController.h"
#import "TestViewController.h"
@interface TabbarViewController ()<UITabBarControllerDelegate>

@end

@implementation TabbarViewController
{
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    
    FacePageViewController * health = [[FacePageViewController alloc]init];

    UINavigationController * nav1 = [[UINavigationController alloc]initWithRootViewController:health];
//    health.title = @"健康";

    KnowledgeViewController *found = [[KnowledgeViewController alloc]init];

    UINavigationController * nav2 = [[UINavigationController alloc]initWithRootViewController:found];
//    news.title = @"消息";


//    found = [[foundViewController alloc]init];
//
    TJViewController * news = [[TJViewController alloc]init];
    UINavigationController * nav3 = [[UINavigationController alloc]initWithRootViewController:news];
//    found.title = @"社群";

//    ShopTabbbarController *shop = [[ShopTabbbarController alloc]init];
//    shop.title = @"商城";




    TestViewController *shop = [[TestViewController alloc]init];
    UINavigationController * nav4 = [[UINavigationController alloc]initWithRootViewController:shop];

//    shop.title = @"云服务";



    MineViewController * user = [[MineViewController alloc]init];
//    UserViewController *user = [[UserViewController alloc]init];
    UINavigationController * nav5 = [[UINavigationController alloc]initWithRootViewController:user];
//    user.title = @"我的";

    self.viewControllers = @[nav1,nav2,nav3,nav4,nav5];


    UITabBarItem * item1 =[self.tabBar.items objectAtIndex:0];
    UITabBarItem * item2 =[self.tabBar.items objectAtIndex:1];
    UITabBarItem * item3 =[self.tabBar.items objectAtIndex:2];
    UITabBarItem * item4 =[self.tabBar.items objectAtIndex:3];
    UITabBarItem * item5 =[self.tabBar.items lastObject];

    item1.image = [UIImage imageNamed:@"tabbar_1_"];
//    item1.selectedImage = [UIImage imageNamed:@"health_"];

    item2.image = [UIImage imageNamed:@"tabbar_2_"];
//    item2.selectedImage = [UIImage imageNamed:@"discuss_"];

    item3.image = [UIImage imageNamed:@"tabbar_3_"];
//    item3.selectedImage = [UIImage imageNamed:@"tab_comm1_"];

    item4.image = [UIImage imageNamed:@"tabbar_4_"];
    item4.selectedImage = [UIImage imageNamed:@"store_"];

    item5.image = [UIImage imageNamed:@"tabbar_5_"];
//    item5.selectedImage = [UIImage imageNamed:@"mine_"];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.tintColor = [UIColor blueColor];



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
