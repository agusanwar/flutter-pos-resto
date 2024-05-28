import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:posresto/data/models/home_product_quantity.dart';
import 'package:posresto/data/models/response/product_response_model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';
part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(const _Loaded([])) {
    // add item
    on<_AddItem>((event, emit) {
      // get data
      var currentState = state as _Loaded;

      // new data
      // List<ProductQuantity> items = currentState.items;
      // if error in curretnt state item maka di keluarkan
      List<ProductQuantity> items = [...currentState.items];
      // check product quantity
      var index =
          items.indexWhere((element) => element.product.id == event.product.id);

      emit(const _Loading());
      // if product null -1 item, this is product +1 item
      if (index != -1) {
        items[index] = ProductQuantity(
            product: event.product, quantity: items[index].quantity + 1);
      } else {
        items.add(
          ProductQuantity(product: event.product, quantity: 1),
        );
      }

      emit(_Loaded(items));
    });

    // remove item
    on<_RemoveItem>((event, emit) {
      // get data
      var currentState = state as _Loaded;

      // new data
      List<ProductQuantity> items = [...currentState.items];
      // check product quantity
      var index =
          items.indexWhere((element) => element.product.id == event.product.id);
      // if product null -1 item, this is product +1 item

      emit(const _Loading());
      if (index != -1) {
        // if quantity > 1 reduced quantity item jika < 1 because remove
        if (items[index].quantity > 1) {
          items[index] = ProductQuantity(
              product: event.product, quantity: items[index].quantity - 1);
        } else {
          items.removeAt(index);
        }
      }

      emit(_Loaded(items));
    });

    // new item
    on<_Started>((event, emit) {
      emit(const _Loaded([]));
    });
  }
}
