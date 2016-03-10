//
//  PalaceRouteController.m
//  PalaceByObjectC
//
//  Created by 陈梦楼 on 16/3/9.
//  Copyright © 2016年 chenmenglou. All rights reserved.
//

#import "PalaceRouteController.h"
#import "ADSlide.h"

@interface PalaceRouteController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *palaceRouteControllerTable;
    NSMutableArray *palaceRouteControllerData;
}
@end

@implementation PalaceRouteController

#pragma mark- base

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"PalaceRouteController"];
    [self initPalaceRouteControllerData];
    [self initPalaceRouteControllerTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)initPalaceRouteControllerData{
    palaceRouteControllerData=[[NSMutableArray alloc] init];
    [palaceRouteControllerData addObject:@"ADSlide"];
}

- (void)initPalaceRouteControllerTable{
    palaceRouteControllerTable=[[UITableView alloc] init];
    palaceRouteControllerTable.delegate=self;
    palaceRouteControllerTable.dataSource=self;
    palaceRouteControllerTable.rowHeight=68;
    palaceRouteControllerTable.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:palaceRouteControllerTable];
    [palaceRouteControllerTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(self.view);
    }];
}

#pragma mark- UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return palaceRouteControllerData.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc] init];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.backgroundColor=UIColor.whiteColor;
    }
    [self setCell:cell rowAt:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([palaceRouteControllerData[indexPath.row] isEqual:@"ADSlide"]) {
        ADSlide *_ADSlide=[[ADSlide alloc] init];
        [self.navigationController pushViewController:_ADSlide animated:YES];
    }
}

#pragma mark- tools function
-(void)setCell:(UITableViewCell*)cell rowAt:(NSInteger)index{
    UILabel *title=[[UILabel alloc] init];
    title.text=palaceRouteControllerData[index];
    [cell.contentView addSubview:title];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(cell.contentView);
        make.centerY.equalTo(cell.contentView);
    }];
    
    
    UIView *line=[[UIView alloc] init];
    line.backgroundColor=[UIColor blackColor];
    [cell.contentView addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cell.contentView).offset(16);
        make.bottom.equalTo(cell.contentView.mas_bottom).offset(-1);
        make.height.equalTo(@1);
        make.width.equalTo(@(kDEVICEWIDTH-16));
    }];
    
}


@end
