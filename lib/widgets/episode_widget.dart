
import 'package:flutter/material.dart';
import 'package:toonflixapp/models/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
    required this.webtoonId,
  });

  final WebtoonEpisodeModel episode;
  final String webtoonId;

  Future<void> onButtonTap() async {
    await launchUrlString('https:/comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}'); 
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.green.shade400,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              offset: const Offset(2, 2),
              color: Colors.black.withValues(alpha: 0.3),
            ),
          ],
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Row( 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: const TextStyle(
                  color : Colors.green, 
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.green,
              )
            ],
          ),
        ), 
      ),
    );
  }
}