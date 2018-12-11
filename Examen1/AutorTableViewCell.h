//
//  AutorTableViewCell.h
//  Examen1
//
//  Created by CarlosA on 12/10/18.
//  Copyright © 2018 tcs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCSAuthor.h"

NS_ASSUME_NONNULL_BEGIN

@interface AutorTableViewCell : UITableViewCell

-(void)addViews;
-(void)loadWithAutors:(TCSAuthor*)autor;
@end

NS_ASSUME_NONNULL_END
