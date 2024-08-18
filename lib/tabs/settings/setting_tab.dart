import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  late String mode;
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    ThemeData theme = Theme.of(context);
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  provider.isDark ? localizations.dark : localizations.light,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Switch(
                  value: provider.isDark,
                  onChanged: (_) {
                    if (provider.isDark) {
                      provider.changeThemeMode(ThemeMode.light);
                    } else {
                      provider.changeThemeMode(ThemeMode.dark);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  localizations.lang,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    dropdownColor:
                        provider.isDark ? AppTheme.darkPrimary : AppTheme.white,
                    value: provider.language,
                    items: [
                      DropdownMenuItem(
                        value: 'en',
                        child: Text(
                          'English',
                          style: theme.textTheme.titleLarge?.copyWith(
                              color: provider.isDark
                                  ? AppTheme.white
                                  : AppTheme.black),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'ar',
                        child: Text(
                          'العربية',
                          style: theme.textTheme.titleLarge,
                        ),
                      )
                    ],
                    onChanged: (value) {
                      provider.changeLanguage(value!);
                    },
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
