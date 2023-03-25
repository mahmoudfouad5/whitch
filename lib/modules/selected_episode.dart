import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watch_loop/modules/test.dart';
 import 'package:watch_loop/shared/componant/components.dart';
import 'package:watch_loop/shared/cubit/cubit.dart';
import 'package:watch_loop/shared/cubit/states.dart';
import 'package:video_player/video_player.dart';


class SelectedEpisode extends StatefulWidget {

  final String videoId;


  const SelectedEpisode(this.videoId);

  @override
  State<SelectedEpisode> createState() => _SelectedEpisodeState();
}

class _SelectedEpisodeState extends State<SelectedEpisode> {
  var _searchController = TextEditingController();
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  double _aspectRatio = 16 / 9;

  @override
  initState() {
    super.initState();
    print(widget.videoId);
    _videoPlayerController = VideoPlayerController.network(widget.videoId);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _aspectRatio,
      autoInitialize: true,
      autoPlay: false,
      showControls: true,




      allowedScreenSleep: false,
      allowFullScreen: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    _chewieController.addListener(() {
      if (_chewieController.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Appcubit(),
      child: BlocConsumer<Appcubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
              backgroundColor: Colors.black12,
              title: Padding(
                padding: EdgeInsets.all(1.w),
                child: defualtTextFormField(
                  controller: _searchController,
                  label: "Search",
                  prefixIcon: Icons.search,
                  validate: (value) {},
                ),
              ),
              centerTitle: true),
          body: Padding(
            padding: EdgeInsets.all(10.0.w),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                buildbannerConntactItem(context),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  " أشلكبير قوى الجزء الحلقة 28  ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image(
                        width: double.infinity,
                        image: NetworkImage(
                            "https://mediaaws.almasryalyoum.com/news/large/2023/02/28/2041774_0.jpg")),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  " القصة  ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Text(
                    " القصة  احمد محمد احمد قام القصة  احمد محمد احمد قام القصة  احمد محمد احمد قام القصة  احمد محمد احمد قام     ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "تقييم الحلقة ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star_sharp,color: Colors.amber,size: 60.w,),
                    SizedBox(width: 5.w,),
                    Text(
                      " 4.5/5",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),




                  ],),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "الحلقة ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  child: Chewie(
                    controller: _chewieController,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget buildLatestadditionsItem() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 1.w),
    child: Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 250.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://mediaaws.almasryalyoum.com/news/large/2023/02/28/2041774_0.jpg"),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          Container(
            width: double.infinity,
            height: 60.h,
            color: Colors.black.withOpacity(.60),
            child: Text(
              "مسلسل الكبير قوى  الجزء 7 | الحلقة 28 ",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildbannerItem() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 1.w),
    child: Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0.h),
          child: Text(
            "Categories :",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: Colors.black),
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(20.r)),
    ),
  );
}

Widget buildbannerConntactItem(context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 1.w),
    child: Container(
      child: Padding(
        padding: EdgeInsets.all(5.0.h),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.facebook,
                size: 30.h,
              ),
            ),
            IconButton(
              onPressed: () {
               },
              icon: Icon(
                Icons.telegram,
                size: 30.h,
              ),
            ),
            Flexible(
              child: Text(
                "  .توصل معنا و تابع كل جديد من خلال متابعتنا   ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: Colors.black),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.cyan, borderRadius: BorderRadius.circular(20.r)),
    ),
  );
}
