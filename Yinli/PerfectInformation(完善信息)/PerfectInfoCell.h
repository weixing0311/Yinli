//
//  PerfectInfoCell.h
//  Yinli
//
//  Created by iOSdeveloper on 2018/1/20.
//  Copyright © 2018年 -call Me WeiXing. All rights reserved.
//

#import "BaseTableViewCell.h"
@protocol prefectInfoCellDelegate;
@interface PerfectInfoCell : BaseTableViewCell
@property (nonatomic,strong)UILabel * titleLabel;
@property (nonatomic,strong)UILabel * xlabel;
@property (nonatomic,strong)UILabel * subTitleLabel;
@property (nonatomic,strong)UIScrollView * scrl;
@property (nonatomic,strong)UIImageView * scrImg;
@property (nonatomic,assign)id<prefectInfoCellDelegate>delegate;
@end

@protocol prefectInfoCellDelegate <NSObject>

-(void)getUpdataInfoWithCell:(PerfectInfoCell*)cell info:(NSString *)info;
@end
