import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/radio_image.png'),
        const SizedBox(
          height: 30,
        ),
        Text(
          AppLocalizations.of(context)!.radioname,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.skip_previous_sharp,
              size: 40,
              color: provider.isDark ? AppTheme.gold : AppTheme.lightPrimary,
            ),
            const SizedBox(
              width: 30,
            ),
            Icon(
              Icons.play_arrow,
              size: 40,
              color: provider.isDark ? AppTheme.gold : AppTheme.lightPrimary,
            ),
            const SizedBox(
              width: 30,
            ),
            Icon(
              Icons.skip_next_sharp,
              size: 40,
              color: provider.isDark ? AppTheme.gold : AppTheme.lightPrimary,
            ),
          ],
        )
      ],
    );
  }
}
