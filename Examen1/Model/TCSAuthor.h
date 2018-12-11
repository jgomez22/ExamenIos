//
//  TCSAuthor.h
//  Examen1
//
//  Created by CarlosA on 12/10/18.
//  Copyright © 2018 tcs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TCSAuthor : NSObject
@property(strong,nonatomic) NSString*code;
@property(strong,nonatomic) NSString*title;
@property(strong,nonatomic) NSString*date;
@property(strong,nonatomic) NSString*startTime;
@property(strong,nonatomic) NSString*endTime;
@property(strong,nonatomic) NSString*address;
@property(strong,nonatomic) NSString*detail;
@property(strong,nonatomic) NSString*created_at;
@property(strong,nonatomic) NSString*modify_at;
@property(strong,nonatomic) NSString*url_img;

-(void)initWithDictionary:(NSDictionary*)data;

@end

NS_ASSUME_NONNULL_END
