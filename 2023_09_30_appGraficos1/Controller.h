//
//  Controller.h
//  2023_09_30_appGraficos1
//
//  Created by Ivanovicx Nuñez on 30/09/23.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "Vista1.h"

NS_ASSUME_NONNULL_BEGIN

@interface Controller : NSObject {
    NSMutableDictionary *lista;
}

@property (weak) IBOutlet NSBox *areaDibujo;
@property (weak) IBOutlet NSComboBox *btnOpciones;

- (IBAction)botonOpciones:(NSComboBox *)sender;

@end

NS_ASSUME_NONNULL_END
