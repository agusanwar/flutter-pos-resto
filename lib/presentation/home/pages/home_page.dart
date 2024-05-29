import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posresto/core/assets/assets.gen.dart';
import 'package:posresto/core/components/buttons.dart';
import 'package:posresto/core/components/spaces.dart';
import 'package:posresto/core/constants/colors.dart';
import 'package:posresto/core/extensions/build_context_ext.dart';
import 'package:posresto/core/extensions/int_ext.dart';
import 'package:posresto/core/extensions/string_ext.dart';
import 'package:posresto/presentation/home/pages/bloc/checkout/checkout_bloc.dart';
import 'package:posresto/presentation/home/pages/bloc/local_product/local_product_bloc.dart';
import 'package:posresto/presentation/home/pages/confirm_payment_page.dart';
import 'package:posresto/presentation/home/widgets/column_button.dart';
import 'package:posresto/presentation/home/widgets/custom_tab_bar.dart';
import 'package:posresto/presentation/home/widgets/home_tile.dart';
import 'package:posresto/presentation/home/widgets/order_menu.dart';
import 'package:posresto/presentation/home/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();

  // List<ProductModel> searchResults = [];
  // final List<ProductModel> products = [
  //   ProductModel(
  //       image: Assets.images.menu1.path,
  //       name: 'Express Bowl Ayam Rica',
  //       category: ProductCategory.food,
  //       price: 32000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.menu2.path,
  //       name: 'Crispy Black Pepper Sauce',
  //       category: ProductCategory.food,
  //       price: 36000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.menu3.path,
  //       name: 'Mie Ayam Teriyaki',
  //       category: ProductCategory.food,
  //       price: 33000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.menu4.path,
  //       name: 'Nasi Ayam Teriyaki',
  //       category: ProductCategory.food,
  //       price: 21000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.menu5.path,
  //       name: ' Katsu Teriyaki Saos',
  //       category: ProductCategory.food,
  //       price: 40000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.menu6.path,
  //       name: 'Sapo Tahu Ayam',
  //       category: ProductCategory.food,
  //       price: 41000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.menu7.path,
  //       name: ' Sapo Tahu Sapi',
  //       category: ProductCategory.food,
  //       price: 44000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.menu8.path,
  //       name: 'Chicken Cordon Bleu',
  //       category: ProductCategory.food,
  //       price: 45000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.menu10.path,
  //       name: 'Fish & Chips ',
  //       category: ProductCategory.food,
  //       price: 35000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.menu11.path,
  //       name: 'Bihun Ayam',
  //       category: ProductCategory.food,
  //       price: 39000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.menu12.path,
  //       name: 'Bihun Goreng Ayam',
  //       category: ProductCategory.food,
  //       price: 38000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.menu13.path,
  //       name: 'Nasi Goreng Special',
  //       category: ProductCategory.food,
  //       price: 35000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.menu14.path,
  //       name: 'Nasi Cap Cay',
  //       category: ProductCategory.food,
  //       price: 40000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.drink1.path,
  //       name: 'Teh Tarik',
  //       category: ProductCategory.drink,
  //       price: 20000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.drink2.path,
  //       name: 'Thai Tea',
  //       category: ProductCategory.drink,
  //       price: 22000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.drink3.path,
  //       name: 'Jus Melon',
  //       category: ProductCategory.drink,
  //       price: 25000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.drink4.path,
  //       name: 'Jus Stawberry',
  //       category: ProductCategory.drink,
  //       price: 24000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.drink5.path,
  //       name: 'Air Mineral Botol',
  //       category: ProductCategory.drink,
  //       price: 6000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.drink6.path,
  //       name: 'Jus Alpukat',
  //       category: ProductCategory.drink,
  //       price: 25000,
  //       stock: 10),
  //   ProductModel(
  //       image: Assets.images.menu14.path,
  //       name: 'Caramel Candy Blend',
  //       category: ProductCategory.drink,
  //       price: 30000,
  //       stock: 10),
  // ];

  @override
  void initState() {
    // searchResults = products;
    context
        .read<LocalProductBloc>()
        .add(const LocalProductEvent.getLocalProduct());
    super.initState();
  }

  void onCategoryTap(int index) {
    searchController.clear();
    // if (index == 0) {
    //   searchResults = products;
    // } else {
    //   searchResults = products
    //       .where((e) => e.category.index.toString().contains(index.toString()))
    //       .toList();
    // }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // if (products.isEmpty) {
    //   return const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }
    return Hero(
      tag: 'confirmation_screen',
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          HomeTitle(
                            controller: searchController,
                            onChanged: (value) {
                              // searchResults = products
                              //     .where((e) => e.name
                              //         .toLowerCase()
                              //         .contains(value.toUpperCase()))
                              //     .toList();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 24),
                          CustomTabBar(
                            tabTitles: const [
                              'All',
                              'Drink',
                              'Food',
                              'Desserts',
                            ],
                            initialTabIndex: 0,
                            tabViews: [
                              // if (searchResults.isEmpty)
                              //   const Padding(
                              //     padding: EdgeInsets.only(top: 80.0),
                              //     child: _IsEmpty(),
                              //   )
                              // else
                              SizedBox(
                                child: BlocBuilder<LocalProductBloc,
                                    LocalProductState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(orElse: () {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }, loading: () {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }, loaded: (products) {
                                      if (products.isEmpty) {
                                        return const Center(
                                          child: Text('No Items'),
                                        );
                                      }
                                      return GridView.builder(
                                        shrinkWrap: true,
                                        itemCount: products.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 0.75,
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 25.0,
                                          mainAxisSpacing: 30.0,
                                        ),
                                        itemBuilder: (context, index) =>
                                            ProductCard(
                                          data: products[index],
                                          onCartButton: () {},
                                        ),
                                      );
                                    });
                                  },
                                ),
                              ),

                              // TAB DRINK
                              SizedBox(
                                child: BlocBuilder<LocalProductBloc,
                                    LocalProductState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      orElse: () {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                      loading: () {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                      loaded: (products) {
                                        if (products.isEmpty) {
                                          return const Center(
                                            child: Text('No Items Drink'),
                                          );
                                        }
                                        return GridView.builder(
                                          shrinkWrap: true,
                                          itemCount: products
                                              .where((element) =>
                                                  element.category!.id! == 1)
                                              .toList()
                                              .length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: 0.75,
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 25.0,
                                            mainAxisSpacing: 30.0,
                                          ),
                                          itemBuilder: (context, index) =>
                                              ProductCard(
                                            data: products
                                                .where((element) =>
                                                    element.category!.id! == 1)
                                                .toList()[index],
                                            onCartButton: () {},
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),

                              // TAB DATA FOOD
                              SizedBox(
                                child: BlocBuilder<LocalProductBloc,
                                    LocalProductState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(orElse: () {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }, loading: () {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }, loaded: (products) {
                                      if (products.isEmpty) {
                                        return const Center(
                                          child: Text('No Items Food'),
                                        );
                                      }
                                      return GridView.builder(
                                        shrinkWrap: true,
                                        itemCount: products
                                            .where((element) =>
                                                element.category!.id! == 2)
                                            .toList()
                                            .length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 0.75,
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 25.0,
                                          mainAxisSpacing: 30.0,
                                        ),
                                        itemBuilder: (context, index) =>
                                            ProductCard(
                                          data: products
                                              .where((element) =>
                                                  element.category!.id! == 2)
                                              .toList()[index],
                                          onCartButton: () {},
                                        ),
                                      );
                                    });
                                  },
                                ),
                              ),

                              // TAB DATA DISSERTS
                              SizedBox(
                                child: BlocBuilder<LocalProductBloc,
                                    LocalProductState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      orElse: () {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                      loading: () {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                      loaded: (products) {
                                        if (products.isEmpty) {
                                          return const Center(
                                            child: Text('No Items Disserts'),
                                          );
                                        }
                                        return GridView.builder(
                                          shrinkWrap: true,
                                          itemCount: products
                                              .where((element) =>
                                                  element.category!.id! == 3)
                                              .toList()
                                              .length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: 0.75,
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 25.0,
                                            mainAxisSpacing: 30.0,
                                          ),
                                          itemBuilder: (context, index) =>
                                              ProductCard(
                                            data: products
                                                .where((element) =>
                                                    element.category!.id! == 3)
                                                .toList()[index],
                                            onCartButton: () {},
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    color: AppColors.white,
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Orders Item',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SpaceHeight(20),
                              Row(
                                children: [
                                  Button.filled(
                                    width: 120.0,
                                    height: 40,
                                    onPressed: () {},
                                    label: 'Dine In',
                                  ),
                                  const SpaceWidth(8.0),
                                  Button.outlined(
                                    width: 140.0,
                                    height: 40,
                                    onPressed: () {},
                                    label: 'Take Away',
                                  ),
                                ],
                              ),
                              const SpaceHeight(20.0),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Item Product',
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  SizedBox(
                                    width: 50.0,
                                    child: Text(
                                      'Qty',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    child: Text(
                                      'Price',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SpaceHeight(8),
                              const Divider(
                                color: Colors.black,
                              ),
                              const SpaceHeight(8),
                              BlocBuilder<CheckoutBloc, CheckoutState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    orElse: () => const Center(
                                      child: Text('No Items'),
                                    ),
                                    loaded: (products) {
                                      if (products.isEmpty) {
                                        return const Center(
                                          child: Text('No Items'),
                                        );
                                      }
                                      return ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            OrderMenu(data: products[index]),
                                        separatorBuilder: (context, index) =>
                                            const SpaceHeight(1.0),
                                        itemCount: products.length,
                                      );
                                    },
                                  );
                                },
                              ),
                              const SpaceHeight(8.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ColumnButton(
                                    label: 'Diskon',
                                    svgGenImage: Assets.icons.diskon,
                                    onPressed: () {},
                                  ),
                                  ColumnButton(
                                    label: 'Pajak',
                                    svgGenImage: Assets.icons.pajak,
                                    onPressed: () {},
                                  ),
                                  ColumnButton(
                                    label: 'Layanan',
                                    svgGenImage: Assets.icons.layanan,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              const SpaceHeight(8.0),
                              const Divider(
                                color: Colors.black,
                              ),
                              const SpaceHeight(8.0),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Pajak',
                                      style: TextStyle(color: AppColors.red),
                                    ),
                                    Text(
                                      '11 %',
                                      style: TextStyle(
                                        color: AppColors.red,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SpaceHeight(8.0),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Diskon',
                                      style: TextStyle(color: AppColors.green),
                                    ),
                                    Text(
                                      'Rp. 0',
                                      style: TextStyle(
                                        color: AppColors.green,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SpaceHeight(8.0),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Sub total',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    BlocBuilder<CheckoutBloc, CheckoutState>(
                                      builder: (context, state) {
                                        final price = state.maybeWhen(
                                          orElse: () => 0,
                                          // sub total logic
                                          loaded: (products) {
                                            if (products.isEmpty) {
                                              return 0;
                                            }
                                            return products
                                                // if error bud e
                                                .map((e) =>
                                                    e.product.price!
                                                        .toIntegerFromText *
                                                    e.quantity)
                                                .reduce((value, element) =>
                                                    value + element);
                                          },
                                        );
                                        return Text(
                                          price.currencyFormatRp,
                                          style: const TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SpaceHeight(100.0),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ColoredBox(
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                  vertical: 16.0,
                                ),
                                child: Button.filled(
                                  onPressed: () {
                                    context.push(const ConfirmPaymentPage());
                                  },
                                  label: 'Pembayaran',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IsEmpty extends StatelessWidget {
  const _IsEmpty();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.noProduct.svg(),
          const SizedBox(height: 80.0),
          const Text(
            'Product Belum Ada',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
