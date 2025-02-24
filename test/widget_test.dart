import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/repositories/auth_repositary.dart';
import 'package:weather_app/repositories/post_repositary.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Create a dummy AuthRepositary for testing
    final AuthRepositary dummyAuthRepository = AuthRepositary();
    final PostRepositary dummyPostRepository = PostRepositary();

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(authRepository: dummyAuthRepository, postRepositary: dummyPostRepository,));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
