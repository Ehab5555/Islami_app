import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
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
          'اذاعة القرأن الكريم',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 30,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.skip_previous_sharp,
              size: 40,
              color: AppTheme.lightPrimary,
            ),
            SizedBox(
              width: 30,
            ),
            Icon(
              Icons.play_arrow,
              size: 40,
              color: AppTheme.lightPrimary,
            ),
            SizedBox(
              width: 30,
            ),
            Icon(
              Icons.skip_next_sharp,
              size: 40,
              color: AppTheme.lightPrimary,
            ),
          ],
        )
      ],
    );
  }
}
