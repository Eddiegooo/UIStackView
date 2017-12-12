//
//  TwoViewController.m
//  UIStackView
//
//  Created by FQL on 2017/12/12.
//  Copyright © 2017年 FQL. All rights reserved.
//

#import "TwoViewController.h"

#define RadomColor [UIColor colorWithRed:random()%256/255.0 green:random()%256/255.0 blue:random()%256/255.0 alpha:1]

@interface TwoViewController ()

@property (nonatomic, strong) UIStackView *verStackView;
@property (nonatomic, strong) UIStackView *horiStackView;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Two StackView";
    
    [self.view addSubview:self.verStackView];
    [self addClickEvent];
    
}

- (void)addClickEvent {
    UIButton *addHorizontalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addHorizontalBtn setTitle:@"横行增加" forState:UIControlStateNormal];
    [addHorizontalBtn setTitleColor:RadomColor forState:UIControlStateNormal];
    addHorizontalBtn.frame = CGRectMake(0, 350, 100, 50);
    [addHorizontalBtn addTarget:self action:@selector(addHorizontalClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addHorizontalBtn];
    
    UIButton *removeHorizontalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [removeHorizontalBtn setTitle:@"横行减少" forState:UIControlStateNormal];
    [removeHorizontalBtn setTitleColor:RadomColor forState:UIControlStateNormal];
    removeHorizontalBtn.frame = CGRectMake(0, 400, 100, 50);
    [removeHorizontalBtn addTarget:self action:@selector(removeHorizontalClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeHorizontalBtn];
    
    UIButton *addVerticalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addVerticalBtn setTitle:@"纵行增加" forState:UIControlStateNormal];
    [addVerticalBtn setTitleColor:RadomColor forState:UIControlStateNormal];
    addVerticalBtn.frame = CGRectMake(0, 450, 100, 50);
    [addVerticalBtn addTarget:self action:@selector(addVerticalClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addVerticalBtn];
    
    UIButton *removeVerticalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [removeVerticalBtn setTitle:@"纵行减少" forState:UIControlStateNormal];
    [removeVerticalBtn setTitleColor:RadomColor forState:UIControlStateNormal];
    removeVerticalBtn.frame = CGRectMake(0, 500, 100, 50);
    [removeVerticalBtn addTarget:self action:@selector(removeVerticalClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeVerticalBtn];
}

- (void)addHorizontalClick {
    if (!_horiStackView) {
        [self.verStackView addArrangedSubview:self.horiStackView];
    }
    UILabel *label = [[UILabel alloc] init];
    label.text = @"add Hori Lable";
    label.textColor = RadomColor;
    [self.horiStackView addArrangedSubview:label];
    [UIView animateWithDuration:0.35 animations:^{
        [self.horiStackView layoutSubviews];
    }];
}

- (void)removeHorizontalClick {
    if (!_horiStackView) {
        return;
    }
    UIView *view = self.horiStackView.subviews.lastObject;
    if (!view) {
        return;
    }
    [self.horiStackView removeArrangedSubview:view];
    [view removeFromSuperview];
    
    [UIView animateWithDuration:0.35 animations:^{
        [self.horiStackView layoutSubviews];
    }];
}

- (void)addVerticalClick {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = RadomColor;
    [self.verStackView insertArrangedSubview:view atIndex:0];
    
    [UIView animateWithDuration:0.26 animations:^{
        [self.verStackView layoutSubviews];
    } completion:nil];
}

- (void)removeVerticalClick {
    if (!_verStackView) {
        return;
    }
    UIView *view = self.verStackView.subviews.lastObject;
    if (!view) {
        return;
    }
    [self.verStackView removeArrangedSubview:view];
    [view removeFromSuperview];
    
    [UIView animateWithDuration:0.26 animations:^{
        [self.verStackView layoutSubviews];
    } completion:nil];
}

- (UIStackView *)verStackView {
    if (!_verStackView) {
        _verStackView = [[UIStackView alloc] initWithFrame:self.view.frame];
        _verStackView.axis = UILayoutConstraintAxisVertical;
        _verStackView.alignment = UIStackViewAlignmentFill;
        _verStackView.distribution = UIStackViewDistributionFillEqually;
        _verStackView.spacing = 10;
    }
    return _verStackView;
}

- (UIStackView *)horiStackView {
    if (!_horiStackView) {
        _horiStackView = [[UIStackView alloc] init];
        _horiStackView.axis = UILayoutConstraintAxisHorizontal;
        _horiStackView.alignment = UIStackViewAlignmentCenter;
        _horiStackView.distribution = UIStackViewDistributionEqualSpacing;
    }
    return _horiStackView;
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
