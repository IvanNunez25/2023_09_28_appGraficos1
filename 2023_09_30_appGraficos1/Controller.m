    //
    //  Controller.m
    //  2023_09_30_appGraficos1
    //
    //  Created by Ivanovicx Nuñez on 30/09/23.
    //

    #import "Controller.h"

    @implementation Controller

    - (void)awakeFromNib {
        _textoDibujo.stringValue = @"";
    }

    - (IBAction)botonDibujar:(NSButton *)sender {
        
        NSMutableDictionary *lista = [NSMutableDictionary dictionary];
        
        [lista setObject:@"lineas aleatorias" forKey:@1];
        [lista setObject:@"estrella" forKey:@2];
        
        NSString *valor = [[NSString alloc] initWithString:_textoDibujo.stringValue];
        NSArray *key = [[NSArray alloc] init];
        
        Vista1 *viewController = [[Vista1 alloc] initWithFrame:_areaDibujo.bounds];
        bool flag = false;
        
        for(NSString *cad in [lista allValues])
            if([valor isEqualTo:cad]){
                key = [lista allKeysForObject:cad];
                NSLog(@"Valor: %@", key[0]);
                flag = true;
            }
        
        if(flag){
            [viewController setDibujo:[key[0] intValue]];
            [_areaDibujo setContentView:viewController];
            NSLog(@"Content View: %@", [_areaDibujo contentView]);
            [_areaDibujo setNeedsDisplay:YES];
        }
        
    }


    @end
