import 'package:flutter/material.dart';
import '../models/stock_model.dart';
import 'package:http/http.dart' as http;

class StockDetailPage extends StatelessWidget {
  final Products product;

  const StockDetailPage({super.key, required this.product});

  Future<String> delete (BuildContext context) async {
    final String url = "https://dummyjson.com/products/${product.id}";
    final res = await http.delete(Uri.parse(url));

    if (res.statusCode == 200) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);

      print('Deleted');
    }






    else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Couldnt deleted'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    return '';
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.purple,
        ),


        floatingActionButton: FloatingActionButton(
          onPressed: () {
            delete(context);
          },
          child: const Icon(Icons.delete),
          backgroundColor: Colors.black87,
        ),


        body: ListView(
          children: [


            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(0),
              ),
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product.images?.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    width: 300,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purpleAccent),
                      image: DecorationImage(
                        image: NetworkImage(product.images![index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),



            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      product.title ?? 'No Title',
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      product.description ?? 'No Description',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'Price: ${product.price}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Text('Discount Percentage: ${product.discountPercentage}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),),
                    const SizedBox(height: 10),

                    Text('rating: ${product.rating}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),),
                    const SizedBox(height: 10),

                    Text('stock: ${product.stock}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),),
                    const SizedBox(height: 10),

                    Text('brand: ${product.brand}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),),
                    const SizedBox(height: 10),

                    Text('category: ${product.category}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),),
                    const SizedBox(height: 10),

                    Text('thumbnail: ${product.thumbnail}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),),


                  ],
                ),
              ),
            ),



          ],


        )



    );
  }
}
