//
//  DTMagicHeadsTableViewController.h
//  DTMagicHeadsTableViewController
//
//  Created by Diego Torres on 11/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTMagicHeadsTableViewController : UITableViewController {
    NSString *solidHeaderBackgroundImage;
    NSString *transparentHeaderBackgroundImage;
}

@property (nonatomic, retain)  NSString *solidHeaderBackgroundImage;
@property (nonatomic, retain)  NSString *transparentHeaderBackgroundImage;

@end
