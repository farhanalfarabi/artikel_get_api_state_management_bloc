import 'package:artikel_statemanagement_get_api_bloc/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Api Bloc'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ProductSuccess) {
            return GridView.builder(
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final product = state.products[index];
                return GridTile(
                  footer: GridTileBar(
                    backgroundColor: Colors.black54,
                    title: Text(product.title),
                  ),
                  child: Image.network("${product.images[1]}"),
                );
              },
            );
          }

          return const Center(
            child: Text(
              "NO DATA",
            ),
          );
        },
      ),
    );
  }
}
