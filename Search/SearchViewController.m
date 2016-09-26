//
//  SearchViewController.m
//  Search
//
//  Created by 吴狄 on 16/9/6.
//  Copyright © 2016年 Leven. All rights reserved.
//
#import "UIView+draw.h"
#import "SearchViewController.h"
#define UISCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define UISCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface SearchViewController ()<UISearchBarDelegate>{
    UISearchBar *bar;
    UIVisualEffectView *efft;
    UIView *searchV;
    UIButton *cancelBtn;
}

@end

@implementation SearchViewController
#pragma  mark --LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self loadData];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [bar becomeFirstResponder];
}

#pragma mark--UI
-(void)initUI{
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.view addSubview:self.bgImg];

    
    efft=[[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    
    UIVisualEffect *e=[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    efft.effect=e;
    [self.view addSubview:efft];
    
    searchV=[[UIView alloc]initWithFrame:CGRectMake(0, 64,UISCREEN_WIDTH, 40)];
    
    searchV.backgroundColor=[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    [searchV addBottomLine];
    [searchV addTopLine];
    
    bar = [[UISearchBar alloc] initWithFrame:CGRectMake(0,5, self.view.frame.size.width-10, 30)];
    bar.placeholder = @"请输入关键字搜索";
    bar.barTintColor = [UIColor whiteColor];
    bar.layer.borderWidth = 0.5;
    bar.layer.borderColor = [[UIColor colorWithRed:0.801 green:0.801 blue:0.801 alpha:1.0] CGColor];
    
    bar.delegate=self;
   [searchV addSubview:bar];
    
    cancelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    cancelBtn.frame=CGRectMake(UISCREEN_WIDTH+10, 0, 40, 30);
    [cancelBtn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    cancelBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    [searchV addSubview:cancelBtn];
    [self.view addSubview:searchV];
    
    efft.alpha=0;
    cancelBtn.alpha=0;

    
    
}
-(void)showAnimation{
    [UIView animateWithDuration:0.35 animations:^{
        efft.alpha=1;
        self.bgImg.frame=CGRectMake(0, -64, self.view.frame.size.width, self.view.frame.size.height);
        searchV.frame=CGRectMake(0, 0, UISCREEN_WIDTH, 64);
        bar.frame=CGRectMake(12, 25, UISCREEN_WIDTH-70, 30);
        cancelBtn.alpha=1;
        cancelBtn.frame=CGRectMake(UISCREEN_WIDTH-50, 20, 40, 44);
    }];
}
-(void)cancel{
    [bar resignFirstResponder];
}
-(void)hideAnimation{
    [UIView animateWithDuration:0.35 animations:^{
        efft.alpha=0;
        self.bgImg.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        searchV.frame=CGRectMake(0, 64, UISCREEN_WIDTH, 30);
        bar.frame=CGRectMake(0, 0, UISCREEN_WIDTH, 40);
        cancelBtn.frame=CGRectMake(UISCREEN_WIDTH+10, 0, 40, 30);
        cancelBtn.alpha=0;
    }completion:^(BOOL finished) {
        bar.text=@"";
        [self.navigationController popViewControllerAnimated:NO];
        

    }];
}
#pragma mark --Data
-(void)loadData{
    
}
#pragma mark --Action

#pragma mark --Delegate
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [self showAnimation];
    return YES;
}
-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    
    if (self.searchClick) {
        self.searchClick(searchBar.text);
    }
    [self hideAnimation];
    return YES;

}
#pragma mark --Other
@end
