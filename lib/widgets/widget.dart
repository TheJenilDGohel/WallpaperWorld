import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wallpaperworld/screens/detailedimage_screen.dart';
import 'package:wallpaperworld/theme/theme.dart';

import '../models/wallpaper_model.dart';

Widget brandName() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Wallpaper",
          style: TextStyle(color: Colors.white),
        ),
        Text(
          "World",
          style: TextStyle(
            color: MyTheme.orange,
          ),
        ),
      ],
    );

Widget wallpapersList(
        {required List<WallpaperModel> wallpapers, required context}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.count(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        childAspectRatio: 0.5,
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 9.0,
        children: wallpapers
            .map(
              (wallpaper) => InkWell(
                enableFeedback: true,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailedImageScreen(
                      imgUrl: wallpaper.srcModel.portrait,
                    ),
                  ),
                ),
                child: Hero(
                  tag: wallpaper.srcModel.portrait,
                  child: Container(
                    child: ClipRRect(
                      child: Image.network(
                        wallpaper.srcModel.portrait,
                        fit: BoxFit.cover,
                      ).cornerRadius(20),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
