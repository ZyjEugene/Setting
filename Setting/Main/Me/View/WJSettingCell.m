//
//  WJSettingCell.m
//  Setting
//
//  Created by wj on 16/3/28.
//  Copyright © 2016年 com.wj. All rights reserved.
//
//功能图片到左边界的距离
#define ImageToLeftGap 15

//功能名称字体
#define TitleLabelFont 14

//功能名称到功能图片的距离,当功能图片image不存在时,等于到左边界的距离
#define TitleLabelToImageGap 15

//指示箭头或开关到右边界的距离
#define IndicatorToRightGap 15

//详情文字字体
#define DetailLabelFont 12

//详情到指示箭头或开关的距离
#define DetailViewToIndicatorGap 13

#import "WJSettingCell.h"
#import "WJSettingItem.h"
#import "LocalStorageTool.h"
#import "UIView+Extension.h"

@interface WJSettingCell ()

@property (nonatomic,strong) UILabel *titleNameLabel;

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UIImageView *indicator;

@property (nonatomic,strong) UISwitch *statuSwitch;

@property (nonatomic,strong) UILabel *detailLabel;

@property (nonatomic,strong) UIImageView *detailImageView;

@end

@implementation WJSettingCell

- (void)setItem:(WJSettingItem *)item {
    
    _item = item;
    [self setupUI];
}

- (void)setupUI {
    
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //如果有图片
    if (self.item.image) {
        [self setupImageView];
    }
    
    //功能名称
    if (self.item.title) {
        [self setupTitleLabel];
    }
    
    //accessoryType
    if (self.item.accessoryType) {
        [self setupAccessoryType];
    }
    
    //detailLabel
    if (self.item.detailTitle) {
        [self setupDetailText];
    }
    
    //detailView
    if (self.item.detailImage) {
        [self setupDetailImage];
    }
    
    //bottomLine
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, self.height - 1, WIDTH_SCREEN, 1)];
    line.backgroundColor = RGBA(234, 234, 234, 1);
    [self.contentView addSubview:line];

}

- (void)setupImageView {
    
    self.imgView = [[UIImageView alloc]initWithImage:self.item.image];
    self.imgView.x = ImageToLeftGap;
    self.imgView.centerY = self.contentView.centerY;
    self.imgView.centerY = self.contentView.centerY;
    [self.contentView addSubview:self.imgView];
}

- (void)setupTitleLabel {
    
    self.titleNameLabel = [[UILabel alloc]init];
    self.titleNameLabel.text = self.item.title;
    self.titleNameLabel.textColor = RGBA(51, 51, 51, 1);
    self.titleNameLabel.font = [UIFont systemFontOfSize:TitleLabelFont];
    self.titleNameLabel.size = [self sizeForTitle:self.item.title
                                         withFont:self.titleNameLabel.font];
    self.titleNameLabel.centerY = self.contentView.centerY;
    self.titleNameLabel.x = CGRectGetMaxX(self.imgView.frame) + TitleLabelToImageGap;
    [self.contentView addSubview:self.titleNameLabel];
}

- (CGSize)sizeForTitle:(NSString *)title withFont:(UIFont *)font
{
    
    CGRect titleRect = [title boundingRectWithSize:CGSizeMake(FLT_MAX, FLT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName : font}
                                           context:nil];
    
    return CGSizeMake(titleRect.size.width,
                      titleRect.size.height);
}


- (void)setupAccessoryType {
    
    switch (self.item.accessoryType) {
        case WJItemAccessoryTypeNone:
            break;
        case WJItemAccessoryTypeDisclosureIndicator:
            [self setupIndicator];
            break;
        case WJItemAccessoryTypeSwitch:
            [self setupSwitch];
            break;
        default:
            break;
    }

}

- (void)setupIndicator {
    
    [self.contentView addSubview:self.indicator];
}

- (void)setupSwitch {
    
    WJSettingItem *switchItem = (WJSettingItem *)_item;
    if([LocalStorageTool isContainsKey:_item.title]){
        self.statuSwitch.on = [LocalStorageTool isTurnOnSwitchByTitle:_item.title];
    }
    else{
        [LocalStorageTool setBool:switchItem.defaultOn forKey:_item.title];
        self.statuSwitch.on = switchItem.defaultOn;
    }
    
    [self.contentView addSubview:self.statuSwitch];
}

- (void)setupDetailText {
    
    self.detailLabel = [[UILabel alloc]init];
    self.detailLabel.text = self.item.detailTitle;
    self.detailLabel.textColor = RGBA(142, 142, 142, 1);
    self.detailLabel.font = [UIFont systemFontOfSize:DetailLabelFont];
    self.detailLabel.size = [self sizeForTitle:self.item.detailTitle withFont:self.detailLabel.font];
    self.detailLabel.centerY = self.contentView.centerY;
    
    switch (self.item.accessoryType) {
        case WJItemAccessoryTypeNone:
            self.detailLabel.x = WIDTH_SCREEN - self.detailLabel.width - DetailViewToIndicatorGap - 2;
            break;
        case WJItemAccessoryTypeDisclosureIndicator:
            self.detailLabel.x = self.indicator.x - self.detailLabel.width - DetailViewToIndicatorGap;
            break;
        case WJItemAccessoryTypeSwitch:
            self.detailLabel.x = self.statuSwitch.x - self.detailLabel.width - DetailViewToIndicatorGap;
            break;
        default:
            break;
    }
    
    [self.contentView addSubview:self.detailLabel];
}

- (void)setupDetailImage {
    
    self.detailImageView = [[UIImageView alloc]initWithImage:self.item.detailImage];
    self.detailImageView.centerY = self.contentView.centerY;
    switch (self.item.accessoryType) {
        case WJItemAccessoryTypeNone:
            self.detailImageView.x = WIDTH_SCREEN - self.detailImageView.width - DetailViewToIndicatorGap - 2;
            break;
        case WJItemAccessoryTypeDisclosureIndicator:
            self.detailImageView.x = self.indicator.x - self.detailImageView.width - DetailViewToIndicatorGap;
            break;
        case WJItemAccessoryTypeSwitch:
            self.detailImageView.x = self.statuSwitch.x - self.detailImageView.width - DetailViewToIndicatorGap;
            break;
        default:
            break;
    }
    [self.contentView addSubview:self.detailImageView];
}

- (UIImageView *)indicator {
    
    if (!_indicator) {
        _indicator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-arrow"]];
        _indicator.centerY = self.contentView.centerY;
        _indicator.x = WIDTH_SCREEN - _indicator.width - IndicatorToRightGap;
    }
    return _indicator;
}

- (UISwitch *)statuSwitch {
    
    if (!_statuSwitch) {
        _statuSwitch = [[UISwitch alloc]init];
        _statuSwitch.centerY = self.contentView.centerY;
        _statuSwitch.x = WIDTH_SCREEN - _statuSwitch.width - IndicatorToRightGap;
        [_statuSwitch addTarget:self action:@selector(switchTouched:) forControlEvents:UIControlEventValueChanged];
    }
    return _statuSwitch;
}

- (void)switchTouched:(UISwitch *)sw {
    
    __weak typeof(self) weakSelf = self;
    [LocalStorageTool setBool:sw.isOn forKey:_item.title];
    if (_item.switchValueChanged) {
        self.item.switchValueChanged(weakSelf.statuSwitch.isOn);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
     // Configure the view for the selected state
}

@end
