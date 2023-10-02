//
//  Vista1.m
//  2023_09_30_appGraficos1
//
//  Created by Ivanovicx Nuñez on 28/09/23.
//

#import "Vista1.h"

@implementation Vista1

-(NSPoint) randomPoint {
    
    NSPoint resul;
    NSRect r = [self bounds];
    
    resul.x = r.origin.x + arc4random_uniform(r.size.width);
    resul.y = r.origin.y + arc4random_uniform(r.size.height);

    return resul;
}

-(void) dibujarLineasAleatorias {
    
    /* Dibujar un rectangulo y colocar color de fondo */
    NSRect rectangulo = [self bounds];
    [[NSColor colorWithSRGBRed:0.73 green:0.04 blue:0.92 alpha:1] set];
    [NSBezierPath fillRect:rectangulo];
    
    /* Propiedades de las líneas */
    [[NSColor whiteColor] set];
    
    NSBezierPath *path = [[NSBezierPath alloc] init];
    [path setLineWidth:2.0];
    
    /* Inicializador para los números random */
    srand((unsigned) time(NULL));
    NSPoint p = [self randomPoint];
    
    /* NO es lo mismo moveToPoint que lineToPoint*/
    [path moveToPoint:p];
    
    for(int i=0; i<15; i++){
        p = [self randomPoint];
        [path lineToPoint:p];
    }
    
    /* Rellenar los poligonos
    [[NSColor orangeColor]set];
    [path fill];
     */
    
    [path stroke];
    
}

-(void) dibujarEstrella {
    
    /* Dibujar un rectangulo y colocar color de fondo */
    NSRect rectangulo = [self bounds];
    [[NSColor colorWithSRGBRed:0.84 green:0.92 blue:0.04 alpha:1] set];
    [NSBezierPath fillRect:rectangulo];
    
    /* Propiedades de las líneas */
    [[NSColor blackColor] set];
    
    NSBezierPath *path = [[NSBezierPath alloc] init];
    [path setLineWidth:2.0];
    
    /* Puntos para dibujar la estrella */
    [path moveToPoint:NSMakePoint(rectangulo.origin.x, rectangulo.origin.y)];
    
    [path lineToPoint:NSMakePoint(rectangulo.size.width / 2, rectangulo.size.height)];
    
    [path lineToPoint:NSMakePoint(rectangulo.size.width, rectangulo.origin.y)];
    
    [path lineToPoint:NSMakePoint(rectangulo.origin.x, rectangulo.size.height / 2)];
    
    [path lineToPoint:NSMakePoint(rectangulo.size.width, rectangulo.size.height / 2)];
    
    [path lineToPoint:NSMakePoint(rectangulo.origin.x + 10, rectangulo.origin.y)];
    
    
    /* Método para dibujar en la vista */
    [path stroke];
    
}

-(void) setDibujo: (int)numero {
    tipoDibujo = numero;
}

-(int) getDibujo {
    return tipoDibujo;
}

-(void) dibujarGradienteRadial {
    
    NSRect borde = [self bounds];
    NSGradient *gradiente = [[NSGradient alloc] initWithStartingColor:[NSColor yellowColor] endingColor:[NSColor redColor]];
    
    NSPoint puntoCentro = NSMakePoint(NSMidX(borde), NSMidY(borde));
    NSPoint punto2 = NSMakePoint(puntoCentro.x + 60, puntoCentro.y + 60);
    
    CGFloat radio = MIN((borde.size.width / 10.0) - 2.0, (borde.size.height / 2.0) - 2.0);
    
    [gradiente drawFromCenter:puntoCentro radius:radio toCenter:punto2 radius:1 options:0];
}

-(void) dibujarTriangulo {
    
    NSBezierPath *path = [[NSBezierPath alloc] init];
    [path setLineWidth: 3.5];
    [[NSColor blueColor] set];
    
    int triangulo [4][2] = {{10,10},{100, 10},{10,100},{10,10}};
    
    NSPoint punto;
    punto.x = triangulo[0][0];
    punto.y = triangulo[0][1];
    
    [path moveToPoint:punto];
    
    for(int i=1; i<4; i++){
        punto.x = triangulo[i][0];
        punto.y = triangulo[i][1];
        [path lineToPoint:punto];
    }
    
    [path stroke];
    
    [[NSColor colorWithSRGBRed:0.4 green:0.2 blue:0.7 alpha:1] set];
    
    [path fill];
    
    
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    /* Tarea para Domingo 01-OCT
     
     Implementar una app Cocoa (GUI), diseño libre utilizando su creatividad para validar expresiones regulares proporcionadas por el usuario
     
     */
    
    // Drawing code here:
    
    
    int tipo = [self getDibujo];
    
    switch (tipo) {
        case 1:
            [self dibujarLineasAleatorias];
            break;
            
        case 2:
            [self dibujarEstrella];
            break;
            
        case 3:
            [self dibujarTriangulo];
            break;
            
        case 4:
            [self dibujarGradienteRadial];
            break;
            
        default:
            
            break;
    }
    
    
}

@end
