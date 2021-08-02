//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Artyom Gurbovich
// On: 31.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingsViewController.h"
#import "ColorsViewController.h"

@interface SettingsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_tableView reloadData];
}

- (void)createTableView {
    CGRect tableFrame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _tableView = [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStyleInsetGrouped];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.rowHeight = 51;
    [self.view addSubview: _tableView];
    [NSLayoutConstraint activateConstraints: @[
        [_tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [_tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [_tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [_tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FirstCellIdentifier"];
        if (cell == nil)  cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"FirstCellIdentifier"];
        UISwitch* switchView = [[UISwitch alloc] init];
        [switchView setOn:[[NSUserDefaults standardUserDefaults] boolForKey:@"drawStories"]];
        [switchView addTarget:self action:@selector(switchChanged) forControlEvents:UIControlEventValueChanged];
        [cell setAccessoryView:switchView];
        [[cell textLabel] setText:@"Draw stories"];
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SecondCellIdentifier"];
        if (cell == nil)  cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SecondCellIdentifier"];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [[cell textLabel] setText:@"Stroke color"];
        NSString *colorName = [[NSUserDefaults standardUserDefaults] valueForKey:@"currentColor"];
        UIColor *color = [UIColor colorNamed:colorName];
        [[cell detailTextLabel] setTextColor:color];
        [[cell detailTextLabel] setText:[self hexStringFromColor: color]];
        return cell;
    }
}

-(void)switchChanged {
    [[NSUserDefaults standardUserDefaults] setBool:![[NSUserDefaults standardUserDefaults] boolForKey:@"drawStories"] forKey:@"drawStories"];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 1) {
        ColorsViewController *colorsViewController = [[ColorsViewController alloc] init];
        [[self navigationController] pushViewController:colorsViewController animated:YES];
    }
}


@end
