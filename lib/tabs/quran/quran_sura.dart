import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran_tab.dart';

class QuranSura extends StatefulWidget {
  static const String routeName = 'quransura';

  @override
  State<QuranSura> createState() => _QuranSuraState();
}

class _QuranSuraState extends State<QuranSura> {
  List<String> ayat = [];

  late SuraDetails suraDetails;

  @override
  Widget build(BuildContext context) {
    suraDetails = ModalRoute.of(context)!.settings.arguments as SuraDetails;
    loadSuraFile();
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/default_bg.png'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(suraDetails.suraName),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.05,
              vertical: MediaQuery.of(context).size.width * 0.15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(width: 1),
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      suraDetails.suraName,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.play_circle,
                      size: 30,
                    )
                  ],
                ),
              ),
              ayat.isEmpty
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppTheme.lightPrimary,
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (_, index) => Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            ayat[index],
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        itemCount: ayat.length,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  void loadSuraFile() async {
    String sura = await rootBundle
        .loadString('assets/files/quran/${suraDetails.index + 1}.txt');
    ayat = sura.split('\n');
    setState(() {});
  }
}
