//
//  ListUserViewController.h
//  Examen1
//
//  Created by CarlosA on 12/10/18.
//  Copyright © 2018 tcs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListUserViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray*listAutors;

@end

NS_ASSUME_NONNULL_END
