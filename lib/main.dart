import 'package:dialease/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return Scaffold(
          body: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const Home(),
        ),
      ],
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Rahisi',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 34, 46, 53),
          brightness: Brightness.dark,
        ),
        textTheme: Typography().white.apply(fontFamily: 'Inter'),
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: WidgetStateTextStyle.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontVariations: variableFontWeight(600),
                  color: Colors.white,
                );
              }
              return TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontVariations: variableFontWeight(400),
              );
            },
          ),
        ),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 34, 46, 53),
        ),
        useMaterial3: true,
        textTheme: Typography().black.apply(fontFamily: 'Inter'),
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: WidgetStateTextStyle.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontVariations: variableFontWeight(600),
                  color: Colors.black,
                );
              }
              return TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontVariations: variableFontWeight(400),
              );
            },
          ),
        ),
      ),
    );
  }
}
