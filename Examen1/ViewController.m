//
//  ViewController.m
//  Examen1
//
//  Created by Josue on 12/7/18.
//  Copyright © 2018 tcs. All rights reserved.
//

#import "ViewController.h"
#import "Tickets.h"
#import "ListTicketViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self requestListTickets];
}

- (IBAction)addTaskAsync:(id)sender {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadTableView:) name:@"GetListTicket" object:nil];
    [self requestListTickets];
}

-(void)loadTableView:(NSNotification*)notification{
    NSArray*listTickets= (NSArray*)[notification object];
    ListTicketViewController*listView = [[ListTicketViewController alloc] init];
    [listView setListTickets:listTickets];
    [self presentViewController:listView animated:true completion:nil];
    
}

- (void)requestListTickets{
    NSURL*urlList=[NSURL URLWithString:@"https://api.myjson.com/bins/tp1am"];
    NSMutableURLRequest*request=[NSMutableURLRequest
                                 requestWithURL:urlList
                                 cachePolicy:NSURLRequestUseProtocolCachePolicy
                                 timeoutInterval:30.0];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    
    NSURLSessionDataTask*postDataTask = [session dataTaskWithRequest:request
        completionHandler:^(NSData*data,NSURLResponse*response, NSError*error)
        {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            if (error==nil){
                if ([httpResponse statusCode] == 200){
                NSDictionary*dictFromData=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                    NSArray*listTickets= (NSArray*)dictFromData;
                    NSMutableArray*sendListTickets = [[NSMutableArray alloc] init];
                    for (NSDictionary*ticketsDictionary in listTickets) {
                        Tickets*newTickets = [[Tickets alloc] init];
                        [newTickets initWithDictionary:ticketsDictionary];
                        [sendListTickets addObject: newTickets];
                    }
                    dispatch_async(dispatch_get_main_queue(),^{
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"GetListTicket" object:sendListTickets];
                    });
                }
            }
        }];
    [postDataTask resume];
}

@end
