import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_newapi/businessLayer/cubit/my_cubit.dart';
import 'package:ecommerce_newapi/businessLayer/repo.dart';
import 'package:ecommerce_newapi/dataLayer/Home.dart';
import 'package:ecommerce_newapi/presentaionLayer/ProductDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSc extends StatelessWidget {
  const ProductSc({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imag = [
      'assets/images/pic.jpg',
      'assets/images/pic1.jpg',
      'assets/images/pic2.jpg',
      'assets/images/pic5.jpg',
      'assets/images/pic6.jpg',
    ];

    final List<Widget> imageSliders = imag
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        item,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();
    return BlocProvider(
      create: (context) => MyCubit(repo(Object))..GetHomeData(),
      child: BlocConsumer<MyCubit, MyState>(
        listener: (context, state) {
          if (state is SuccessHomeState) {}
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 80.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Discover',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(8.0),
                          color: Colors.grey.shade100,
                        ),
                        child: TextFormField(
                          controller: TextEditingController(),
                          decoration: const InputDecoration(
                            hintText: 'search... ',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              CupertinoIcons.search,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter email";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    CarouselSlider(
                        items: imageSliders,
                        options: CarouselOptions(
                          initialPage: 0,
                          viewportFraction: 1.0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayAnimationDuration: const Duration(seconds: 2),
                          autoPlayInterval: const Duration(seconds: 3),
                          scrollDirection: Axis.horizontal,
                        )),
                    ConditionalBuilder(
                      condition: MyCubit.get(context).homemodel != null,
                      builder: (context) => buildGridProduct(
                          MyCubit.get(context).homemodel!.data!, context),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }

  Widget BuildProduct(Products modell, context) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetails(id: modell.id!)));
        },
        child: Container(
          height: 250,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.white,
                Color.fromARGB(255, 227, 227, 227),
              ],
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadiusDirectional.circular(20.0),
          ),
          child: Column(children: [
            const SizedBox(
              height: 10.0,
            ),
            ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(20.0),
              child: Image(
                width: 150.0,
                height: 150.0,
                image: NetworkImage('${modell.image}'),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Text(
                '${modell.description}',
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 89, 88, 88),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text(
                  '${modell.price}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 237, 75),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                const Text(
                  '\$',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 237, 75),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildGridProduct(Data datamodel, context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 30.0,
              childAspectRatio: 1 / 1.5,
              children: List.generate(
                datamodel.products.length,
                (index) => BuildProduct(datamodel.products[index], context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
