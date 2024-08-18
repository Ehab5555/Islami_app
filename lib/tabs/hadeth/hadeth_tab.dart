import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth_details.dart';
import 'package:islami/tabs/hadeth/hedeth.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    loadAhadethFile();
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        Image.asset('assets/images/hadeth_logo.png'),
        const SizedBox(
          height: 12,
        ),
        Table(
          border: TableBorder.symmetric(
              outside: BorderSide(
                  width: 3,
                  color:
                      provider.isDark ? AppTheme.gold : AppTheme.lightPrimary),
              inside: BorderSide(
                  width: 3,
                  color:
                      provider.isDark ? AppTheme.gold : AppTheme.lightPrimary)),
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      localizations.ahadeth,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        ahadeth.isEmpty
            ? Expanded(
                child: Center(
                    child: CircularProgressIndicator(
                color: provider.isDark ? AppTheme.gold : AppTheme.black,
              )))
            : Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(
                          HadethDetails.routeName,
                          arguments: Hadeth(
                              hadethTitle: ahadeth[index].hadethTitle,
                              hadethContent: ahadeth[index].hadethContent)),
                      child: Text(
                        ahadeth[index].hadethTitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  itemCount: ahadeth.length,
                ),
              )
      ],
    );
  }

  Future<void> loadAhadethFile() async {
    String hadethFile = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethTexts = hadethFile.split('#');
    ahadeth = hadethTexts.map(
      (hadethTitle) {
        List<String> hadethLines = hadethTitle.trim().split('\n');
        String title = hadethLines.first;
        hadethLines.removeAt(0);
        List<String> hadethContent = hadethLines;
        return Hadeth(hadethTitle: title, hadethContent: hadethContent);
      },
    ).toList();
    setState(() {});
  }
}
