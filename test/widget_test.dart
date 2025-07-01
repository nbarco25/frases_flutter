import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frases_flutter/main.dart';

void main() {
  testWidgets('Muestra el texto de carga al iniciar', (WidgetTester tester) async {
    // Carga el widget principal de la app
    await tester.pumpWidget(const FrasesApp());

    // Verifica que aparezca el texto de carga
    expect(find.text('Cargando frase...'), findsOneWidget);
  });
}
