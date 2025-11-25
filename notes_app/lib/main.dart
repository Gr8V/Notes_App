import 'package:flutter/material.dart';
import 'package:notes_app/pages/main/homepage.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:notes_app/theme/app_theme.dart';
import 'package:notes_app/theme/theme_controller.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await loadSavedTheme();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotesProvider())
      ],
      child: const NotesApp(),
    )
  );
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppThemeType>(
      valueListenable: themeTypeNotifier,
      builder: (context, themeType, child) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: themeModeNotifier,
          builder: (context, themeMode, child) {
            return MaterialApp(
              title: 'NotesApp',
              theme: AppTheme.getTheme(themeType, false),
              darkTheme: AppTheme.getTheme(themeType, true),
              themeMode: themeMode,
              home: const HomePage(),
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
