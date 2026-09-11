import 'package:flutter/material.dart';

enum AppLanguage { ewe, english }

/// A shared language toggle used on screens with bilingual content
/// (Xɔsemeʋuʋu, church history). Drop this at the top of a screen's body
/// and switch what you render below based on the selected language.
class LanguageToggle extends StatelessWidget {
  final AppLanguage selected;
  final ValueChanged<AppLanguage> onChanged;
  final Color? foregroundColor; // pass Colors.white on dark backgrounds

  const LanguageToggle({
    super.key,
    required this.selected,
    required this.onChanged,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SegmentedButton<AppLanguage>(
        segments: const [
          ButtonSegment(value: AppLanguage.ewe, label: Text('Eʋegbe')),
          ButtonSegment(value: AppLanguage.english, label: Text('English')),
        ],
        selected: {selected},
        onSelectionChanged: (newSelection) => onChanged(newSelection.first),
        style: foregroundColor != null
            ? ButtonStyle(
                foregroundColor: WidgetStateProperty.resolveWith((states) {
                  return states.contains(WidgetState.selected)
                      ? foregroundColor
                      : foregroundColor!.withOpacity(0.7);
                }),
              )
            : null,
      ),
    );
  }
}