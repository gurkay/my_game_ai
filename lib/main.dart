import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_game_ai/l10n/app_localizations.dart';
import 'core/theme/app_theme.dart';
import 'pages/home_page.dart';

/// Application entry point.
///
/// Initializes the Flutter app with custom theme and routing.
void main() {
  runApp(const MyGameApp());
}

/// Root widget of the application.
///
/// Configures MaterialApp with custom themes following the design system
/// defined in .copilot-instructions.json.
class MyGameApp extends StatelessWidget {
  const MyGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobil Oyun Haberleri',
      debugShowCheckedModeBanner: false,
      locale: const Locale('tr'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('tr'), Locale('en')],
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}

/// Provider wrapper for ChangeNotifier.
class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  final T Function(BuildContext) create;
  final Widget child;

  const ChangeNotifierProvider({
    required this.create,
    required this.child,
    super.key,
  });

  @override
  State<ChangeNotifierProvider<T>> createState() =>
      _ChangeNotifierProviderState<T>();

  static T of<T extends ChangeNotifier>(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<_InheritedProvider<T>>();
    if (provider == null) {
      throw Exception('No provider found in context');
    }
    return provider.notifier;
  }
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  late T _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = widget.create(context);
    _notifier.addListener(_onNotifierChanged);
  }

  @override
  void dispose() {
    _notifier.removeListener(_onNotifierChanged);
    super.dispose();
  }

  void _onNotifierChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedProvider<T>(notifier: _notifier, child: widget.child);
  }
}

class _InheritedProvider<T extends ChangeNotifier> extends InheritedWidget {
  final T notifier;

  const _InheritedProvider({required this.notifier, required super.child});

  @override
  bool updateShouldNotify(_InheritedProvider<T> oldWidget) {
    return notifier != oldWidget.notifier;
  }
}

/// Consumer widget for listening to provider changes.
class Consumer<T extends ChangeNotifier> extends StatelessWidget {
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final Widget? child;

  const Consumer({required this.builder, this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = ChangeNotifierProvider.of<T>(context);
    return builder(context, notifier, child);
  }
}
