import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int number = 0;
  String sehabTitle = 'سبحان الله';
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 40),
              child: Image.asset(
                provider.isDark
                    ? 'assets/images/head_sebha_dark.png'
                    : 'assets/images/head_sebha_logo.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.07,
              ),
              child: Image.asset(
                provider.isDark
                    ? 'assets/images/body_sebha_dark.png'
                    : 'assets/images/body_sebha_logo.png',
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: provider.isDark
                  ? AppTheme.darkPrimary.withValues(alpha: 0.5)
                  : AppTheme.lightPrimary.withValues(alpha: 0.5)),
          child: Text(
            '$number',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  number++;
                  if (number == 99) {
                    sehabTitle = 'سبحان الله';
                    number = 0;
                  } else if (number == 33) {
                    sehabTitle = 'الحمد لله';
                  } else if (number == 66) {
                    sehabTitle = 'لا اله الا الله';
                  }
                });
              },
              child: Text(
                sehabTitle,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: provider.isDark ? AppTheme.black : AppTheme.white,
                    ),
              )),
        )
      ],
    );
  }
}
