import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SellerProduct(),
    );
  }
}

class SellerProduct extends StatefulWidget {
  const SellerProduct({ Key? key }) : super(key: key);

  @override
  _SellerProductState createState() => _SellerProductState();
}

class _SellerProductState extends State<SellerProduct> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("떨이마켓"),
      ),
      body: Container(
          child: Column(
            children: [
              Text("상품 목록",
              style: TextStyle(
                fontSize: 20,
              ),),
              TextField(
                controller: searchController,
                decoration: InputDecoration(labelText: "검색어를 입력하세요"),
                keyboardType: TextInputType.text,
              )
            ],
          ),
      )
      
    );
  }
}