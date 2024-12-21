import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/api/api_services.dart';
import 'package:islami/tabs/radio/model/radio_model.dart';
import 'package:islami/tabs/radio/radio_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
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
        FutureBuilder(
          future: ApiServices().getRadios(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                'Something went wrong',
                style: Theme.of(context).textTheme.headlineSmall,
              ));
            } else {
              final player = AudioPlayer();
              RadioModel? radioModel = snapshot.data;
              List radios = radioModel?.radios ?? [];
              return Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: radios.length,
                  itemBuilder: (context, index) {
                    return RadioItem(
                      next: () {
                        player.pause();
                        controller.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.linear,
                        );
                      },
                      prev: () {
                        player.pause();
                        controller.previousPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.linear,
                        );
                      },
                      radio: radios[index],
                      player: player,
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
