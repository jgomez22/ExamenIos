//
//  TicketTableViewCell.m
//  Examen1
//
//  Created by Josue on 12/10/18.
//  Copyright © 2018 tcs. All rights reserved.
//

#import "TicketTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation TicketTableViewCell{
    
    UILabel*titulo;
    UIImageView*imagen;
    UILabel*horaFuncion;
    UILabel*lugarFuncion;
    
    UIView*cabecera;
    UIView*cuerpo;
    UILabel*dia;
    UILabel*mes;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)addViews{

    titulo = [[UILabel alloc]init];
    imagen = [[UIImageView alloc]init];
    
    cabecera  = [[UIView alloc] init];
    cabecera.backgroundColor = [UIColor redColor];
    cuerpo  = [[UIView alloc] init];
    cuerpo.backgroundColor = [UIColor whiteColor];
    
    dia = [[UILabel alloc]init];
    mes = [[UILabel alloc]init];
    
    
    [self addSubview:titulo];
    [self addSubview:imagen];
    [self addSubview:cabecera];
    [self addSubview:cuerpo];
    [self addSubview:dia];
    [self addSubview:mes];
    
    NSMutableArray*constraints=[[NSMutableArray alloc]init];
    
    [titulo setTranslatesAutoresizingMaskIntoConstraints:false];
    [imagen setTranslatesAutoresizingMaskIntoConstraints:false];
    [cabecera setTranslatesAutoresizingMaskIntoConstraints:false];
    [cuerpo setTranslatesAutoresizingMaskIntoConstraints:false];
    [dia setTranslatesAutoresizingMaskIntoConstraints:false];
    [mes setTranslatesAutoresizingMaskIntoConstraints:false];
    
    //constraint dia
    //centraod horizontalmente con respecto al cuerpo
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:dia
                            attribute:NSLayoutAttributeCenterX
                            relatedBy:NSLayoutRelationEqual
                            toItem:cuerpo
                            attribute:NSLayoutAttributeCenterX
                            multiplier:1.0 constant:0.0]];
    //centraod verticalmente con respecto al cuerpo
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:dia
                            attribute:NSLayoutAttributeCenterY
                            relatedBy:NSLayoutRelationEqual
                            toItem:cuerpo
                            attribute:NSLayoutAttributeCenterY
                            multiplier:1.0 constant:0.0]];
    //constraint mes
    //centraod horizontalmente con respecto al cabecera
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:mes
                            attribute:NSLayoutAttributeCenterX
                            relatedBy:NSLayoutRelationEqual
                            toItem:cabecera
                            attribute:NSLayoutAttributeCenterX
                            multiplier:1.0 constant:0.0]];
    //centraod verticalmente con respecto al cabecera
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:mes
                            attribute:NSLayoutAttributeCenterY
                            relatedBy:NSLayoutRelationEqual
                            toItem:cabecera
                            attribute:NSLayoutAttributeCenterY
                            multiplier:1.0 constant:0.0]];

    
    //constraint cabecera
    //top
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:cabecera
                            attribute:NSLayoutAttributeTop
                            relatedBy:NSLayoutRelationEqual
                            toItem:imagen
                            attribute:NSLayoutAttributeBottom
                            multiplier:1.0 constant:10]];
    //centrado horizontal con respecto a la imagen
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:cabecera
                            attribute:NSLayoutAttributeCenterX
                            relatedBy:NSLayoutRelationEqual
                            toItem:imagen
                            attribute:NSLayoutAttributeCenterX
                            multiplier:1.0 constant:0.0]];
    //width
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:cabecera
                            attribute:NSLayoutAttributeWidth
                            relatedBy:NSLayoutRelationEqual
                            toItem:nil
                            attribute:NSLayoutAttributeNotAnAttribute
                            multiplier:1.0
                            constant:60.00]];
    
    //height
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:cabecera
                            attribute:NSLayoutAttributeHeight
                            relatedBy:NSLayoutRelationEqual
                            toItem:nil
                            attribute:NSLayoutAttributeNotAnAttribute
                            multiplier:1.0
                            constant:20.00]];
    
    //constraint contenedor
    //top
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:cuerpo
                            attribute:NSLayoutAttributeTop
                            relatedBy:NSLayoutRelationEqual
                            toItem:cabecera
                            attribute:NSLayoutAttributeBottom
                            multiplier:1.0 constant:0.00]];
    //centrado horizontal con respecto a la imagen
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:cuerpo
                            attribute:NSLayoutAttributeCenterX
                            relatedBy:NSLayoutRelationEqual
                            toItem:imagen
                            attribute:NSLayoutAttributeCenterX
                            multiplier:1.0 constant:0.0]];
    //width
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:cuerpo
                            attribute:NSLayoutAttributeWidth
                            relatedBy:NSLayoutRelationEqual
                            toItem:nil
                            attribute:NSLayoutAttributeNotAnAttribute
                            multiplier:1.0
                            constant:60.00]];
    
    //height
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:cuerpo
                            attribute:NSLayoutAttributeHeight
                            relatedBy:NSLayoutRelationEqual
                            toItem:nil
                            attribute:NSLayoutAttributeNotAnAttribute
                            multiplier:1.0
                            constant:40.00]];
    
    //constraint de titulo
    //top
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:titulo
                            attribute:NSLayoutAttributeTop
                            relatedBy:NSLayoutRelationEqual
                            toItem:self
                            attribute:NSLayoutAttributeTop
                            multiplier:1.0 constant:20]];
    //leading
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:titulo
                            attribute:NSLayoutAttributeLeading
                            relatedBy:NSLayoutRelationEqual
                            toItem:imagen
                            attribute:NSLayoutAttributeTrailing
                            multiplier:1.0 constant:20]];
    
    //constraint de imagen
    //top
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:imagen
                            attribute:NSLayoutAttributeTop
                            relatedBy:NSLayoutRelationEqual
                            toItem:self
                            attribute:NSLayoutAttributeTop
                            multiplier:1.0 constant:0]];
    //Leading
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:imagen
                            attribute:NSLayoutAttributeLeading
                            relatedBy:NSLayoutRelationEqual
                            toItem:self
                            attribute:NSLayoutAttributeLeading
                            multiplier:1.0 constant:0]];
    
    //width
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:imagen
                            attribute:NSLayoutAttributeWidth
                            relatedBy:NSLayoutRelationEqual
                            toItem:nil
                            attribute:NSLayoutAttributeNotAnAttribute
                            multiplier:1.0
                            constant:80.00]];
    
    //height
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:imagen
                            attribute:NSLayoutAttributeHeight
                            relatedBy:NSLayoutRelationEqual
                            toItem:nil
                            attribute:NSLayoutAttributeNotAnAttribute
                            multiplier:1.0
                            constant:80.00]];
    
    
    [self addConstraints:constraints];
}

-(void)loadWithUser:(Tickets*)tickets{
    [self loadImagen:tickets.url_img];
    [self loadNombreCompleto:tickets.title];
    [self loadComponenteFecha:tickets.date];
}

-(void)loadComponenteFecha:(NSString*)fecha{
    //extraer dia y mes
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:fecha];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd"];
    NSString *day = [formatter stringFromDate:date];
    [formatter setDateFormat:@"MMM"];
    NSString *month = [formatter stringFromDate:date];
    [mes setText:month];
    [dia setText:day];
}

-(void)loadNombreCompleto:(NSString*)title{
    [titulo setText:title];
}

-(void)loadImagen:(NSString*)url_img{
    [imagen sd_setImageWithURL:[NSURL URLWithString:url_img]];
    imagen.layer.cornerRadius = 80.00/2;
    imagen.layer.masksToBounds = true;
}

@end
