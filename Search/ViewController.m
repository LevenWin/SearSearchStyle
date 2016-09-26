//
//  ViewController.m
//  Search
//
//  Created by 吴狄 on 16/9/6.
//  Copyright © 2016年 Leven. All rights reserved.
//

#import "ViewController.h"
#import "SearchViewController.h"
#import "AppDelegate.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property (nonatomic,retain)UITableView *tbv;
@end

@implementation ViewController
#pragma  mark --LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self loadData];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}
#pragma mark--UI
-(void)initUI{
    self.tbv=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tbv];
    self.tbv.delegate=self;
    self.tbv.dataSource=self;
    [self.tbv registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UISearchBar *bar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    
    bar.placeholder = @"请输入关键字搜索";
    bar.barTintColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0];
    bar.layer.borderWidth = 1;
    bar.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.tbv.tableHeaderView = bar;
    bar.delegate=self;
   
    
    UIImageView *img=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg2.jpg"]];
    img.contentMode=UIViewContentModeCenter;
    img.frame=self.view.bounds;
    
    self.tbv.backgroundView=img;
    self.title=@"搜索";

}
#pragma mark --Data
-(void)loadData{
    
}
#pragma mark --Action
-(UIImage*)processBgImg{
    AppDelegate *delegate=[UIApplication sharedApplication].delegate;
    UIWindow *window=delegate.window;
    
    UIGraphicsBeginImageContextWithOptions(window.bounds.size, window.opaque, 0.0);
    
    [window.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;

}
#pragma mark --Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text=@"刘文";
    cell.backgroundColor=[UIColor clearColor];
    cell.alpha=0;
    return cell;
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    SearchViewController *vc=[[SearchViewController alloc]init];
    vc.bgImg=[[UIImageView alloc]initWithFrame:self.view.bounds];
    vc.bgImg.image=[self processBgImg];
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:NO];
    return NO;
}
#pragma mark --Other
@end
