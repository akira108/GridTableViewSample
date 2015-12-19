//
//  GridTableView.h
//  GridTableViewSample
//
//  Created by Akira Iwaya on 2015/12/19.
//  Copyright © 2015年 akira108. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GridTableView;

@protocol GridTableViewDelegate <NSObject>

- (void)gridTableView:(GridTableView *)gridTableView didSelectRow:(NSUInteger)row column:(NSUInteger)column;

@end

@protocol GridTableViewDataSource <NSObject>

- (NSUInteger)numberOfColumnsInGridTableView:(GridTableView *)gridTableView;
- (NSUInteger)numberOfRowsInGridTableView:(GridTableView *)gridTableView;
- (UIView *)gridTableView:(GridTableView *)gridTableView viewForColumn:(NSUInteger)column;
- (void)updateGrid:(UIView *)view atRow:(NSUInteger)row column:(NSUInteger)column;

@end


@interface GridTableView : UITableView
@property(nonatomic, weak)id<GridTableViewDelegate> gridDelegate;
@property(nonatomic, weak)id<GridTableViewDataSource> gridDataSource;

@end
