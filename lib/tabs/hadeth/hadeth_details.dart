import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth/hedeth.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = 'hadethdetails';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/default_bg.png'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(hadeth.hadethTitle),
        ),
        body: hadeth.hadethContent.isEmpty
            ? CircularProgressIndicator()
            : Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.05,
                    vertical: MediaQuery.of(context).size.width * 0.15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
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
                            hadeth.hadethTitle,
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
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (_, index) => Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            hadeth.hadethContent[index],
                            style: Theme.of(context).textTheme.bodyLarge,
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
