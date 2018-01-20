//
//  BaseViewController.h
//  Yinli
//
//  Created by iOSdeveloper on 2017/9/25.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * tableview;
@property (nonatomic,strong)NSMutableArray * dataArray;
@property (nonatomic,assign)int  page;

-(id)getXibCellWithTitle:(NSString *)title;
-(void)buildTableView;
-(void)setExtraCellLineHiddenWithTb:(UITableView *)tb;
-(void)setRefrshWithTableView:(UITableView *)tb;
-(void)headerRereshing;
-(void)footerRereshing;

-(void)showEmptyViewWithTitle:(NSString *)title;
-(void)hiddenEmptyView;
-(void)refreshEmptyView;
-(void)didSelectTbWithIndexPath:(NSIndexPath*)indexPath;


-(void)getDataInfo;
@end
