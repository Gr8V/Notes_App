import 'package:flutter/material.dart';
import 'package:note_nest/pages/main/homepage.dart';
import 'package:note_nest/notes_provider.dart';
import 'package:note_nest/theme/app_theme.dart';
import 'package:note_nest/theme/theme_controller.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //loads theme data on startup
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
    //app listens to theme type and theme mode
    return ValueListenableBuilder<AppThemeType>(
      valueListenable: themeTypeNotifier,
      builder: (context, themeType, child) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: themeModeNotifier,
          builder: (context, themeMode, child) {
            return MaterialApp(
              title: 'Note Nest',
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
