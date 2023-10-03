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
    
    int triangulo [4][2] = {{5,5},{250,5},{5,250},{5,5}};
    
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

-(void) dibujarCurvaBezier1 {
    
    [[NSColor blueColor] set];
    
    NSBezierPath* aPath = [NSBezierPath bezierPath];
    
    [aPath moveToPoint:NSMakePoint(0.0, 0.0)];
    [aPath lineToPoint:NSMakePoint(100.0, 100.0)];
    [aPath curveToPoint:NSMakePoint(180.0, 210.0)
          controlPoint1:NSMakePoint(60.0, 20.0)
          controlPoint2:NSMakePoint(280.0, 100.0)];
    
    /* Dibujar un rectangulo */
    [aPath appendBezierPathWithRect:NSMakeRect(20.0, 160.0, 80.0, 50.0)];
    
    /* L cursiva */
    [aPath moveToPoint:NSMakePoint(200, 200)];
    [aPath lineToPoint:NSMakePoint(210, 220)];
    //[aPath curveToPoint:210 controlPoint:

    [aPath stroke];
    
    
}

-(void) dibujarCurvaBezier2 {
    
    NSPoint p1 = NSMakePoint(100, 100);
    NSPoint p2 = NSMakePoint(200, 300);
    NSPoint p3 = NSMakePoint(300, 100);
    
    /* Puntos de control */
    NSPoint control1 = NSMakePoint(200, 200);
    NSPoint control2 = NSMakePoint(200, 0);
    
    /* Construitr path para el triangulo */
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path moveToPoint:p1];
    [path lineToPoint:p2];
    [path lineToPoint:p3];
    [path curveToPoint:p1 controlPoint1:control1 controlPoint2:control2];
    
    [path closePath];
    
    [[NSColor orangeColor] set];
    [path fill];
    
    [path stroke];
    
    /* Tarea: Utilizar las curvas de Bezier para crear una letra en cursiva (Ejemplo L) */
    
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
            
        case 5:
            [self dibujarCurvaBezier1];
            break;
            
        case 6:
            [self dibujarCurvaBezier2];
            break;;
            
        default:
            
            break;
    }
    
    
}

@end
