import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperworld/data/data.dart';
import 'package:wallpaperworld/models/wallpaper_model.dart';
import 'package:wallpaperworld/theme/theme.dart';

import '../widgets/widget.dart';

class CategoryPage extends StatefulWidget {
  final String categoryName;

  const CategoryPage({required this.categoryName});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<WallpaperModel> wallpapers = [];

  getCategoriezedWallpapers(String query) async {
    var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/search?query=$query'),
        headers: {
          "Authorization": apiKey,
        });

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    getCategoriezedWallpapers(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (WallpaperModel != null && wallpapers.isNotEmpty)
              wallpapersList(wallpapers: wallpapers, context: context).py(12)
            else
              CircularProgressIndicator(
                color: MyTheme.orange,
              ).centered()
          ],
        ),
      ),
    );
  }
}
