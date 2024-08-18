import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hedeth.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = 'hadethdetails';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(provider.backgroundImagePath))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(hadeth.hadethTitle),
        ),
        body: hadeth.hadethContent.isEmpty
            ? CircularProgressIndicator(
                color: provider.isDark ? AppTheme.gold : AppTheme.lightPrimary,
              )
            : Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.05,
                    vertical: MediaQuery.of(context).size.width * 0.15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        provider.isDark ? AppTheme.darkPrimary : Colors.white),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: provider.isDark
                                ? AppTheme.gold
                                : AppTheme.black),
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(hadeth.hadethTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: provider.isDark
                                        ? AppTheme.gold
                                        : AppTheme.black,
                                  )),
                          const SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.play_circle,
                            size: 30,
                            color: provider.isDark
                                ? AppTheme.gold
                                : AppTheme.black,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (_, index) => Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            hadeth.hadethContent[index],
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        itemCount: hadeth.hadethContent.length,
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
