//
//  Controller.m
//  2023_09_30_appGraficos1
//
//  Created by Ivanovicx Nuñez on 30/09/23.
//

#import "Controller.h"

@implementation Controller

- (void)awakeFromNib {
    
    /* Diccionario para enlistar los dibujos y su llave */
    lista = [NSMutableDictionary dictionary];
    
    [lista setObject:@"Líneas aleatorias" forKey:@1];
    [lista setObject:@"Estrella" forKey:@2];
    [lista setObject:@"Triangulo" forKey:@3];
    [lista setObject:@"Gradiente" forKey:@4];
    
    NSArray *items = [lista allValues];
    
    [_btnOpciones removeAllItems];
    
    [_btnOpciones setEditable:NO];
    [_btnOpciones addItemsWithObjectValues:items];
}

- (IBAction)botonOpciones:(NSComboBox *)sender {
    
    /* La variable 'valor' contendrá el valor introducido en el textField */
    //NSString *valor = [[NSString alloc] initWithString:_textoDibujo.stringValue];
NSString *valor = [[NSString alloc] initWithString:[_btnOpciones stringValue]];
    
    
    /* key será un arreglo con las llaves obtenidas del Diccionario que tengan el objeto de la variable 'valor' */
    NSArray *key = [[NSArray alloc] init];
    
    /* El objeto viewController sera de tipo Vista1 y tiene que ser inicializado con el NSBox (_areaDibujo) donde se mostrará el dibujo o la vista. Es IMPORTANTE que Vista1 o la clase que se mostrará, sea o herede de la clase NSView */
    Vista1 *viewController = [[Vista1 alloc] initWithFrame:_areaDibujo.bounds];
    bool flag = false;
    
    /* Recorremos el Diccionario en busca del valor introducido por el usuario*/
    for(NSString *cad in [lista allValues])
        if([valor isEqualTo:cad]){
            /* En caso de encontrarlo metemos la llave al arrgelo 'key' */
            key = [lista allKeysForObject:cad];
            NSLog(@"Valor: %@", key[0]);
            flag = true;
            break;
        }
    
    /* Si se encontró un valor procedemos con el dibujo y los ajustes necesarios dentro del objeto viewController */
    if(flag){
        [viewController setDibujo:[key[0] intValue]];
        [_areaDibujo setContentView:viewController];
        [_areaDibujo setNeedsDisplay:YES];
    } else {
        /* Si no coincidió ningún valor, se mostrará una alerta al usuario */
        NSBeep();
        NSAlert *alerta = [[NSAlert alloc] init];
        [alerta setMessageText:@"Cuidado ⚠️"];
        [alerta setInformativeText:@"No se encontró ningún dibujo disponible 😞"];
        [alerta addButtonWithTitle:@"Intentar de nuevo"];
        [alerta runModal];
    }
    
}

@end
