//
//  ListTicketViewController.m
//  Examen1
//
//  Created by Josue on 12/10/18.
//  Copyright © 2018 tcs. All rights reserved.
//

#import "ListTicketViewController.h"
#import "TicketTableViewCell.h"

@interface ListTicketViewController ()

@end

@implementation ListTicketViewController{
    UITableView*tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableView = [[UITableView alloc]init];
    tableView.backgroundColor = [UIColor blackColor];
    [tableView registerClass:[TicketTableViewCell class] forCellReuseIdentifier:@"TicketCell"];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:tableView];

    //CREAR BOTON PARA ELIMINAR Y CAMBIAR DE POSICION
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
    action:@selector(buttonClicked:)
    forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Editar" forState:UIControlStateNormal];
    //button.frame = CGRectMake(0, 0, 50, 50);
    [self.view addSubview:button];
    
    [button setTranslatesAutoresizingMaskIntoConstraints:false];
    
    NSLayoutConstraint *topButton = [NSLayoutConstraint
                                          constraintWithItem:button
                                          attribute:NSLayoutAttributeTop
                                          relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:30];
    
    NSLayoutConstraint *trailingButton = [NSLayoutConstraint
                                         constraintWithItem:button
                                         attribute:NSLayoutAttributeTrailing
                                         relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-20];
    /*
    NSLayoutConstraint *verticalButton = [NSLayoutConstraint constraintWithItem:mes attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                 toItem:cabecera
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 multiplier:1.0 constant:0.0];
     */
    
    [tableView setTranslatesAutoresizingMaskIntoConstraints:false];
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:tableView  attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:80];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    
    [self.view addConstraints:@[top,bottom,leading,trailing,topButton,trailingButton]];
    
    [tableView setDataSource:self];
    [tableView setDelegate:self];
}

-(void)viewDidAppear:(BOOL)animated{
    
}

#pragma mark - Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listTickets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // indexPath.section  numero de seccion
    // indexPath.row  numero de filas
    TicketTableViewCell *cell = (TicketTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"TicketCell" forIndexPath:indexPath];
    [cell addViews];
    [cell loadWithUser:(Tickets*)[self.listTickets objectAtIndex:indexPath.row]];
    // Configure the cell...
    cell.backgroundColor = [UIColor blackColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200.00;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSLog(@"SADSA");
    [self.listTickets exchangeObjectAtIndex:fromIndexPath.row withObjectAtIndex:toIndexPath.row];
}

-(void) buttonClicked:(UIButton*)sender
{
    tableView.editing = !tableView.editing;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
     if (editingStyle == UITableViewCellEditingStyleDelete) {
     // Delete the row from the data source
         [self.listTickets removeObjectAtIndex:indexPath.row];
         [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     } else if (editingStyle == UITableViewCellEditingStyleInsert) {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
 }
@end
