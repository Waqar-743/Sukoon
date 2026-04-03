import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sukoon/shared/widgets/common_widgets.dart';

void main() {
  testWidgets('section card shows content', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SukoonSectionCard(
            title: 'Test card',
            subtitle: 'Helpful subtitle',
            child: Text('Child content'),
          ),
        ),
      ),
    );

    expect(find.text('Test card'), findsOneWidget);
    expect(find.text('Helpful subtitle'), findsOneWidget);
    expect(find.text('Child content'), findsOneWidget);
  });
}
