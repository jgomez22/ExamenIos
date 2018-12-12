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
    
    UIView*contenedorPrincipal;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Agregar Vistas

-(void)addViews{
    
    contenedorPrincipal = [[UILabel alloc]init];
    //[[NSColor brownColor] colorWithAlphaComponent:0.1];
    contenedorPrincipal.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.1];
    titulo = [[UILabel alloc]init];
    imagen = [[UIImageView alloc]init];
    horaFuncion = [[UILabel alloc]init];
    lugarFuncion = [[UILabel alloc]init];
    cabecera  = [[UIView alloc] init];
    cuerpo  = [[UIView alloc] init];
    dia = [[UILabel alloc]init];
    mes = [[UILabel alloc]init];
    
    cabecera.backgroundColor = [UIColor redColor];
    cuerpo.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:contenedorPrincipal];
    [self addSubview:titulo];
    [self addSubview:imagen];
    [self addSubview:horaFuncion];
    [self addSubview:lugarFuncion];
    [self addSubview:cabecera];
    [self addSubview:cuerpo];
    [self addSubview:dia];
    [self addSubview:mes];
    
    NSMutableArray*constraints=[[NSMutableArray alloc]init];
    
    [contenedorPrincipal setTranslatesAutoresizingMaskIntoConstraints:false];
    [titulo setTranslatesAutoresizingMaskIntoConstraints:false];
    [imagen setTranslatesAutoresizingMaskIntoConstraints:false];
    [horaFuncion setTranslatesAutoresizingMaskIntoConstraints:false];
    [lugarFuncion setTranslatesAutoresizingMaskIntoConstraints:false];
    [cabecera setTranslatesAutoresizingMaskIntoConstraints:false];
    [cuerpo setTranslatesAutoresizingMaskIntoConstraints:false];
    [dia setTranslatesAutoresizingMaskIntoConstraints:false];
    [mes setTranslatesAutoresizingMaskIntoConstraints:false];
    
    //constraint contenedor principal
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:contenedorPrincipal
                            attribute:NSLayoutAttributeTop
                            relatedBy:NSLayoutRelationEqual
                            toItem:self
                            attribute:NSLayoutAttributeTop
                            multiplier:1.0 constant:10.00]];
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:contenedorPrincipal
                            attribute:NSLayoutAttributeBottom
                            relatedBy:NSLayoutRelationEqual
                            toItem:self
                            attribute:NSLayoutAttributeBottom
                            multiplier:1.0 constant:-10.00]];
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:contenedorPrincipal
                            attribute:NSLayoutAttributeLeading
                            relatedBy:NSLayoutRelationEqual
                            toItem:self
                            attribute:NSLayoutAttributeLeading
                            multiplier:1.0 constant:20.00]];
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:contenedorPrincipal
                            attribute:NSLayoutAttributeTrailing
                            relatedBy:NSLayoutRelationEqual
                            toItem:self
                            attribute:NSLayoutAttributeTrailing
                            multiplier:1.0 constant:-20.00]];
    
    //constraint de lugar de funcion
    //top
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:lugarFuncion
                            attribute:NSLayoutAttributeTop
                            relatedBy:NSLayoutRelationEqual
                            toItem:horaFuncion
                            attribute:NSLayoutAttributeBottom
                            multiplier:1.0 constant:10.00]];
    //leading
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:lugarFuncion
                            attribute:NSLayoutAttributeLeading
                            relatedBy:NSLayoutRelationEqual
                            toItem:horaFuncion
                            attribute:NSLayoutAttributeLeading
                            multiplier:1.0 constant:0.00]];
    
    //constraint hora de la funcion
    //top
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:horaFuncion
                            attribute:NSLayoutAttributeTop
                            relatedBy:NSLayoutRelationEqual
                            toItem:cabecera
                            attribute:NSLayoutAttributeTop
                            multiplier:1.0 constant:0.00]];
    //leading
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:horaFuncion
                            attribute:NSLayoutAttributeLeading
                            relatedBy:NSLayoutRelationEqual
                            toItem:imagen
                            attribute:NSLayoutAttributeTrailing
                            multiplier:1.0 constant:10.00]];
    
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
    
    //constraint cuerpo
    //top con respecto al bottom de la cabecera
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
    //centrado vertical con respecto a la imagen
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:titulo
                            attribute:NSLayoutAttributeCenterY
                            relatedBy:NSLayoutRelationEqual
                            toItem:imagen
                            attribute:NSLayoutAttributeCenterY
                            multiplier:1.0 constant:0.0]];
    //leading con respecto al titulo
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:titulo
                            attribute:NSLayoutAttributeLeading
                            relatedBy:NSLayoutRelationEqual
                            toItem:imagen
                            attribute:NSLayoutAttributeTrailing
                            multiplier:1.0 constant:20]];
    
    //Imagen constraint
    //top con respecto al contenedor principal
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:imagen
                            attribute:NSLayoutAttributeTop
                            relatedBy:NSLayoutRelationEqual
                            toItem:contenedorPrincipal
                            attribute:NSLayoutAttributeTop
                            multiplier:1.0 constant:10]];
    //Leading con respecto al contenedor principal
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:imagen
                            attribute:NSLayoutAttributeLeading
                            relatedBy:NSLayoutRelationEqual
                            toItem:contenedorPrincipal
                            attribute:NSLayoutAttributeLeading
                            multiplier:1.0 constant:10]];
    
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

#pragma mark - Cargar de Vistas

-(void)loadWithUser:(Tickets*)tickets{
    [self loadImagen:tickets.url_img];
    [self loadTitulo:tickets.title];
    [self loadComponenteFecha:tickets.date];
    [self loadHoraFuncion:tickets.startTime withFinal:tickets.endTime];
    [self loadLugarFuncion:tickets.address];
}

-(void)loadLugarFuncion:(NSString*)lugar{
    [lugarFuncion setText:lugar];
    lugarFuncion.textColor = [UIColor whiteColor];
    
    UIFontDescriptor * cursiva = [lugarFuncion.font.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitItalic];
    lugarFuncion.font = [UIFont fontWithDescriptor:cursiva size:0];
}

-(void)loadHoraFuncion:(NSString*)inicio withFinal:(NSString*)final{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];

    NSDate *hourstart = [dateFormatter dateFromString:inicio];
    NSDate *hourend = [dateFormatter dateFromString:final];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm a"];
    
    NSString *horainicio = [formatter stringFromDate:hourstart];
    NSString *horafinal = [formatter stringFromDate:hourend];
    
    NSString*funcion = [NSString stringWithFormat:@"%@ - %@", horainicio, horafinal];
    [horaFuncion setText:funcion];
    horaFuncion.textColor = [UIColor whiteColor];
    
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
    mes.textColor = [UIColor whiteColor];
    
    [dia setText:day];
    UIFontDescriptor*negrita = [dia.font.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold];
    dia.font = [UIFont fontWithDescriptor:negrita size:24];
}

-(void)loadTitulo:(NSString*)title{
    [titulo setText:title];
    UIFontDescriptor*negrita = [titulo.font.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold];
    titulo.font = [UIFont fontWithDescriptor:negrita size:24];
    titulo.textColor = [UIColor whiteColor];
}

-(void)loadImagen:(NSString*)url_img{
    [imagen sd_setImageWithURL:[NSURL URLWithString:url_img]];
    imagen.layer.cornerRadius = 80.00/2;
    imagen.layer.masksToBounds = true;
}

@end
