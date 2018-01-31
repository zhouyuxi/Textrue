//
//  TextureCell.m
//  Test_Testure
//
//  Created by zhouyuxi on 2018/1/31.
//  Copyright © 2018年 zhouyuxi. All rights reserved.
//

#import "TextureCell.h"
#import "LuisXKit.h"

@implementation TextureCell

{
    ASTextNode *_titleNode; // 标题
    ASNetworkImageNode *_networkImageNode; // 图片
    ASButtonNode *_goodsTimeTagNode;        //标签
    ASTextNode *_limitNode;                 //限量
    ASTextNode *_specialPriceNode;          //特卖价格
    ASTextNode *_normalPriceNode;           //平时价
    ASNetworkImageNode *_nationalFlagNode;  //国旗
    ASTextNode *_nationalNameNode;          //国家名

}

- (instancetype)initWithModel:(TextureModel *)model
{
    self = [super init];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setvalueWithModel:model];
    }
    return self;
    
}

- (void)setvalueWithModel:(TextureModel *)model
{
    // 标题
    NSAttributedString *titleStr = [LuisXKit nodeAttributesStringText:model.title TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:16]];
    _titleNode = [LuisXKit nodeTextNodeAddNode:self];
    _titleNode.attributedText = titleStr;
    _titleNode.maximumNumberOfLines = 0;
//    _titleNode.style.flexShrink = 1;
    
    
    //开抢时间
    _goodsTimeTagNode = [LuisXKit nodeButtonNodeAddNode:self Title:@"10:00开抢" TitleColor:[UIColor whiteColor] Font:[UIFont systemFontOfSize:12] CornerRadius:25/2.0 BackgroundColor:[UIColor yellowColor] ContentVerticalAlignment:ASVerticalAlignmentCenter ContentHorizontalAlignment:ASHorizontalAlignmentMiddle];
    _goodsTimeTagNode.style.minSize = CGSizeMake(90, 25);
    
    // 限量
    NSAttributedString *xianliangStr = [LuisXKit nodeAttributesStringText:@"限量: 200" TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:12]];
    _limitNode = [LuisXKit nodeTextNodeAddNode:self];
    _limitNode.attributedText = xianliangStr;
    _limitNode.maximumNumberOfLines = 1;
    _limitNode.style.flexShrink = YES;
    
    
    // 国旗
    _nationalFlagNode = [LuisXKit nodeNetworkImageNodeAddNode:self ClipsToBounds:YES ContentMode:UIViewContentModeScaleAspectFit DefaultImage:[UIImage imageNamed:@"home_china_flag.png"]];
    _nationalFlagNode.style.preferredSize = CGSizeMake(25, 15);
    
    
    //国家文本
    NSAttributedString *guojiaStr = [LuisXKit nodeAttributesStringText:@"中国" TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:12]];
    _nationalNameNode = [LuisXKit nodeTextNodeAddNode:self];
    //textNode.backgroundColor = [UIColor orangeColor];
    _nationalNameNode.attributedText = guojiaStr;
    _nationalNameNode.maximumNumberOfLines = 1;
    _nationalNameNode.style.flexShrink = YES;
    
    
    // 商品图片
    _networkImageNode = [LuisXKit nodeNetworkImageNodeAddNode:self ClipsToBounds:NO ContentMode:UIViewContentModeScaleAspectFill DefaultImage:[UIImage imageNamed:@"luisX.png"]];
    _networkImageNode.URL = [NSURL URLWithString:model.icon];
    _networkImageNode.style.preferredSize = CGSizeMake(100, 100);
    
    // 特卖价
    NSAttributedString *temaiStr = [LuisXKit nodeAttributesStringText:@"特卖价:¥175" TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:14]];
   _specialPriceNode = [LuisXKit nodeTextNodeAddNode:self];
    //textNode.backgroundColor = [UIColor orangeColor];
    _specialPriceNode.attributedText = temaiStr;
    _specialPriceNode.maximumNumberOfLines = 1;
    _specialPriceNode.style.flexShrink = YES;
    
    // 平时价
    NSAttributedString *pingshiStr = [LuisXKit nodeAttributesStringText:@"平时价:¥175" TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:12]];
    _normalPriceNode = [LuisXKit nodeTextNodeAddNode:self];
    //textNode.backgroundColor = [UIColor orangeColor];
    _normalPriceNode.attributedText = pingshiStr;
    _normalPriceNode.maximumNumberOfLines = 1;
    _normalPriceNode.style.flexShrink = YES;

}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
     //国旗/国家---(水平约束)
    ASStackLayoutSpec *guoqiguojiaStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:5 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:@[_nationalFlagNode,_nationalNameNode]];
    
    //特卖/平时---(水平约束)
    ASStackLayoutSpec *priceStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                            spacing:17
                                                                     justifyContent:ASStackLayoutJustifyContentStart
                                                                         alignItems:ASStackLayoutAlignItemsCenter
                                                                           children:@[_specialPriceNode, _normalPriceNode]];
    
    //商品内容---(竖直约束)
    ASStackLayoutSpec *contentStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical
                                                                              spacing:5
                                                                       justifyContent:ASStackLayoutJustifyContentSpaceBetween
                                                                           alignItems:ASStackLayoutAlignItemsStretch
                                                                             children:@[guoqiguojiaStack,_titleNode,priceStack]];
    contentStack.style.flexShrink = 1.0;
    
    
    
    //商品图---(水平约束)
    ASStackLayoutSpec *goodsImageContentStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                                        spacing:10
                                                                                 justifyContent:ASStackLayoutJustifyContentStart
                                                                                     alignItems:ASStackLayoutAlignItemsStretch
                                                                                       children:@[_networkImageNode,contentStack]];
    
    
    //整体边框---(边框约束)
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10)
                                                  child:goodsImageContentStack];
    
    
}

@end
