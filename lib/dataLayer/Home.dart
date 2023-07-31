class Home {
  bool? status;
  Data? data;

  Home({this.status,  this.data});

  Home.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  
}

class Data {
  
  List<Products> products=[];


  Data.fromJson(Map<String, dynamic> json) {
     
       json['products'].forEach((element) {
        products.add(Products.fromJson(element));
      });
    
    
  }

 
}



class Products {
   int? id;
   dynamic  price;
  dynamic old_price;
  dynamic  discount;
  String? image;
  String? name;
  bool? in_favorites;
  bool? in_cart;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;



 
  

  Products(
      {this.id,
      this.price,
      this.old_price,
    
      this.discount,
      this.image,
      this.name,
      this.description,
      this.images,
      this.inFavorites,
      this.inCart});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    old_price=json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  
}