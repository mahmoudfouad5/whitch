import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:watch_loop/models/selected_series_model.dart';
import 'package:watch_loop/models/series_details.dart';
import 'package:watch_loop/models/series_model.dart';
 import 'package:watch_loop/modules/selected_episode.dart';
import 'package:watch_loop/shared/componant/components.dart';
import 'package:watch_loop/shared/cubit/cubit.dart';
import 'package:watch_loop/shared/cubit/states.dart';


class SelectedSeries extends StatelessWidget {
  SelectedSeries({Key? key,@required this.title, this.url, this.story, this.rate}) : super(key: key);

  final String? title ;
  final String? url ;
  final String? story ;
  final int? rate ;

  var _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var cubit = Appcubit.get(context) ;
    int? selectedindex ;
    SeriesData data ;


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
                buildbannerConntactItem(),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  " ${title}",
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
                           "${url}")),
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

                    "${story}",
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
                  "التقييم الكلى    ",
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
                      " ${rate} / 10",
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
                  "  الحلقات ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.h,
                ),


                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30.0,
                    crossAxisSpacing: 5.0,
                    childAspectRatio: 1,
                  ),
                  itemCount:cubit.selectedseriesData.length,
                  itemBuilder:  (context, index) {

                    if (cubit.selectedseriesData.isNotEmpty) {
                      print('${cubit.selectedseriesData[index]}');

                      return buildLatestadditionsItem(context, cubit.selectedseriesData[index], index,title!,url!);

                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                SizedBox(
                  height: 35.h,
                ),
               ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget buildLatestadditionsItem(context,  SelectedSeriesData data, int index, String path, String photo,) {


  return InkWell(
    onTap: () => navigatorTo(

        context, SelectedEpisode("https://firebasestorage.googleapis.com/v0/b/watchloop-4383c.appspot.com/o/01.%D9%83%D9%88%D8%B1%D8%B3%20%D8%AA%D8%B9%D9%84%D9%8A%D9%85%20%D8%A8%D8%B1%D9%86%D8%A7%D9%85%D8%AC%20%23Adobe_xd%20UI%20%26%20UX%20-%20%D8%A8%D8%A7%D9%84%D9%84%D8%BA%D8%A9%20%D8%A7%D9%84%D8%B9%D8%B1%D8%A8%D9%8A%D8%A9%20%D9%85%D9%86%20%D8%A7%D9%84%D8%B5%D9%81%D8%B1%20%2301%20%20intro.mp4?alt=media&token=db4e9636-1221-45be-8207-a3332f8ba6b7")),
    child: Padding(
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
                        "${photo}"),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60.h,
              color: Colors.black.withOpacity(.60),
              child: Text(
                "${data.name}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
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

Widget buildbannerConntactItem() {
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
              onPressed: () {},
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
