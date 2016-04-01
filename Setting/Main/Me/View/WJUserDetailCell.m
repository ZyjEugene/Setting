//
//  WJUserDetailCell.m
//  Setting
//
//  Created by Eugene Love Rizza on 16/3/5.
//  Copyright © 2016年 com.wj. All rights reserved.
//

#import "WJUserDetailCell.h"
#import "UIView+Extension.h"

@interface WJUserDetailCell ()

@property (strong, nonatomic) UIImageView *avatarImageView;
@property (strong, nonatomic) UILabel *userNameLabel;
@property (strong, nonatomic) UILabel *attachLabel;

@end

@implementation WJUserDetailCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

         _avatarImageView = [[UIImageView alloc] init];
        [_avatarImageView.layer setMasksToBounds:YES];
        [_avatarImageView.layer setCornerRadius:5.0f];
        [self addSubview:_avatarImageView];
        
        _userNameLabel = [[UILabel alloc] init];
        [_userNameLabel setFont:[UIFont systemFontOfSize:17.0f]];
        [self addSubview:_userNameLabel];
        
        _attachLabel = [[UILabel alloc] init];
        [_attachLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [_attachLabel setTextColor:DEFAULT_NAVBAR_COLOR];
        [self addSubview:_attachLabel];
        
    }
    
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    float spaceX = self.width * 0.04;
    float spaceY = self.height * 0.15;
    float imageWidth = self.height - spaceY * 2;
    _avatarImageView.frame = CGRectMake(spaceX, spaceY, imageWidth, imageWidth);
    
    float labelX = imageWidth + spaceX * 2;
    float labelWidth = self.width - labelX - spaceX * 1.5;
    float labelHeight = imageWidth * 0.42;
    float labelY = spaceY * 1.45;
    _userNameLabel.frame = CGRectMake(labelX, labelY, labelWidth, labelHeight);
    
    _attachLabel.frame = CGRectMake(labelX, labelY + labelHeight + spaceY, labelWidth, labelHeight);

}

- (void)setPeopleModel:(WJPeopleModel *)peopleModel {

    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
 //    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:peopleModel.avatar] placeholderImage:[UIImage imageNamed:@""]];
    self.avatarImageView.image = [UIImage imageNamed:peopleModel.avatar];
    self.userNameLabel.text = peopleModel.username;
    self.attachLabel.text = peopleModel.nikename;
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
