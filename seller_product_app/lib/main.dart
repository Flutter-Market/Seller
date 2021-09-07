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
  int allProductCount = 0;
  int salesProductCount = 0;
  int nonSalesProductCount = 0;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints.tightFor(width: 350),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(labelText: "검색어를 입력하세요"),
                      keyboardType: TextInputType.text,
                      
                    ),
                  ),
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.search)
                    )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("총 상품"),
                  Text(
                    "$allProductCount 건"
                    )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("판매중"),
                  Text(
                    "$salesProductCount 건"
                    )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("품절"),
                  Text(
                    "$nonSalesProductCount 건"
                    )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: ElevatedButton(
                onPressed: (){}, 
                child: Text("상품 등록")
                ),
                ),
              )
            ],
          ),
      )
      
    );
  }
}