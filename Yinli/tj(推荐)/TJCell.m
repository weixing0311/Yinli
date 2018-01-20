//
//  TJCell.m
//  Yinli
//
//  Created by iOSdeveloper on 2018/1/5.
//  Copyright © 2018年 -call Me WeiXing. All rights reserved.
//

#import "TJCell.h"

@implementation TJCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
        [self setSubViewLayOut];
//        self.contentView.backgroundColor = HEXCOLOR(0xeeeeee);
    }
    return self;
}
-(void)setModel:(TJModel *)model
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.title1lb.text = @"你的新搭配方案";
    self.title2lb.text = @"按场合推荐";
    self.title3lb.text = @"按风格印象推荐";
    
    self.dayslb.text = model.daysStr;
    self.subtitlelb.text = model.titleStr;
    [self.bigImageView sd_setImageWithURL:[NSURL URLWithString:model.bigImageUrl]placeholderImage:getImage(@"default_")];
    [self.img1 sd_setImageWithURL:[NSURL URLWithString:model.img1Str]placeholderImage:getImage(@"default_")];
    [self.img2 sd_setImageWithURL:[NSURL URLWithString:model.img1Str]placeholderImage:getImage(@"default_")];
    [self.img3 sd_setImageWithURL:[NSURL URLWithString:model.img1Str]placeholderImage:getImage(@"default_")];
    [self.img4 sd_setImageWithURL:[NSURL URLWithString:model.img1Str]placeholderImage:getImage(@"default_")];

}



-(void)initSubView
{
    self.title1lb = [UILabel new];
    [self.contentView addSubview: self.title1lb];
    
    self.bgView = [UIView new];
    [self.contentView addSubview:self.bgView];

    self.bigImageView = [UIImageView new];
    [self.bgView      addSubview:self.bigImageView];

    self.rightView = [UIView new];
    [self.bgView      addSubview:self.rightView];

    self.dayslb = [UILabel new];
    [self.rightView      addSubview:self.dayslb];
    
    self.subtitlelb = [UILabel new];
    [self.rightView      addSubview:self.subtitlelb];

    
    self.img1 = [UIImageView new];
    self.img2 = [UIImageView new];
    self.img3 = [UIImageView new];
    self.img4 = [UIImageView new];

    
    [self.bgView addSubview:self.img1];
    [self.bgView addSubview:self.img2];
    [self.bgView addSubview:self.img3];
    [self.bgView addSubview:self.img4];

    self.bgView.backgroundColor = HEXCOLOR(0x666666);
    self.rightView.backgroundColor = [UIColor whiteColor];
    
//    [self.bgView      addSubview:self.subtitlelb];
    
    [self setlb:self.subtitlelb InfoWithFont:[UIFont systemFontOfSize:12] color:HEXCOLOR(0x666666) alignment:NSTextAlignmentCenter];
    [self setlb:self.dayslb InfoWithFont:[UIFont systemFontOfSize:13] color:[UIColor blackColor] alignment:NSTextAlignmentCenter];
    
//    self.bgView.layer.masksToBounds = YES;
//    self.bgView.layer.cornerRadius = 5;
//    self.headImageView.layer.masksToBounds = YES;
//    self.headImageView.layer.cornerRadius = 15;
    

    self.bigImageView.contentMode =UIViewContentModeScaleAspectFill;
    self.bigImageView.clipsToBounds = YES;
    
    
    self.title2lb = [UILabel new];
    [self.contentView addSubview:self.title2lb];
    self.secondView = [UIView new];
    [self.contentView addSubview:self.secondView];
    
    self.title3lb = [UILabel new];
    [self.contentView addSubview:self.title3lb];

    self.thirdView = [UIView new];
    [self.contentView addSubview:self.thirdView];
    
    
    

    [self setlb:self.title1lb InfoWithFont:[UIFont systemFontOfSize:18] color:HEXCOLOR(0x000000) alignment:NSTextAlignmentLeft];
    [self setlb:self.title2lb InfoWithFont:[UIFont systemFontOfSize:18] color:HEXCOLOR(0x000000) alignment:NSTextAlignmentLeft];
    [self setlb:self.title3lb InfoWithFont:[UIFont systemFontOfSize:18] color:HEXCOLOR(0x000000) alignment:NSTextAlignmentLeft];

    
    
//    self.secondView.backgroundColor = [UIColor grayColor];
//
//    self.thirdView.backgroundColor = [UIColor grayColor];

}
-(void)setSubViewLayOut
{
    
    float height = (JFA_SCREEN_WIDTH-20)*0.67;
    float width  = JFA_SCREEN_WIDTH-20;
    
    self.title1lb.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 10)
    .heightIs(20);
    
    
    self.bgView.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 10)
    .topSpaceToView(self.title1lb, 10)
    .heightIs(height);

    
    self.bigImageView.sd_layout
    .topSpaceToView(self.bgView, 1)
    .leftSpaceToView(self.bgView, 1)
    .bottomSpaceToView(self.bgView, 1)
    .widthIs(width/2);

    
    
    
    self.rightView.sd_layout
    .leftSpaceToView(self.bigImageView, 1)
    .rightSpaceToView(self.bgView, 1)
    .topSpaceToView(self.bgView, 1)
    .heightIs(height-width/2);

    self.subtitlelb.sd_layout
    .leftSpaceToView(self.rightView, 0)
    .rightSpaceToView(self.rightView, 0)
    .topSpaceToView(self.rightView, 5)
    .heightIs(20);

    
    self.dayslb.sd_layout
    .leftSpaceToView(self.rightView, 0)
    .rightSpaceToView(self.rightView, 0)
    .topSpaceToView(self.subtitlelb, 0)
    .heightIs(15);
    
    
    self.img1.sd_layout
    .leftSpaceToView(self.bigImageView,1)
    .topSpaceToView(self.rightView, 1)
    .widthIs((width/2-3)/2)
    .heightEqualToWidth();
    
    self.img2.sd_layout
    .leftSpaceToView(self.img1, 1)
    .rightSpaceToView(self.bgView, 1)
    .topSpaceToView(self.rightView, 1)
    .heightIs((width/2-3)/2);
//    .heightEqualToWidth();

    self.img3.sd_layout
    .leftSpaceToView(self.bigImageView, 1)
    .topSpaceToView(self.img1, 1)
    .widthIs((width/2-3)/2)
    .bottomSpaceToView(self.bgView, 1);

    self.img4.sd_layout
    .leftSpaceToView(self.img3, 1)
    .rightSpaceToView(self.bgView, 1)
    .topSpaceToView(self.img2, 1)
    .bottomSpaceToView(self.bgView, 1);
//    .heightEqualToWidth();

    self.title2lb.sd_layout
    .topSpaceToView(self.bgView, 10)
    .leftSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 10)
    .heightIs(20);
    
    self.secondView.sd_layout
    .topSpaceToView(self.title2lb,10)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(((JFA_SCREEN_WIDTH-75)/4+20)*2+30);
    
    self.title3lb.sd_layout
    .topSpaceToView(self.secondView, 10)
    .leftSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 10)
    .heightIs(20);
    
    self.thirdView.sd_layout
    .topSpaceToView(self.title3lb,10)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(((JFA_SCREEN_WIDTH-30)/4+20)*3+40);

    
    [self buildButtonWithCount:6 imageName:@"status" view:self.secondView title:@[@"商务宴会",@"婚礼",@"朋友聚会",@"约会",@"工作日",@"周末出行",]];
    [self buildButtonWithCount:11 imageName:@"style" view:self.thirdView title:@[@"休闲",@"运动",@"商务",@"简约",@"欧美",@"英伦",@"韩风",@"日系",@"复古",@"街头",@"艺术"]];
    
    [self setupAutoHeightWithBottomView:self.thirdView bottomMargin:10];
    
}



-(void)setlb:(UILabel*)lb InfoWithFont:(UIFont*)font color:(UIColor *)color alignment:(NSTextAlignment)alignment
{
    lb.font = font;
    lb.textColor = color;
    lb.textAlignment = alignment;
}
-(void)buildButtonWithCount:(int)count imageName:(NSString *)name view:(UIView *)view title:(NSArray *)titleArr
{
    double width =(JFA_SCREEN_WIDTH-75)/4;
    double height =(JFA_SCREEN_WIDTH-75)/4+15;

    int totalColumns = 4;
    
    //       每一格的尺寸
    
    //    间隙
    CGFloat margin =15;
    
    //    根据格子个数创建对应的框框
    for(int index = 0; index< count; index++) {
        UIView *cellView = [[UIView alloc ]init ];
        cellView.backgroundColor = [UIColor whiteColor];
        
        // 计算行号  和   列号
        int row = index / totalColumns;
        int col = index % totalColumns;
        //根据行号和列号来确定 子控件的坐标
        CGFloat cellX = margin + col * (width + margin);
        CGFloat cellY = row * (height + margin);
        cellView.frame = CGRectMake(cellX, cellY, width, height);
        
        
        
        UIImageView *ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, width)];
        NSString *imageName = [NSString stringWithFormat:@"%@%d_",name,index+1];
        ImageView.image =getImage(imageName);
        
        [cellView addSubview:ImageView];
        
        NSString * titleStr = titleArr[index];
    
        
        UILabel * lb =[[UILabel alloc]initWithFrame:CGRectMake(0, width+5, width, 15)];
        lb.textColor = HEXCOLOR(0x666666);
        lb.font = [UIFont systemFontOfSize:15];
        lb.text = titleStr;
        lb.textAlignment  = NSTextAlignmentCenter;
        [cellView addSubview:lb];
        // 添加到view 中
        [view addSubview:cellView];
    } }





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
