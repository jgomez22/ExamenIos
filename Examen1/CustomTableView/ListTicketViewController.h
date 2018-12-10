//
//  ListTicketViewController.h
//  Examen1
//
//  Created by Josue on 12/10/18.
//  Copyright © 2018 tcs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListTicketViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic)NSMutableArray*listTickets;

@end

NS_ASSUME_NONNULL_END
