//
//  KnowLedgeCell.h
//  Yinli
//
//  Created by iOSdeveloper on 2018/1/10.
//  Copyright © 2018年 -call Me WeiXing. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface KnowLedgeCell : BaseTableViewCell
@property (nonatomic,strong)UILabel * dateLb;
@property (nonatomic,strong)UILabel * dayslb;
@property (nonatomic,strong)UILabel * titlelb;
@property (nonatomic,strong)UILabel * subtitlelb;
@property (nonatomic,strong)UILabel * contentlb;
@property (nonatomic,strong)UILabel * nicknamelb;

@property (nonatomic,strong)UIView * bgView;

@property (nonatomic,strong)UIImageView * bgImageView;
@property (nonatomic,strong)UIImageView * headImageView;

@end
