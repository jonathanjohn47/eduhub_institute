import 'package:eduhub_institute/features/authentication/ui/regsiter_screen.dart';
import 'package:eduhub_institute/features/authentication/ui/sign_in_page.dart';
import 'package:eduhub_institute/features/dashboard/ui/DashboardScreen.dart';
import 'package:eduhub_institute/features/splash/ui/splash_page.dart';
import 'package:eduhub_institute/firebase_options.dart';
import 'package:eduhub_institute/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:eduhub_institute/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // Use Firebase Emulator for Auth
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    // Additional setup if needed.
  });
  group('App Test', () {
    testWidgets('Login test', (tester) async {
      app.main(); // Make sure this initializes the app correctly for testing.

      await tester.pumpAndSettle(); // Wait for initial animations to complete.
      expect(find.byType(LoginScreen), findsOneWidget);

      await tester.enterText(
          find.byKey(Key('sign_in_phone_text_field')), '6005356827');
      await Future.delayed(Duration(seconds: 2));
      await tester.tap(find.byKey(Key('sign_in_button')));
      await tester.pump(); // Trigger a frame.

      // Optionally add a delay, if necessary.
      await Future.delayed(Duration(milliseconds: 500));

      await tester.pumpAndSettle(); // Wait for animations to complete.
      expect(find.byKey(Key('sign_in_loader')), findsOneWidget);

      /*expect(find.byKey(Key('otp_text_field')), findsOneWidget);
      await tester.enterText(find.byKey(Key('otp_text_field')), '112233');

      await tester.tap(find.byKey(Key('otp_submit_button')));

      await tester.pumpAndSettle();

      expect(find.byType(DashboardScreen), findsOneWidget);*/
    });
  });
}
