//
//  GridTableView.m
//  GridTableViewSample
//
//  Created by Akira Iwaya on 2015/12/19.
//  Copyright © 2015年 akira108. All rights reserved.
//

#import "GridTableView.h"

@interface GridTableView () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation GridTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const reuseIdentifier = @"reuseIdentifier";
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    NSUInteger numberOfColumns = [self.gridDataSource numberOfColumnsInGridTableView:self];
    
    if(cell == nil) {
        // configure ...
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    
        for (NSInteger i = 0; i< numberOfColumns; i++) {
            UIView *grid = [self.gridDataSource gridTableView:self viewForColumn:i];
            CGFloat width = CGRectGetWidth(self.bounds) / numberOfColumns;
            grid.frame = CGRectMake(width * i, 0.0, width, 44.0f);
            grid.tag = i + 1;
            [cell addSubview:grid];
        }
    }
    
    for (NSUInteger i=0; i<numberOfColumns; i++) {
        [self.gridDataSource updateGrid:[cell viewWithTag:i + 1] atRow:indexPath.row column:i];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)index {
    
}


@end
