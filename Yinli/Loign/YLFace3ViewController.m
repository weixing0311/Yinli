//
//  YLFace3ViewController.m
//  Yinli
//
//  Created by iOSdeveloper on 2017/11/9.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "YLFace3ViewController.h"
#import "RuleCell.h"
@interface YLFace3ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * tableview;
@end

@implementation YLFace3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableview .delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    
    // Do any additional setup after loading the view.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"RuleCell";
    RuleCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell ) {
        cell = [self getXibCellWithTitle:identifier];
    }
    return cell;
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
