//
//  Tickets.m
//  Examen1
//
//  Created by Josue on 12/7/18.
//  Copyright © 2018 tcs. All rights reserved.
//

#import "Tickets.h"

@implementation Tickets

-(void)initWithDictionary:(NSDictionary *)data{
    self.code = [data objectForKey:@"code"];
    self.title = [data objectForKey:@"title"];
    self.date = [data objectForKey:@"date"];
    self.startTime = [data objectForKey:@"startTime"];
    self.endTime = [data objectForKey:@"endTime"];
    self.address = [data objectForKey:@"address"];
    self.detail = [data objectForKey:@"detail"];
    self.created_at = [data objectForKey:@"created_at"];
    self.modify_at = [data objectForKey:@"modify_at"];
    self.url_img = [data objectForKey:@"url_img"];
}

@end
