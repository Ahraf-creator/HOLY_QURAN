import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:the_holy_quran/view/home_view.dart';

class onboardingScreen extends StatelessWidget {
  onboardingScreen({Key? key}) : super(key: key);

  final _pages = [
    PageModel(
      color: Colors.grey[700],
      imageAssetPath: "images/grad_logo.png",
      title: "The Holy Quran",
      body:
          "\"Indeed,It is we who sent down the Qur'an and indeed , we will be it's gardian\"",
      doAnimateImage: true,
    ),
    PageModel(
      color: Color(0xff106791),
      imageAssetPath: "images/ui.png",
      title: "Fancy & Beautiful Design",
      body: "we have worked heart to choose a color",
      doAnimateImage: true,
    ),
    PageModel(
      color: Color(0xff664d7b),
      imageAssetPath: "images/sajda.png",
      title: "sajdaIndex ",
      body: "Now , you can easily find out the sajda from quran ",
      doAnimateImage: true,
    ),
    PageModel(
          color: Color(0xff04364f),
      imageAssetPath: "images/easyNav.png",
      title: "Easy to Explor",
      body:
          "open juz, Surah or sajdah directly from the index ",
      doAnimateImage: true,
    ),
    PageModel(
          color: Colors.grey[850],
      imageAssetPath: "images/drawer3d.gif",
      title: "3D Animated Drawer",
      body:
          "Tell us your feeling about 3d Animation",
      doAnimateImage: true,
    ),
     PageModel(
      color: Color.fromARGB(255, 215, 205, 118),
      imageAssetPath: "images/mahmud1.png",
      title: 'Assalamualikum warahmatullah',
      body:'Developed by Mahmud Bin Amin',
      doAnimateImage: true,),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: OverBoard(
       pages:_pages,
       showBullets: true,
       skipCallback: () => Navigator.push(context, MaterialPageRoute(
         builder: (_)=> HomeView(),


       ),
       ),
finishCallback:()=> Navigator.push(context, MaterialPageRoute(
         builder: (_)=> HomeView(),


       ),
     ),
    ),
    );
  }
}
