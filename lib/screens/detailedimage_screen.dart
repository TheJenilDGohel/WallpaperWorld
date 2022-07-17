import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wallpaperworld/theme/theme.dart';

class DetailedImageScreen extends StatefulWidget {
  final String imgUrl;

  const DetailedImageScreen({required this.imgUrl});

  @override
  State<DetailedImageScreen> createState() => _DetailedImageScreenState();
}

class _DetailedImageScreenState extends State<DetailedImageScreen> {
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
                  color: Color(0xff1c1b1b).withOpacity(0.6),
                ),
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
                      SizedBox(
                        height: 16,
                      ),
                      "Cancel".text.white.bold.make(),
                      SizedBox(
                        height: 50,
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
