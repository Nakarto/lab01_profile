import 'package:flutter_test/flutter_test.dart';

import 'package:lab01_profile/main.dart';

void main() {
  testWidgets('About me shows ID and name', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Lab L1 · 67113514'), findsOneWidget);
    expect(find.text('นายพัฒน์ธนิน ปลอดขาว'), findsOneWidget);
  });
}
