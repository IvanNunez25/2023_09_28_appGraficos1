//
//  Vista1.h
//  2023_09_30_appGraficos1
//
//  Created by Ivanovicx Nuñez on 28/09/23.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Vista1 : NSView {
    int tipoDibujo;
}

-(NSPoint) randomPoint;

-(void) dibujarLineasAleatorias;

-(void) dibujarEstrella;

-(void) setDibujo: (int)numero;

-(int) getDibujo;

-(void) dibujarGradienteRadial;

-(void) dibujarTriangulo;

-(void) dibujarCurvaBezier1;

-(void) dibujarCurvaBezier2;

@end

NS_ASSUME_NONNULL_END
