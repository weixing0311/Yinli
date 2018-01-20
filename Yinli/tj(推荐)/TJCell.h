//
//  TJCell.h
//  Yinli
//
//  Created by iOSdeveloper on 2018/1/5.
//  Copyright © 2018年 -call Me WeiXing. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "TJModel.h"
@interface TJCell : BaseTableViewCell
@property (nonatomic,strong)UILabel     * titlelb;
@property (nonatomic,strong)UIImageView * bigImageView;
@property (nonatomic,strong)UILabel     * dayslb;
@property (nonatomic,strong)UILabel     * subtitlelb;
@property (nonatomic,strong)UIView      * bgView;
@property (nonatomic,strong)UIView      * rightView;
@property (nonatomic,strong)UILabel     * title1lb;
@property (nonatomic,strong)UILabel     * title2lb;
@property (nonatomic,strong)UILabel     * title3lb;

@property (nonatomic,strong)UIView      * secondView;
@property (nonatomic,strong)UIView      * thirdView;



@property (nonatomic,strong)UIImageView * img1;
@property (nonatomic,strong)UIImageView * img2;
@property (nonatomic,strong)UIImageView * img3;
@property (nonatomic,strong)UIImageView * img4;

@end
