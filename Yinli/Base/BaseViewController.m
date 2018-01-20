//
//  BaseViewController.m
//  Yinli
//
//  Created by iOSdeveloper on 2017/9/25.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "BaseViewController.h"
#import "EmptyView.h"
#import "BaseTableViewCell.h"
@interface BaseViewController ()
@property (nonatomic,strong)EmptyView      * emptyView;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page =0;
    // Do any additional setup after loading the view.
}
-(void)buildTableView
{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self setExtraCellLineHiddenWithTb:_tableview];
        [self.view addSubview:_tableview];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(id)getXibCellWithTitle:(NSString *)title
{
    NSArray *arr = [[NSBundle mainBundle]loadNibNamed:title owner:nil options:nil];
    if (arr) {
        return [arr lastObject];
        
    }else{
        return nil;
    }
}
-(void)setExtraCellLineHiddenWithTb:(UITableView *)tb
{
    UIView *view =[[UIView alloc]init];
    view.backgroundColor = HEXCOLOR(0xeeeeee);
    [tb setTableFooterView:view];
}
-(void)setRefrshWithTableView:(UITableView *)tb
{
    
    tb.mj_header =  [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
    
    tb.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    [tb.mj_header beginRefreshing];
    
}
-(void)headerRereshing
{
    self.page = 0;
    [self getDataInfo];
}
-(void)footerRereshing
{
    self.page ++;
    [self getDataInfo];
}

-(void)getDataInfo
{
    
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
-(EmptyView *)emptyView
{
    if (!_emptyView) {
        _emptyView = [self getXibCellWithTitle:@"EmptyView"];
        _emptyView.hidden = YES;
        _emptyView.frame = self.view.bounds;
        _emptyView.backgroundColor =HEXCOLOR(0xeeeeee);
        [_emptyView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapEmptyView)]];
        [self.view addSubview:_emptyView];
    }
    return _emptyView;
}
-(void)showEmptyViewWithTitle:(NSString *)title
{
    _emptyView.hidden =NO;
    _emptyView.titleLabel.text = title;
    [self.view bringSubviewToFront:_emptyView];
}
-(void)hiddenEmptyView
{
    _emptyView.hidden =YES;
}
-(void)didTapEmptyView
{
    [self refreshEmptyView];
}
-(void)refreshEmptyView
{
    
}
-(float)cellHeight
{
    return 0.00;
}

#pragma mark ----tableviewdelegate  datasource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self cellHeight];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseCellModel * model = [_dataArray objectAtIndex:indexPath.row];
    
    NSString * cellIdentification=[model cellXibName]?[model cellXibName]:[model cellClassName];
    
    BaseTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:cellIdentification];
    
    if (!cell&&[model cellXibName]) {
        cell=[[[NSBundle mainBundle] loadNibNamed:[model cellXibName] owner:self options:0] objectAtIndex:0];
    }
    
    if (!cell&&[model cellClassName]) {
        cell=[[NSClassFromString(cellIdentification) alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentification];
    }
    cell.tag = indexPath.row;
    cell.model = model;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self didSelectTbWithIndexPath:indexPath];
}
-(void)didSelectTbWithIndexPath:(NSIndexPath*)indexPath
{
    
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
