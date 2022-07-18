import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wallpaperworld/theme/theme.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class DetailedImageScreen extends StatefulWidget {
  final String imgUrl;

  const DetailedImageScreen({required this.imgUrl});

  @override
  State<DetailedImageScreen> createState() => _DetailedImageScreenState();
}

class _DetailedImageScreenState extends State<DetailedImageScreen> {
  String _platformVersion = 'Unknown';
  String __heightWidth = "Unknown";

// Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initAppState() async {
    String platformVersion;
    String _heightWidth;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await WallpaperManager.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    try {
      int height = await WallpaperManager.getDesiredMinimumHeight();
      int width = await WallpaperManager.getDesiredMinimumWidth();
      _heightWidth =
          "Width = " + width.toString() + " Height = " + height.toString();
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      _heightWidth = "Failed to get Height and Width";
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      __heightWidth = _heightWidth;
      _platformVersion = platformVersion;
    });
  }

  Future<void> setWallpaper() async {
    try {
      String url = widget.imgUrl;
      int location = WallpaperManager
          .HOME_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(url);
      final bool result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      if (result) {
        wallpaperUpdated(context);
      }
    } on PlatformException {}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Hero(
              tag: widget.imgUrl,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: MyTheme.orange, width: 2),
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [MyTheme.baseBlack, MyTheme.darkGrey],
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            setWallpaper();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              "Set This Wallppaer"
                                  .text
                                  .semiBold
                                  .size(16)
                                  .white
                                  .make(),
                              SizedBox(
                                height: 5,
                              ),
                              "Image Will Be Saved In Gallary"
                                  .text
                                  .size(14)
                                  .ellipsis
                                  .red300
                                  .make(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                            width: MediaQuery.of(context).size.width / 3.9,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: MyTheme.orange, width: 2),
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                colors: [MyTheme.baseBlack, MyTheme.darkGrey],
                              ),
                            ),
                            child: "Cancel".text.white.center.bold.make()),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

wallpaperUpdated(context) {
  Navigator.pop(context);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Wallpaper Updated !"),
    ),
  );
}
