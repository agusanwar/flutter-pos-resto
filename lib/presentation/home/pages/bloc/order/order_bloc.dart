import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:posresto/core/extensions/string_ext.dart';
import 'package:posresto/data/datasource/auth_local_datasource.dart';
import 'package:posresto/data/datasource/product_local_datasource.dart';
import 'package:posresto/data/models/home_product_quantity.dart';
import 'package:posresto/data/models/order_model.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(_Initial()) {
    on<_Order>((event, emit) async {
      emit(const _Loading());

      final subTotal = event.items.fold<int>(
        0,
        (previousValue, element) =>
            previousValue + element.product.price!.toIntegerFromText,
      );

      final total = subTotal + event.tax + event.serviceCharge - event.discount;

      final totalItem = event.items.fold<int>(
          0, (previousValue, element) => previousValue + element.quantity);

      final userData = await AuthLocalDataSource().getAuthData();

      // // save to local storage
      final data = OrderModel(
        subTotal: subTotal,
        paymentAmount: event.paymentAmount,
        tax: event.tax,
        discount: event.discount,
        serviceCharge: event.serviceCharge,
        total: total,
        paymentMethod: 'Cash',
        totalItem: totalItem,
        idKasir: userData.user!.id!,
        namaKasir: userData.user!.name!,
        transactionTime: DateTime.now().toIso8601String(),
        isSync: 0,
        orderItems: event.items,
      );

      // save to local storage
      ProductLocalDatasource.instance.saveOrder(data);

      emit(_Loaded(
        event.items,
        event.discount,
        event.tax,
        event.serviceCharge,
        event.paymentAmount,
      ));
    });
  }
}
