//
//  OneViewController.m
//  UIStackView
//
//  Created by FQL on 2017/12/12.
//  Copyright © 2017年 FQL. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()
{
    UIStackView *_stackView;
}

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"One StackView";
    
    UIStackView *stackView = [[UIStackView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];
    stackView.backgroundColor = [UIColor cyanColor];
    // 水平还是竖直方向
    stackView.axis = UILayoutConstraintAxisHorizontal;
    // subView的内容  具体展示样式基本整个属性决定
    stackView.distribution = UIStackViewDistributionFillEqually;
    /**  UIStackViewDistribution
     
     UIStackViewDistributionFill = 0,
     UIStackViewDistributionFillEqually,  //内部控件大小一样
     UIStackViewDistributionFillProportionally,  和第二个貌似效果一样，间距相等，控件宽度不一定 一大一小。一大一小、、
     UIStackViewDistributionEqualSpacing,   //各个控件之间的间距相等，自动调整的
     UIStackViewDistributionEqualCentering,  //大小不一样 没啥规律呢 和 1 3 差不多呢。。
     */
    //内容对齐方式
    stackView.alignment = UIStackViewAlignmentFill;
    /**
    UIStackViewAlignmentFill,
    UIStackViewAlignmentLeading,
    UIStackViewAlignmentTop = UIStackViewAlignmentLeading,
    UIStackViewAlignmentFirstBaseline, // Valid for horizontal axis only
    UIStackViewAlignmentCenter,
    UIStackViewAlignmentTrailing,
    UIStackViewAlignmentBottom = UIStackViewAlignmentTrailing,
    UIStackViewAlignmentLastBaseline, // Valid for horizontal axis only
     */
    stackView.spacing = 10;
    [self.view addSubview:stackView];
    _stackView = stackView;
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.frame = CGRectMake(250, 400, 100, 40);
    [addBtn setTitle:@"add a View" forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addAStackView) forControlEvents:UIControlEventTouchUpInside];
    [addBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:addBtn];
    
    
    UIButton *deleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    deleBtn.frame = CGRectMake(10, 400, 100, 40);
    [deleBtn setTitle:@"del a View" forState:UIControlStateNormal];
    [deleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [deleBtn addTarget:self action:@selector(delAStackView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleBtn];
    
}

-(void)addAStackView {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor colorWithRed:random()%256/255.0 green:random()%256/255.0 blue:random()%256/255.0 alpha:1];;
    [_stackView addArrangedSubview:view];
    
    [UIView animateWithDuration:0.35 animations:^{
        [_stackView layoutSubviews];
    }];
}

- (void)delAStackView {
    UIView *view = _stackView.subviews.lastObject;
    //这里只是从stackView移除，可以理解成隐藏吧
    [_stackView removeArrangedSubview:view];
    //这里才是真正将整个VIew移除
    [view removeFromSuperview];
    
    [UIView animateWithDuration:0.35 animations:^{
        [_stackView layoutSubviews];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
