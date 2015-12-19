//
//  ViewController.m
//  GridTableViewSample
//
//  Created by Akira Iwaya on 2015/12/19.
//  Copyright © 2015年 akira108. All rights reserved.
//

#import "ViewController.h"
#import "GridTableView.h"

@interface ViewController () <GridTableViewDelegate, GridTableViewDataSource>
@property (weak, nonatomic) IBOutlet GridTableView *gridTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.gridTableView.gridDataSource = self;
    self.gridTableView.gridDelegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)numberOfColumnsInGridTableView:(GridTableView *)gridTableView {
    return 10;
}

- (NSUInteger)numberOfRowsInGridTableView:(GridTableView *)gridTableView {
    return 5;
}

- (UIView *)gridTableView:(GridTableView *)gridTableView viewForColumn:(NSUInteger)column {
    switch (column) {
        case 0:
            return [[UILabel alloc] init];
            break;
        case 1:
            return [[UITextView alloc] init];
            break;
        case 2:
            return [UIButton buttonWithType:UIButtonTypeSystem];
            break;
        default: {
            UIView *view = [[UIView alloc] init];
            if (column %2 == 0){
                view.backgroundColor = [UIColor redColor];
            } else {
                view.backgroundColor = [UIColor blueColor];
            }
            return view;
        }
            
    }
    return nil;
}

- (void)updateGrid:(UIView *)view atRow:(NSUInteger)row column:(NSUInteger)column {
    switch (column) {
        case 0: {
            UILabel *label = (UILabel *)view;
            label.text = @"aaa";
        }
            break;
        case 1: {
            UITextView *textView = (UITextView *)view;
            textView.text = @"bbb";
        }
            break;
        case 2: {
            UIButton *button = (UIButton *)view;
            button.titleLabel.text = @"ccc";
        }
            break;
        default:
            break;
    }
}

@end
