//
//  AutorTableViewCell.m
//  Examen1
//
//  Created by CarlosA on 12/10/18.
//  Copyright © 2018 tcs. All rights reserved.
//

#import "AutorTableViewCell.h"
#import "SDWebImage/UIImageView+WebCache.h"

@implementation AutorTableViewCell{
    UIImageView *lblImageView;
    UILabel *lblName;
    UILabel *lblTime;
    UILabel *lblAddress;
    UILabel *mes;
    UILabel *dia;
    UIView *fecha1;
    UIView *fecha2;
    UIView *contenedor;
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)addViews{
    lblImageView = [[UIImageView alloc] init];
    lblName = [[UILabel alloc] init];
    lblName.textColor = [UIColor whiteColor];
    lblTime = [[UILabel alloc] init];
    lblTime.textColor = [UIColor whiteColor];
    lblAddress = [[UILabel alloc] init];
    lblAddress.textColor = [UIColor whiteColor];
    UIFontDescriptor * fontD = [lblAddress.font.fontDescriptor
                                fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold | UIFontDescriptorTraitItalic];
    lblAddress.font = [UIFont fontWithDescriptor:fontD size:0];
    fecha1 = [[UIView alloc] init];
    fecha1.backgroundColor = [UIColor redColor];
    fecha2 = [[UIView alloc] init];
    fecha2.backgroundColor = [UIColor whiteColor];
    mes = [[UILabel alloc] init];
    mes.textColor =[UIColor whiteColor];
    dia = [[UILabel alloc] init];
    contenedor = [[UIView alloc] init];
    contenedor.backgroundColor = [UIColor grayColor];
    
    [self addSubview:contenedor];
    [self addSubview:lblImageView];
    [self addSubview:lblName];
    [self addSubview:lblTime];
    [self addSubview:lblAddress];
    [self addSubview:fecha1];
    [self addSubview:fecha2];
    [self addSubview:mes];
    [self addSubview:dia];
    
    

    
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    
    //contenedor
    #pragma mark : contenedor constraint
    
    [contenedor setTranslatesAutoresizingMaskIntoConstraints:false];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:contenedor attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:10.00]];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:contenedor attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10.00]];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:contenedor attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-10.00]];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:contenedor attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10.00]];
    
    
    
    
    [lblImageView setTranslatesAutoresizingMaskIntoConstraints:false];
    
#pragma mark : lblImageView constraint
    // imgProfile.top = self.view + 40
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:lblImageView
                            attribute:NSLayoutAttributeTop
                            relatedBy:NSLayoutRelationEqual
                            toItem:contenedor
                            attribute:NSLayoutAttributeTop
                            multiplier:1.0 constant:10]];
    //Leading
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:lblImageView
                            attribute:NSLayoutAttributeLeading
                            relatedBy:NSLayoutRelationEqual
                            toItem:contenedor
                            attribute:NSLayoutAttributeLeading
                            multiplier:1.0 constant:20]];
    
    //width
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:lblImageView
                            attribute:NSLayoutAttributeHeight
                            relatedBy:NSLayoutRelationEqual
                            toItem:nil
                            attribute:NSLayoutAttributeNotAnAttribute
                            multiplier:1.0
                            constant:80.00]];
    //width
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:lblImageView
                            attribute:NSLayoutAttributeWidth
                            relatedBy:NSLayoutRelationEqual
                            toItem:nil
                            attribute:NSLayoutAttributeNotAnAttribute
                            multiplier:1.0
                            constant:80.00]];
    
    #pragma mark : lblName constraint
    
    //TITLE
    
    [lblName setTranslatesAutoresizingMaskIntoConstraints:false];
    //top
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:lblName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:lblImageView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.00]];
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:lblName attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:lblImageView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:50.00]];
    
    #pragma mark : lblTime constraint
    
    //Time
    
    [lblTime setTranslatesAutoresizingMaskIntoConstraints:false];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:lblTime attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:fecha1 attribute:NSLayoutAttributeTrailing
                                multiplier:1.0 constant:50.00]];
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:lblTime attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:fecha1 attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    
    
    
    
    #pragma mark : lblAddress constraint
    //Address
    
    [lblAddress setTranslatesAutoresizingMaskIntoConstraints:false];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:lblAddress attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lblTime attribute:NSLayoutAttributeBottom multiplier:1.0 constant: 5.00]];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:lblAddress attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:lblTime attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.00]];
    
    #pragma mark : fecha1 constraint
    //fecha1-cabecera
    
    [fecha1 setTranslatesAutoresizingMaskIntoConstraints:false];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:fecha1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lblImageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.00]];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:fecha1 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:contenedor attribute:NSLayoutAttributeLeading multiplier:1.0 constant:25.00]];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:fecha1
                            attribute:NSLayoutAttributeWidth
                            relatedBy:NSLayoutRelationEqual
                            toItem:nil
                            attribute:NSLayoutAttributeNotAnAttribute
                            multiplier:1.0
                            constant:60.00]];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:fecha1
                            attribute:NSLayoutAttributeHeight
                            relatedBy:NSLayoutRelationEqual
                            toItem:nil
                            attribute:NSLayoutAttributeNotAnAttribute
                            multiplier:1.0
                            constant:20.00]];
    
    
#pragma mark : fecha2 constraint
    //fecha1-cabecera
    
    [fecha2 setTranslatesAutoresizingMaskIntoConstraints:false];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:fecha2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:fecha1 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:fecha2 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:contenedor attribute:NSLayoutAttributeLeading multiplier:1.0 constant:25.00]];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:fecha2
                            attribute:NSLayoutAttributeWidth
                            relatedBy:NSLayoutRelationEqual
                            toItem:nil
                            attribute:NSLayoutAttributeNotAnAttribute
                            multiplier:1.0
                            constant:60.00]];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:fecha2
                            attribute:NSLayoutAttributeHeight
                            relatedBy:NSLayoutRelationEqual
                            toItem:nil
                            attribute:NSLayoutAttributeNotAnAttribute
                            multiplier:1.0
                            constant:40.00]];
    
    //mes
    
    [mes setTranslatesAutoresizingMaskIntoConstraints:false];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:mes attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:fecha1 attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:mes attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:fecha1 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    
    
    //diA
    
    [dia setTranslatesAutoresizingMaskIntoConstraints:false];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:dia attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:fecha2 attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:dia attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:fecha2 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    
    
    [self addConstraints:constraints];
    
}

-(void) FormatHora :(NSString*)inicio finalhora:(NSString*)final{
    NSDateFormatter *dataformateada = [[NSDateFormatter alloc] init];
    [dataformateada setDateFormat:@"HH:mm:ss"];
    
    NSDate *horaStart = [dataformateada dateFromString:inicio];
    NSDate *horaEnd = [dataformateada dateFromString:final];
    
    NSDateFormatter *formateada = [[NSDateFormatter alloc] init];
    [formateada setDateFormat:@"HH:mm:a"];
    
    NSString *horainicio = [formateada stringFromDate:horaStart];
    NSString *horafinal = [formateada stringFromDate:horaEnd];
    
    NSLog(@"%@",horainicio);
    NSLog(@"%@",horafinal);
    
    NSString*func = [NSString stringWithFormat:@"%@ - %@", horainicio, horafinal];
    [lblTime setText:func];
    

    
    
}

-(void) fechacontenedor: (NSString*)fecha{
    
    NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
    [dateformater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateformater dateFromString:fecha];
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"dd"];
    NSString *day = [formater stringFromDate:date];
    [formater setDateFormat:@"MMM"];
    NSString *month = [formater stringFromDate:date];
    
    [mes setText:month];
    [dia setText:day];
    
    
}
-(void)loadWithAutors:(TCSAuthor*)autor{
    [lblImageView sd_setImageWithURL:[NSURL URLWithString:autor.url_img]];
    lblImageView.layer.cornerRadius = 80.00/2;
    lblImageView.layer.masksToBounds = true;
    [lblName setText:autor.title];
    [self FormatHora:autor.startTime finalhora:autor.endTime];
    [lblAddress setText:autor.address];
    [self fechacontenedor:autor.date];

    //lblName.attributedText = [self twoColors autor.name withLastname:user.lastname];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
