//
//  DTMagicHeadsTableViewController.m
//  DTMagicHeadsTableViewController
//
//  Created by Diego Torres on 11/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DTMagicHeadsTableViewController.h"


@implementation DTMagicHeadsTableViewController
@synthesize solidHeaderBackgroundImage, transparentHeaderBackgroundImage;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.transparentHeaderBackgroundImage = nil;
        self.solidHeaderBackgroundImage = nil;
    }
    return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"frame"]) {
        
        CGPoint currentOff = [self.tableView contentOffset];
        UIView *vista = (UIView *)object;
        if (currentOff.y < 0) {
            [[vista viewWithTag:1964] setHidden:YES];
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:([self.tableView numberOfRowsInSection:0]-1) inSection:0]];
            if (cell) {
                [cell setHidden:NO];
            }
            return;
        }
        NSIndexPath *idi = [self.tableView indexPathForRowAtPoint:currentOff];
        NSInteger rows = [self.tableView numberOfRowsInSection:idi.section];
        if (idi.section == (vista.tag - 122)) {
            [[vista viewWithTag:1964] setHidden:NO];
            
            if (idi.row == (rows - 1)) {
                float a = (idi.section + 1)*(rows*[self.tableView rowHeight]+[self.tableView sectionHeaderHeight]);
                UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:idi];
                if (currentOff.y > a) {
                    [cell setHidden:YES];
                    [[vista viewWithTag:1964] setHidden:YES];
                } else {
                    [cell setHidden:NO];
                }
            }
            
        } else {
            [[vista viewWithTag:1964] setHidden:YES];
        }
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, [self tableView:tableView heightForHeaderInSection:section])];
    if ((self.transparentHeaderBackgroundImage && self.solidHeaderBackgroundImage)) {
        UIImageView *transparentBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.transparentHeaderBackgroundImage]];
        UIImageView *opaqueBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.solidHeaderBackgroundImage]];
        [headerView addSubview:transparentBG];
        opaqueBG.tag = 1964;
        [opaqueBG setHidden:YES];
        [headerView addSubview:opaqueBG];
        [opaqueBG release];
        [transparentBG release];
    } else {
        [headerView setBackgroundColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:0.3]];
        UIView *solidBG = [[UIView alloc] initWithFrame:headerView.frame];
        [solidBG setBackgroundColor:[UIColor redColor]];
        solidBG.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
        solidBG.tag = 1964; 
        [solidBG setHidden:YES];
        [headerView addSubview:solidBG];
        [solidBG release];
    }
    headerView.tag = 122 + section;
    [headerView addObserver:self forKeyPath:@"frame" options:0 context:NULL];
    return headerView;
}

@end
