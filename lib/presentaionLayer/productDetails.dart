import 'package:ecommerce_newapi/businessLayer/cubit/product_cubit.dart';
import 'package:ecommerce_newapi/businessLayer/repo.dart';
import 'package:ecommerce_newapi/dataLayer/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.id,
  });

  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: BlocProvider(
        create: (context) =>
            ProductCubit(repo(Object))..ProductDataDetails(id: id),
        child: BlocBuilder<ProductCubit, MyProduct>(
          builder: (context, state) {
            if (state is LoadingProductDetails) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(children: [
                BuildProductDetails(ProductCubit.get(context).prodctmodel!),
              ]);
            }
          },
        ),
      ),
    );
  }

  Widget BuildProductDetails(Products modell) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: Column(children: [
            Image(image: NetworkImage('${modell.image}')),
          ]),
        ),
      ],
    );
  }
}
