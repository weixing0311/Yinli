//
//  PerfectInfoCell.m
//  Yinli
//
//  Created by iOSdeveloper on 2018/1/20.
//  Copyright © 2018年 -call Me WeiXing. All rights reserved.
//

#import "PerfectInfoCell.h"
#import "PerfectInfoModel.h"
#import "SXSRulerControl.h"
@implementation PerfectInfoCell
{
    SXSRulerControl * _ruler;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = HEXCOLOR(0xeeeeee);
        [self buildSubView];
        [self setSubViewLayout];
    }
    return self;
}
-(void)setModel:(PerfectInfoModel *)model
{
    self.titleLabel.text = model.titleStr;
    self.subTitleLabel.text = model.subTitleStr;
    if (self.tag ==0||self.tag==1) {
        self.xlabel.text = @"*";
    }else{
        self.xlabel.text = @"";
    }
    _ruler.midCount=1;//几个大格标记一个刻度
    _ruler.smallCount=5;//一个大格几个小格
    _ruler.minValue = model.minValue;// 最小值
    _ruler.maxValue = model.maxValue;// 最大值
    _ruler.valueStep = 5;// 两个标记刻度之间相差大小
    _ruler.minorScaleSpacing = 10;
    _ruler.selectedValue = model.selectedValue;// 设置默认值

}
-(void)buildSubView
{
    self.titleLabel =[UILabel new];
    self.xlabel = [UILabel new];
    self.subTitleLabel = [UILabel new];
    _ruler = [SXSRulerControl new];
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.xlabel];
    [self.contentView addSubview:self.subTitleLabel];
    [self.contentView addSubview:_ruler];

    self.xlabel.textColor = [UIColor redColor];
    self.subTitleLabel.font = [UIFont systemFontOfSize:13];
    self.xlabel.font = [UIFont systemFontOfSize:13];
    
    [_ruler addTarget:self action:@selector(selectedValueChanged:) forControlEvents:UIControlEventValueChanged]; // 添加监听方法

}



- (void)selectedValueChanged:(SXSRulerControl *)ruler {
//    _textfield.text = [NSString stringWithFormat:@"%.f", ruler.selectedValue];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"perfectInfodudu" object:nil userInfo:@{@"ruler":@(ruler.selectedValue),@"index":@(self.tag)}];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    _ruler.selectedValue=textField.text.integerValue;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    _ruler.selectedValue=textField.text.integerValue;
}

-(void)setSubViewLayout
{
    self.titleLabel.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 10)
    .heightIs(15);
    [self.titleLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.xlabel.sd_layout
    .leftSpaceToView(self.titleLabel, 10)
    .topSpaceToView(self.contentView, 15)
    .heightIs(10);

    self.subTitleLabel.sd_layout
    .leftSpaceToView(self.xlabel, 10)
    .topSpaceToView(self.contentView, 15)
    .heightIs(10);

    _ruler.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.self.titleLabel, 20)
    .rightSpaceToView(self.contentView, 10)
    .heightIs(60);

//    self.scrImg.sd_layout
//    .leftSpaceToView(self.scrl, 0)
//    .topSpaceToView(self.scrl, 0)
//    .rightSpaceToView(self.scrl, 0)
//    .bottomSpaceToView(self.scrl, 0);

    [self setupAutoHeightWithBottomView:_ruler bottomMargin:20];

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
