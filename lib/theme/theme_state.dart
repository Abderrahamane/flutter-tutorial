import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  final bool isDark;

  const ThemeState({required this.isDark});

  factory ThemeState.initial() => const ThemeState(isDark: false);

  ThemeState copyWith({bool? isDark}) {
    return ThemeState(isDark: isDark ?? this.isDark);
  }

  @override
  List<Object?> get props => [isDark];
}