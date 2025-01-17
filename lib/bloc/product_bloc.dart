import 'package:artikel_statemanagement_get_api_bloc/models/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      emit(ProductLoading());
      final response =
          await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));
      emit(ProductSuccess(productModelFromJson(response.body)));
    });
  }
}
