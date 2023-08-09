import 'package:flutter/material.dart';
import 'package:list_app/service/stock_service.dart';
import '../models/stock_model.dart';
import 'stock_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StockService service = StockService();
  late Future<StockModel> futureStocks;


  @override
  void initState() {
    super.initState();
    futureStocks = service.fetchStocks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<StockModel>(
        future: futureStocks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.products!.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildStockModelInfo(snapshot.data!);
                } else {
                  return _buildProductItem(context, snapshot.data!.products![index]);
                }
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Widget _buildStockModelInfo(StockModel stockModel) {
  return ListTile(
    title: Text('Total: ${stockModel.total}'),
    //subtitle: Text('Skip: ${stockModel.skip}, Limit: ${stockModel.limit}'),
  );
}




Widget _buildProductItem(BuildContext context, Products product) {
  return InkWell(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  StockDetailPage(product: product),
          )
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: ListTile(
            title: Text(product.title ?? 'No Title'),
           // subtitle: Text(product.description ?? 'No Description'),
            trailing: Text('Price: ${product.price}'),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(product.thumbnail ?? ''),
            ),
          ),
        ),
      ),
    ),
  );
}
