//
//  ViewController.m
//  Test_Testure
//
//  Created by zhouyuxi on 2018/1/31.
//  Copyright © 2018年 zhouyuxi. All rights reserved.
//

#import "ViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "TextureModel.h"
#import "TextureCell.h"
#import "YYFPSLabel.h"


@interface ViewController ()<ASTableDataSource,ASTableDelegate>
@property (nonatomic,strong) ASTableNode *myTableNode;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic, strong) YYFPSLabel *fpsLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self buildData];
    
    [self buildTableNode];
    
    [self testFPSLabel];
    
}

#pragma mark - FPS demo

- (void)testFPSLabel {
    _fpsLabel = [YYFPSLabel new];
    _fpsLabel.frame = CGRectMake(200, 200, 50, 30);
    [_fpsLabel sizeToFit];
    [self.view addSubview:_fpsLabel];
}

-(void)buildData
{
    _dataArray = [NSMutableArray array];
    TextureModel *model = [[TextureModel alloc] init];
    model.title = @"[SKII]珀莱雅靓白肌密明星面霜 白肌密明星面霜 白肌密明星面霜 白肌密明星面霜";
    model.icon  = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517401639461&di=99167152f0517b0ec254fb04f5208efe&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201505%2F19%2F20150519230441_riBsE.jpeg";
    [_dataArray addObject:model];
    TextureModel *model1 = [[TextureModel alloc] init];
    model1.title = @"[SKII]珀莱雅靓白肌密明星面霜 白肌密明星面霜 白肌密明星面霜 白肌密明星面霜";
    model1.icon  = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517401639463&di=275804de524c0301e2e74242d3b1cf0f&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201611%2F12%2F20161112234951_3AvtS.jpeg";
    [_dataArray addObject:model1];
    TextureModel *model2 = [[TextureModel alloc] init];
    model2.title = @"[SKII]珀莱雅靓白肌密明星面霜 白肌密明星面霜 白肌密明星面霜 白肌密明星面霜";
    model2.icon  = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517401639461&di=6c56bf97c833e40ca6f80d3a7204bf60&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201505%2F28%2F20150528204728_XrWmL.thumb.700_0.jpeg";
    [_dataArray addObject:model2];
    TextureModel *model3 = [[TextureModel alloc] init];
    model3.title = @"[SKII]珀莱雅靓白肌密明星面霜 白肌密明星面霜 白肌密明星面霜 白肌密明星面霜";
    model3.icon  = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517401639460&di=5ed33c448c48f9834856a1313e1b67e2&imgtype=0&src=http%3A%2F%2Fimg.tupianzj.com%2Fuploads%2Fallimg%2F170201%2F9-1F201210G5.jpg";
    [_dataArray addObject:model3];
    TextureModel *model4 = [[TextureModel alloc] init];
    model4.title = @"[SKII]珀莱雅靓白肌密明星面霜 白肌密明星面霜 白肌密明星面霜 白肌密明星面霜";
    model4.icon  = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517401639460&di=de04cc2e1c16248c8cf4153a609882bd&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201505%2F28%2F20150528204649_ETaKe.jpeg";
    [_dataArray addObject:model4];
    TextureModel *model5 = [[TextureModel alloc] init];
    model5.title = @"[SKII]珀莱雅靓白肌密明星面霜 白肌密明星面霜 白肌密明星面霜 白肌密明星面霜";
    model5.icon  = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517401639461&di=a4fecef55640437690005e643e3bb94f&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201511%2F03%2F20151103232833_Ncwj4.jpeg";
    [_dataArray addObject:model5];
    TextureModel *model6 = [[TextureModel alloc] init];
    model6.title = @"[SKII]珀莱雅靓白肌密明星面霜 白肌密明星面霜 白肌密明星面霜 白肌密明星面霜";
    model6.icon  = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517401639462&di=368737dde9811d01d4a92b157db03191&imgtype=0&src=http%3A%2F%2Fimg.tupianzj.com%2Fuploads%2Fallimg%2F160409%2F9-160409210424.jpg";
    [_dataArray addObject:model6];
    
    
    
    
    TextureModel *model7 = [[TextureModel alloc] init];
    model7.title = @"[SKII]珀莱雅靓白肌密明星面霜 白肌密明星面霜 白肌密明星面霜 白肌密明星面霜";
    model7.icon  = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517401639461&di=99167152f0517b0ec254fb04f5208efe&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201505%2F19%2F20150519230441_riBsE.jpeg";
    [_dataArray addObject:model7];
    TextureModel *model8 = [[TextureModel alloc] init];
    model8.title = @"[SKII]珀莱雅靓白肌密明星面霜 白肌密明星面霜 白肌密明星面霜 白肌密明星面霜";
    model8.icon  = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517401639463&di=275804de524c0301e2e74242d3b1cf0f&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201611%2F12%2F20161112234951_3AvtS.jpeg";
    [_dataArray addObject:model8];
    TextureModel *model9 = [[TextureModel alloc] init];
    model9.title = @"[SKII]珀莱雅靓白肌密明星面霜 白肌密明星面霜 白肌密明星面霜 白肌密明星面霜";
    model9.icon  = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517401639461&di=6c56bf97c833e40ca6f80d3a7204bf60&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201505%2F28%2F20150528204728_XrWmL.thumb.700_0.jpeg";
    [_dataArray addObject:model9];
    TextureModel *model10 = [[TextureModel alloc] init];
    model10.title = @"[SKII]珀莱雅靓白肌密明星面霜 白肌密明星面霜 白肌密明星面霜 白肌密明星面霜";
    model10.icon  = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517401639460&di=5ed33c448c48f9834856a1313e1b67e2&imgtype=0&src=http%3A%2F%2Fimg.tupianzj.com%2Fuploads%2Fallimg%2F170201%2F9-1F201210G5.jpg";
    [_dataArray addObject:model10];
    TextureModel *model11 = [[TextureModel alloc] init];
    model11.title = @"[SKII]珀莱雅靓白肌密明星面霜 白肌密明星面霜 白肌密明星面霜 白肌密明星面霜";
    model11.icon  = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517401639460&di=de04cc2e1c16248c8cf4153a609882bd&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201505%2F28%2F20150528204649_ETaKe.jpeg";
    [_dataArray addObject:model11];
    TextureModel *model12 = [[TextureModel alloc] init];
    model12.title = @"[SKII]珀莱雅靓白肌密明星面霜 白肌密明星面霜 白肌密明星面霜 白肌密明星面霜";
    model12.icon  = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517401639461&di=a4fecef55640437690005e643e3bb94f&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201511%2F03%2F20151103232833_Ncwj4.jpeg";
    [_dataArray addObject:model12];
    TextureModel *model13 = [[TextureModel alloc] init];
    model13.title = @"[SKII]珀莱雅靓白肌密明星面霜 白肌密明星面霜 白肌密明星面霜 白肌密明星面霜";
    model13.icon  = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517401639462&di=368737dde9811d01d4a92b157db03191&imgtype=0&src=http%3A%2F%2Fimg.tupianzj.com%2Fuploads%2Fallimg%2F160409%2F9-160409210424.jpg";
    [_dataArray addObject:model13];
    

}

- (void)buildTableNode
{
    _myTableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    _myTableNode.frame = self.view.frame;
    _myTableNode.dataSource = self;
    _myTableNode.delegate = self;
    _myTableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _myTableNode.view.leadingScreensForBatching= 1.0;
    [self.view addSubnode:_myTableNode];
    
//    _myTableNode.view.backgroundColor = [UIColor yellowColor];
    
}

- (NSInteger)numberOfSectionsInTableNode:(ASTableNode *)tableNode
{
    return 1;
    
}

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section
{
    
    return _dataArray.count;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TextureModel *model = [_dataArray objectAtIndex:indexPath.row];
    ASCellNode *(^ASCellNodeBlock)(void) = ^ASCellNode *() {
        TextureCell *cellNode = [[TextureCell alloc] initWithModel:model];
        return cellNode;
    };
    

    return ASCellNodeBlock;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
