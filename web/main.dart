// The entrypoint for the **client** environment.
//
// This file is compiled to javascript and executed in the browser.

// Client-specific jaspr import.
import 'package:jaspr/browser.dart';
// Imports the [App] component.
import 'package:televolution_native/app/app.dart';
import 'package:televolution_native/appwrite/appwrite.dart';

void main() {
  RawRealtimeService.init();
  // Attaches the [App] component to the <body> of the page.
  runApp(const App());
}
