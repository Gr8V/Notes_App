import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'dart:convert';


class LocalStorageService {
  static const String _notesKey = 'notes_data';

  // ================================================================
  // NOTES STORAGE
  // ================================================================

  static Future<void> saveNote(Note note) async {
    final prefs = await SharedPreferences.getInstance();
    final existing = prefs.getString(_notesKey);

    List<dynamic> notesList = existing != null
        ? jsonDecode(existing)
        : [];

    notesList.add(note.toJson());

    await prefs.setString(_notesKey, jsonEncode(notesList));
  }
  
  static Future<void> editNote(Note updatedNote) async {
  final prefs = await SharedPreferences.getInstance();
  final raw = prefs.getString(_notesKey);

  if (raw == null) return;

  List decoded = jsonDecode(raw);

  // Find index of note with same ID
  final index = decoded.indexWhere((note) => note["id"] == updatedNote.id);

  if (index == -1) return; // Note not found

  // Replace old data with new one
  decoded[index] = updatedNote.toJson();

  // Save updated list
  await prefs.setString(_notesKey, jsonEncode(decoded));
}


  static Future<List<Note>> getNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString("notes_data");

    if (raw == null) return [];

    final List decoded = jsonDecode(raw);
    return decoded.map((e) => Note.fromJson(e)).toList();
  }

  static Future<void> deleteNote(String noteId) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_notesKey);

    if (raw == null) return;

    // Decode stored JSON list
    List decoded = jsonDecode(raw);

    // Remove the note with matching ID
    decoded.removeWhere((note) => note["id"] == noteId);

    // Save updated list back to prefs
    await prefs.setString(_notesKey, jsonEncode(decoded));
  }



  // ================================================================
  // THEME STORAGE
  // ================================================================

  static const String _themeModeKey = 'theme_mode';
  static const String _themeTypeKey = 'theme_type';

  // Existing getThemeMode method
  static Future<ThemeMode?> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(_themeModeKey);
    if (themeString == null) return null;
    return ThemeMode.values.firstWhere(
      (e) => e.toString() == themeString,
      orElse: () => ThemeMode.system,
    );
  }

  // Existing saveThemeMode method
  static Future<void> saveThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey, mode.toString());
  }

  // NEW: Get theme type
  static Future<AppThemeType?> getThemeType() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(_themeTypeKey);
    if (themeString == null) return null;
    return AppThemeType.values.firstWhere(
      (e) => e.toString() == themeString,
      orElse: () => AppThemeType.defaultTheme,
    );
  }

  // NEW: Save theme type
  static Future<void> saveThemeType(AppThemeType type) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeTypeKey, type.toString());
  }
}