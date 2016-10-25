//
//  MainTableViewController.m
//  Learning
//
//  Created by 蔡晶 on 16/10/17.
//  Copyright © 2016年 WHBK. All rights reserved.
//

#import "MainTableViewController.h"
#import "VCModel.h"

@interface MainTableViewController ()<UINavigationControllerDelegate>
@property (nonatomic, copy) NSArray *dataSource;
@property (nonatomic, copy) NSString *pushedVCName;
@end
static NSString *const identifier = @"identifier";

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"菜单";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    VCModel *model1 = [VCModel VCModelWithTitle:@"声波效果" VCName:@"WaveEffectViewController"];
    //MaskLayerViewController CAGradientLayerViewController
    VCModel *model2 = [VCModel VCModelWithTitle:@"Layer的mask属性" VCName:@"MaskLayerViewController"];
    VCModel *model3 = [VCModel VCModelWithTitle:@"CAGradientLayer" VCName:@"CAGradientLayerViewController"];
    _dataSource = @[model1,model2,model3];
    self.navigationController.delegate = self;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    VCModel *model = _dataSource[indexPath.row];
    cell.textLabel.text = model.title;
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    VCModel *model = _dataSource[indexPath.row];
    _pushedVCName = model.title;
    Class class =NSClassFromString(model.VCName);
    [self.navigationController pushViewController:[class new] animated:YES];
}
#pragma mark - Navigation Delegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController != self) viewController.title = _pushedVCName;
}

@end
