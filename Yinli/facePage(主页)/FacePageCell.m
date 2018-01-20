//
//  FacePageCell.m
//  Yinli
//
//  Created by iOSdeveloper on 2018/1/4.
//  Copyright © 2018年 -call Me WeiXing. All rights reserved.
//

#import "FacePageCell.h"
#import "FacePageModel.h"
@implementation FacePageCell

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
        self.contentView.backgroundColor = HEXCOLOR(0xeeeeee);
    }
    return self;
}
-(void)setModel:(FacePageModel *)model
{
    self.dateLb.text = model.dateStr;
    self.dayslb.text = model.daysStr;
    self.titlelb.text = model.titleStr;
    self.subtitlelb.text = model.subTitleStr;
    self.contentlb.text = model.contentStr;
    self.nicknamelb.text = model.nickName;
    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:model.bgImageUrl]placeholderImage:getImage(@"default_")];
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.headImgUrl]placeholderImage:getImage(@"default_")];
}



-(void)initSubView
{
    self.dateLb = [UILabel new];
    self.dayslb = [UILabel new];
    self.titlelb = [UILabel new];
    self.subtitlelb = [UILabel new];
    self.contentlb = [UILabel new];
    self.nicknamelb = [UILabel new];

    self.bgImageView = [UIImageView new];
    self.headImageView = [UIImageView new];

    self.bgView = [UIView new];

    [self.contentView addSubview:self.dateLb];
    [self.contentView addSubview:self.dayslb];
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.bgImageView];
    [self.bgView addSubview:self.titlelb];
    [self.bgView addSubview:self.subtitlelb];
    [self.bgView addSubview:self.contentlb];
    [self.bgView addSubview:self.nicknamelb];
    [self.bgView addSubview:self.headImageView];

    
    [self setlb:self.dateLb InfoWithFont:[UIFont systemFontOfSize:13] color:[UIColor grayColor] alignment:NSTextAlignmentLeft];
    [self setlb:self.dayslb InfoWithFont:[UIFont systemFontOfSize:18] color:[UIColor blackColor] alignment:NSTextAlignmentLeft];
    [self setlb:self.titlelb InfoWithFont:[UIFont systemFontOfSize:15] color:[UIColor whiteColor] alignment:NSTextAlignmentLeft];
    [self setlb:self.subtitlelb InfoWithFont:[UIFont boldSystemFontOfSize:20] color:[UIColor whiteColor] alignment:NSTextAlignmentLeft];
    [self setlb:self.contentlb InfoWithFont:[UIFont systemFontOfSize:13] color:[UIColor whiteColor] alignment:NSTextAlignmentLeft];
    [self setlb:self.nicknamelb InfoWithFont:[UIFont systemFontOfSize:13] color:[UIColor grayColor] alignment:NSTextAlignmentLeft];
    self.contentlb.numberOfLines = 2;
    
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 5;
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.layer.cornerRadius = 15;

    self.bgView.backgroundColor = [UIColor whiteColor];
    
    self.bgImageView.contentMode =UIViewContentModeScaleAspectFill;
    self.bgImageView.clipsToBounds = YES;

}
-(void)setSubViewLayOut
{
    self.dateLb.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 20)
    .topSpaceToView(self.contentView, 10)
    .heightIs(12);
    
    self.dayslb.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 20)
    .topSpaceToView(self.dateLb, 10)
    .heightIs(15);
    
    
    self.bgView.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 10)
    .topSpaceToView(self.dayslb, 10)
    .heightIs((JFA_SCREEN_WIDTH-20)*0.6);

    self.bgImageView.sd_layout
    .leftSpaceToView(self.bgView, 0)
    .rightSpaceToView(self.bgView, 0)
    .topSpaceToView(self.bgView, 0)
    .bottomSpaceToView(self.bgView, 40);

    self.titlelb.sd_layout
    .leftSpaceToView(self.bgView, 20)
    .rightSpaceToView(self.bgView, 20)
    .topSpaceToView(self.bgView, 15)
    .heightIs(20);

    self.subtitlelb.sd_layout
    .leftSpaceToView(self.bgView, 20)
    .rightSpaceToView(self.bgView, 20)
    .topSpaceToView(self.titlelb, 10)
    .heightIs(20);

    self.contentlb.sd_layout
    .leftSpaceToView(self.bgView, 20)
    .rightSpaceToView(self.bgView, 20)
    .topSpaceToView(self.subtitlelb, 5)
    .maxHeightIs((JFA_SCREEN_WIDTH-20)*0.6-160);


    self.headImageView.sd_layout
    .leftSpaceToView(self.bgView, 10)
    .topSpaceToView(self.bgImageView, 5)
    .heightIs(30)
    .widthIs(30);

    
    self.nicknamelb.sd_layout
    .leftSpaceToView(self.headImageView, 10)
    .rightSpaceToView(self.bgView, 20)
    .topSpaceToView(self.bgImageView, 5)
    .heightIs(30);

    [self setupAutoHeightWithBottomView:self.bgView bottomMargin:10];

}


-(void)setlb:(UILabel*)lb InfoWithFont:(UIFont*)font color:(UIColor *)color alignment:(NSTextAlignment)alignment
{
    lb.font = font;
    lb.textColor = color;
    lb.textAlignment = alignment;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
