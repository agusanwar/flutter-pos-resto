import 'package:flutter/material.dart';
import 'package:posresto/data/models/product_model.dart';
import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';

class ProductCard extends StatelessWidget {
  final ProductModel data;
  final VoidCallback onCartButton;

  const ProductCard({
    super.key,
    required this.data,
    required this.onCartButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.read<CheckoutBloc>().add(CheckoutEvent.addProduct(data));
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              color: AppColors.primary,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(15.0),
                  margin: const EdgeInsets.only(top: 15.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.disabled.withOpacity(0.2),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                    child: Image.asset(
                      data.image,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Spacer(),
                FittedBox(
                  child: Text(
                    data.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SpaceHeight(8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: FittedBox(
                        child: Text(
                          data.category.value,
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: FittedBox(
                        child: Text(
                          data.priceFormat,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            color: AppColors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // BlocBuilder<CheckoutBloc, CheckoutState>(
            //   builder: (context, state) {
            //     return state.maybeWhen(
            //       orElse: () => const SizedBox(),
            //       success: (products, qty, price) {
            //         if (qty == 0) {
            //           return Align(
            //             alignment: Alignment.topRight,
            //             child: Container(
            //               width: 36,
            //               height: 36,
            //               padding: const EdgeInsets.all(6),
            //               decoration: const BoxDecoration(
            //                 borderRadius:
            //                     BorderRadius.all(Radius.circular(9.0)),
            //                 color: AppColors.primary,
            //               ),
            //               child: Assets.icons.shoppingBasket.svg(),
            //             ),
            //           );
            //         }
            //         return products.any((element) => element.product == data)
            //             ? products
            //                         .firstWhere(
            //                             (element) => element.product == data)
            //                         .quantity >
            //                     0
            //                 ? Align(
            //                     alignment: Alignment.topRight,
            //                     child: Container(
            //                       width: 40,
            //                       height: 40,
            //                       padding: const EdgeInsets.all(6),
            //                       decoration: const BoxDecoration(
            //                         borderRadius:
            //                             BorderRadius.all(Radius.circular(9.0)),
            //                         color: AppColors.primary,
            //                       ),
            //                       child: Center(
            //                         child: Text(
            //                           products
            //                               .firstWhere((element) =>
            //                                   element.product == data)
            //                               .quantity
            //                               .toString(),
            //                           style: const TextStyle(
            //                               color: Colors.white,
            //                               fontSize: 20,
            //                               fontWeight: FontWeight.bold),
            //                         ),
            //                       ),
            //                     ),
            //                   )
            //                 : Align(
            //                     alignment: Alignment.topRight,
            //                     child: Container(
            //                       width: 36,
            //                       height: 36,
            //                       padding: const EdgeInsets.all(6),
            //                       decoration: const BoxDecoration(
            //                         borderRadius:
            //                             BorderRadius.all(Radius.circular(9.0)),
            //                         color: AppColors.primary,
            //                       ),
            //                       child: Assets.icons.shoppingBasket.svg(),
            //                     ),
            //                   )
            //             : Align(
            //                 alignment: Alignment.topRight,
            //                 child: Container(
            //                   width: 36,
            //                   height: 36,
            //                   padding: const EdgeInsets.all(6),
            //                   decoration: const BoxDecoration(
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(9.0)),
            //                     color: AppColors.primary,
            //                   ),
            //                   child: Assets.icons.shoppingBasket.svg(),
            //                 ),
            //               );
            //       },
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
