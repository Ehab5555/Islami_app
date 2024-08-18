import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth_details.dart';
import 'package:islami/tabs/hadeth/hedeth.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];
  @override
  Widget build(BuildContext context) {
    loadAhadethFile();
    return Column(
      children: [
        Image.asset('assets/images/hadeth_logo.png'),
        const SizedBox(
          height: 12,
        ),
        Table(
          border: TableBorder.symmetric(
              outside: BorderSide(width: 3, color: AppTheme.lightPrimary),
              inside: BorderSide(width: 3, color: AppTheme.lightPrimary)),
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'الاحاديث',
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
                color: AppTheme.lightPrimary,
              )))
            : Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) => Table(
                    border: TableBorder.symmetric(
                        inside: const BorderSide(
                      width: 3,
                      color: AppTheme.lightPrimary,
                    )),
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pushNamed(
                                  HadethDetails.routeName,
                                  arguments: Hadeth(
                                      hadethTitle: ahadeth[index].hadethTitle,
                                      hadethContent:
                                          ahadeth[index].hadethContent)),
                              child: Text(
                                ahadeth[index].hadethTitle,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ],
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
