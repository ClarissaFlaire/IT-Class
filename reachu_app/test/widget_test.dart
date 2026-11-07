import 'package:flutter_test/flutter_test.dart';
import 'package:reachu_app/main.dart';

void main() {
  testWidgets('ReachU opens on the topics screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const ReachUApp());

    expect(find.text('What topics would you\nlike to see?'),
        findsOneWidget);

    expect(find.text('DONE'), findsOneWidget);
  });
}