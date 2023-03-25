import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:watch_loop/models/categories_model.dart';
import 'package:watch_loop/modules/selected_catagory.dart';
import 'package:watch_loop/shared/componant/components.dart';
import 'package:watch_loop/shared/cubit/cubit.dart';
import 'package:watch_loop/shared/cubit/states.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var _searchController = TextEditingController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
   }

  @override
  Widget build(BuildContext context) {
    var cubit = Appcubit.get(context) ;
    int? selectedindex ;

    return BlocConsumer<Appcubit, AppStates>(
      listener: (context, state) {

        if(state is GetDataSeriesSuccessState){
          navigatorTo(context, SelectedCategory(title: cubit.categoriesData[selectedindex!].name));

        }

      },
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.black12,
            title: Text(
              " Watch Loop ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true),
        body: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              buildbannerItem(),
              SizedBox(
                height: 20.h,
              ),
              buildbannerConntactItem(),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: defualtTextFormField(
                  controller: _searchController,
                  label: "Search",
                  prefixIcon: Icons.search,
                  validate: (value) {},
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                "Categories :",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 23.sp),
              ),
              SizedBox(
                height: 35.h,
              ),
              SizedBox(
                  height: 150.h,
                  child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {

                      if (cubit.categoriesData.isNotEmpty) {
                        print('${cubit.categoriesData[index]}');
                        selectedindex =index ;
                        return buildCategoriesItem(context, cubit.categoriesData[index], index);

                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                    itemCount: cubit.categoriesData.length,
                  )
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                "Latest additions :",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 23.sp),
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
                itemCount: 8,
                itemBuilder: (context, index) => buildLatestadditionsItem(),
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                " Most Viewed  :",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 23.sp),
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
                itemCount: 8,
                itemBuilder: (context, index) => buildLatestadditionsItem(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCategoriesItem(context,CategoriesData data, int index) {

  var cubit = Appcubit.get(context) ;


  return InkWell(
    onTap: ()   {
       cubit.getSeriesData(path: data.name);
     },

    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        width: 120.w,
        height: 150.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r), color: Colors.orange),
        child: Center(
          child: Text(
            "${data.name} ",
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis, // تحديد overflow إلى visible


            ),
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );


}

Widget buildLatestadditionsItem() {
  return InkWell(
    onTap: () {
     },
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
    ),
  );
}

Widget buildMostViewedItem() {
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
