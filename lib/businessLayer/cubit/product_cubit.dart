import 'package:bloc/bloc.dart';
import 'package:ecommerce_newapi/businessLayer/repo.dart';
import 'package:ecommerce_newapi/dataLayer/Home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<MyProduct> {
  ProductCubit(this.myrepo) : super(MyInitial());
  static ProductCubit get(context) => BlocProvider.of(context);
  final repo myrepo;
    Products? prodctmodel;


  

  void ProductDataDetails(
    {
      required int id
    }
  ) {
    emit(LoadingProductDetails());
    myrepo.GetProductDetails(idd:id ).then((value) {
      print(value.id);
      emit(SucessProductDetails(value));
    }).catchError((e) {
      print(e.toString());
      emit(ErrorProductDetails(e));
    });
  }
}
 