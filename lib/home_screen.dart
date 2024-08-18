import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/radio/radio_tab.dart';
import 'package:islami/tabs/sebha/sebha_tab.dart';
import 'package:islami/tabs/settings/setting_tab.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.themeMode == ThemeMode.light
              ? 'assets/images/default_bg.png'
              : 'assets/images/dark_bg.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(localizations.islami),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_quran.png'),
                ),
                label: localizations.quran,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_hadeth.png'),
                ),
                label: localizations.hadeth,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_sebha.png'),
                ),
                label: localizations.sebha,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_radio.png'),
                ),
                label: localizations.radio,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: localizations.settings,
              ),
            ]),
      ),
    );
  }
}
