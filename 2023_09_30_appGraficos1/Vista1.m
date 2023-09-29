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
    
    resul.x = r.origin.x + random()% (int) r.size.width;
    resul.y = r.origin.y + random()% (int) r.size.height;

    return resul;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    /* Tarea para Domingo 01-OCT
     
     Implementar una app Cocoa (GUI), diseño libre utilizando su creatividad para validar expresiones regulares proporcionadas por el usuario
     
     */
    
    // Drawing code here.
    NSRect rectangulo = [self bounds];
    
    /* Color para el fondo de la vista */
    [[NSColor blueColor] set];
    
    //
    [NSBezierPath fillRect:rectangulo];
    
    // Color para las líneas
    [[NSColor whiteColor] set];
    
    NSBezierPath *path = [[NSBezierPath alloc] init];
    [path setLineWidth:2.0];
    
    srand((unsigned) time(NULL));
    
    /*
     NSPoint p = [self randomPoint];
     [path moveToPoint:p];
     */
    
    /*
     for(int i=0; i<15; i++){
     p = [self randomPoint];
     [path lineToPoint:p];
     }
     */
    
    // Rellenar los poligonos
    //[[NSColor orangeColor]set];
    //[path fill];
    
    // DESHABILITAR EL DIBUJO DE LINEAS
    
    // DIBUJAR UNA ESTRELLA QUE QUE QUEDE CENTRADA EN LA VISTA
    
    [path moveToPoint:NSMakePoint(rectangulo.origin.x, rectangulo.origin.y)];
    
    [path lineToPoint:NSMakePoint(rectangulo.size.width / 2, rectangulo.size.height)];
    
    [path lineToPoint:NSMakePoint(rectangulo.size.width, rectangulo.origin.y)];
    
    [path lineToPoint:NSMakePoint(rectangulo.origin.x, rectangulo.size.height / 2)];
    
    [path lineToPoint:NSMakePoint(rectangulo.size.width, rectangulo.size.height / 2)];
    
    [path lineToPoint:NSMakePoint(rectangulo.origin.x + 10, rectangulo.origin.y)];
    
    
    // Método para dibujar en la vista
    [path stroke];
    
    
}

@end
