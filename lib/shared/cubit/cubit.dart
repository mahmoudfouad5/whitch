import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:watch_loop/models/categories_model.dart';
import 'package:watch_loop/models/selected_series_model.dart';
import 'package:watch_loop/models/series_details.dart';
import 'package:watch_loop/models/series_model.dart';
 import 'package:watch_loop/shared/cubit/states.dart';

class Appcubit extends Cubit<AppStates> {
  Appcubit() : super(AppInitialState());

  static Appcubit get(context) => BlocProvider.of(context);






  List<CategoriesData> categoriesData = [];


  void getCategoriesData() {
    emit(GetCategoriesDataLoadingState());

    FirebaseFirestore.instance
        .collection("Categories")
        .get()
        .then((value) {
      categoriesData = [];
      value.docs.forEach((element) {

         categoriesData.add(CategoriesData.fromJson(element.data()));
      });

      emit(GetDataCategoriesSuccessState());
    }).catchError((error) {
      emit(GetDataCategoriesErrorState(error.toString()));
    });
  }

////////////////////////////////////

  // List<SeriesData> seriesData = [];
  //
  //
  // void getSeriesData({@required String? path }) {
  //   emit(GetSeriesDataLoadingState());
  //
  //   FirebaseFirestore.instance
  //       .collection("Categories/${path}/${path}")
  //       .get()
  //       .then((value) {
  //     seriesData = [];
  //     value.docs.forEach((element) {
  //
  //       seriesData.add(SeriesData.fromJson(element.data()));
  //     });
  //
  //     emit(GetDataSeriesSuccessState());
  //   }).catchError((error) {
  //     emit(GetDataSeriesErrorState(error.toString()));
  //   });
  // }

  ////////////////////////////////////
  List<SeriesData> seriesData = [];

  void getSeriesData({@required String? path }) {
    emit(GetSeriesDataLoadingState());

    FirebaseFirestore.instance
        .collection("Categories/${path}/${path}")
        .get()
        .then((value) {
      seriesData = [];
      value.docs.forEach((element) {
        var data = element.data();
        var details = SeriesDetails(
          ename: data['ename'].cast<String>(),
          epsnon: data['epsnon'].cast<String>(),
          rates: data['rates'].cast<String>(),
        );
        var series = SeriesData(
          name: data['name'],
          photo: data['photo'],
          story: data['story'],
          rate: data['rate'],
          details: details,
        );
        seriesData.add(series);
      });

      emit(GetDataSeriesSuccessState());
    }).catchError((error) {
      emit(GetDataCategoriesErrorState(error.toString()));
    });
  }


  //////////////////////////////////////



   List <SelectedSeriesData> selectedseriesData = [];
  void getSelectedSeriesData({@required String? path ,@required String? path2 }) {
    emit(GetSelectedSeriesDataLoadingState());

    FirebaseFirestore.instance
        .collection("Categories/${path}/${path}/الكبير اوى /الكبير اوى ")
        .get()
        .then((value) {
        selectedseriesData = [];

      print('done get data');
        value.docs.forEach((element) {

        selectedseriesData.add(SelectedSeriesData.fromJson(element.data()));
      });

      emit(GetDataSelectedSeriesSuccessState());
    }).catchError((error) {
      emit(GetDataSelectedSeriesErrorState(error.toString()));
      print(error.toString());
    });
  }

  ///////////////////////////////////








  }
