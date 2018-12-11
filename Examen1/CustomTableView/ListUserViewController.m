//
//  ListUserViewController.m
//  Examen1
//
//  Created by CarlosA on 12/10/18.
//  Copyright © 2018 tcs. All rights reserved.
//

#import "ListUserViewController.h"
#import "AutorTableViewCell.h"

@interface ListUserViewController ()

@end

@implementation ListUserViewController{
    UITableView *tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self.view setBackgroundColor:[UIColor darkGrayColor]];
    
    tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    [tableView setBackgroundColor:[UIColor cyanColor]];
    [tableView registerClass:[AutorTableViewCell class] forCellReuseIdentifier:@"AutorCell"];
    [self.view addSubview:tableView];
    
    [tableView setTranslatesAutoresizingMaskIntoConstraints:false];
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    
    [self.view addConstraints:@[top,bottom,leading,trailing]];
    
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.listAutors count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // indexPath.section  numero de seccion
    // indexPath.row  numero de filas
    AutorTableViewCell *cell = (AutorTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"AutorCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor blackColor];
    
    [cell addViews];
    [cell loadWithAutors:(TCSAuthor*)[self.listAutors objectAtIndex:indexPath.row]];
    // Configure the cell...
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200.00;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.listAutors removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        //CoreData , NSUserdefaults, NSKeychain , SQLite --- RealmDatabase, Firebase
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

@end
