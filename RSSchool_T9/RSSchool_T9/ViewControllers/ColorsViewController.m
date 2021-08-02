//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Artyom Gurbovich
// On: 31.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "ColorsViewController.h"

@interface ColorsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ColorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
}

- (void)createTableView {
    CGRect tableFrame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _tableView = [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStyleInsetGrouped];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.rowHeight = 42;
    [self.view addSubview: _tableView];
    [NSLayoutConstraint activateConstraints: @[
        [_tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [_tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [_tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [_tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ColorCellIdentifier"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (NSString *)hexStringFromColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    return [NSString stringWithFormat:@"#%02lx%02lx%02lx", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255)];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ColorCellIdentifier"];
    NSString* colorName = [NSString stringWithFormat:@"Color%ld", (long)indexPath.row];
    UIColor* color = [UIColor colorNamed:colorName];
    [[cell textLabel] setText: [self hexStringFromColor: color]];
    [[cell textLabel] setTextColor:color];
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"currentColor"] == colorName) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    } else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 13;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"Color%ld", (long)indexPath.row] forKey:@"currentColor"];
    [_tableView reloadData];
    [[self navigationController] popViewControllerAnimated:YES];
}

@end
