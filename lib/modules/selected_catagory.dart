import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watch_loop/models/series_model.dart';
   import 'package:watch_loop/modules/selected_series.dart';
import 'package:watch_loop/shared/componant/components.dart';
import 'package:watch_loop/shared/cubit/cubit.dart';
import 'package:watch_loop/shared/cubit/states.dart';

class SelectedCategory extends StatelessWidget {
  SelectedCategory({Key? key, @required this.title}) : super(key: key);
  final String? title ;

  var _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var cubit = Appcubit.get(context) ;
    int? selectedindex ;


    return BlocProvider(
      create: (context) => Appcubit(),
      child: BlocConsumer<Appcubit, AppStates>(
        listener: (context, state) {
          if(state is GetDataSelectedSeriesSuccessState){
            navigatorTo(context, SelectedSeries(
              title: cubit.seriesData[selectedindex!].name,
              url: cubit.seriesData[selectedindex!].photo,
              story:  cubit.seriesData[selectedindex!].story,
              rate: cubit.seriesData[selectedindex!].rate,

            ));
            print(cubit.selectedseriesData.toString());
          }
        },
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
                  height: 20.h,
                ),
                Text(
                  " ${title} ",
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
                  itemCount: cubit.seriesData.length,
                  itemBuilder:  (context, index) {

                    if (cubit.seriesData.isNotEmpty) {
                       selectedindex =index ;
                      return buildLatestadditionsItem(context, cubit.seriesData[index], index,title!);

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


Widget buildLatestadditionsItem(context,SeriesData data, int index, String path) {
  var cubit = Appcubit.get(context) ;

  return InkWell(
    
      onTap: () {
        cubit.getSelectedSeriesData(path:path ,path2: data.name );
        print(path);
        print(data.name);
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
                      "${data.photo}"
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60.h,
              color: Colors.black.withOpacity(.60),
              child: Text(
                "${data.name} ",
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
