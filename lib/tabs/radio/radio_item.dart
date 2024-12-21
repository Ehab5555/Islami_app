import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/radio/model/radio.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class RadioItem extends StatefulWidget {
  final Radios radio;
  final AudioPlayer player;
  final Function next, prev;
  const RadioItem({
    super.key,
    required this.radio,
    required this.player,
    required this.next,
    required this.prev,
  });

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () => widget.prev,
                icon: Icon(
                  Icons.skip_previous_sharp,
                  size: 40,
                  color:
                      provider.isDark ? AppTheme.gold : AppTheme.lightPrimary,
                )),
            const SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () async {
                isPlaying = !isPlaying;
                setState(() {});
                await widget.player.play(
                  UrlSource(widget.radio.url ?? ''),
                );
              },
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 40,
                color: provider.isDark ? AppTheme.gold : AppTheme.lightPrimary,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () => widget.next,
              icon: Icon(
                Icons.skip_next_sharp,
                size: 40,
                color: provider.isDark ? AppTheme.gold : AppTheme.lightPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          widget.radio.name ?? '',
        ),
      ],
    );
  }
}
