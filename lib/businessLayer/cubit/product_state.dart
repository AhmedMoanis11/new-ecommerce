part of 'product_cubit.dart';


@immutable
abstract class MyProduct {}

class MyInitial extends MyProduct {}


class LoadingProductDetails extends MyProduct{}
class SucessProductDetails extends MyProduct{
  final Products ProductDetails;

  SucessProductDetails(this.ProductDetails);
   
  
}
class ErrorProductDetails extends MyProduct
{

  final dynamic Error;

  ErrorProductDetails(this.Error);
  
}




