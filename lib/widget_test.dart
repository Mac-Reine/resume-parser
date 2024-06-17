import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resumeparser/my_app.dart';

void main() {
  testWidgets('MyApp has a title and displays HomePage', (WidgetTester tester) async {
    // Build MyApp and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that HomePage is displayed by checking for the presence of a FlutterLogo widget.
    expect(find.byType(FlutterLogo), findsOneWidget);

    // Verify that AppBar is present and has the correct title.
    expect(find.text('ResumeParser'), findsOneWidget);

    // Verify that the Drawer is present.
    expect(find.byType(Drawer), findsOneWidget);
  });

  testWidgets('Drawer items are present', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Open the drawer.
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle(); // Wait for the drawer to open.

    // Verify that the drawer items are present.
    expect(find.text('My Profile'), findsOneWidget);
    expect(find.text('Account Settings'), findsOneWidget);
    expect(find.text('Upload Resume'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });
}
