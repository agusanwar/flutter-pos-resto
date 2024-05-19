import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:posresto/data/datasource/product_local_datasource.dart';
import 'package:posresto/data/models/response/product_response_model.dart';

part 'local_product_event.dart';
part 'local_product_state.dart';
part 'local_product_bloc.freezed.dart';

class LocalProductBloc extends Bloc<LocalProductEvent, LocalProductState> {
  final ProductLocalDatasource productLocalDatasource;
  LocalProductBloc(
    this.productLocalDatasource,
  ) : super(const _Initial()) {
    on<_GetLocalProduct>((event, emit) async {
      // loading
      emit(const _Loading());
      // data
      final result = await productLocalDatasource.getProducts();

      emit(_Loaded(result));
    });
  }
}
