import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_api/screens/details_page.dart';

import '../providers/product_provider.dart';
import '../widgets/product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Products",
          style: TextStyle(color: Colors.green),
        ),
        centerTitle: true,
      ),
      body: Consumer<ProductsProvider>(
        builder: (context, productsProviderObject, child) {
          var productsModel = productsProviderObject.productsModel;
          if (productsModel == null) {
            productsProviderObject.getProductsDataProvider();
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 3,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsPage(
                        image: productsModel.products[index]["picture"],
                        name: productsModel.products[index]["UserName"],
                        description: productsModel.products[index]
                            ["descriptions"],
                      ),
                    ),
                  );
                },
                child: ProductItem(
                  image: productsModel.products[index]["picture"],
                  name: productsModel.products[index]["UserName"],
                  price: productsModel.products[index]["prices"],
                ),
              ),
              itemCount: 20,
            );
          }
        },
      ),
    );
  }
}
