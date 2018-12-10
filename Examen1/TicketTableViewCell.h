//
//  TicketTableViewCell.h
//  Examen1
//
//  Created by Josue on 12/10/18.
//  Copyright © 2018 tcs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tickets.h"

NS_ASSUME_NONNULL_BEGIN

@interface TicketTableViewCell : UITableViewCell

-(void)addViews;
-(void)loadWithUser:(Tickets*)tickets;

@end

NS_ASSUME_NONNULL_END
