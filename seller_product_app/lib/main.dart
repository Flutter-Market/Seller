import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:seller_product_app/searchproduct.dart';

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
  String allProductCount = "0";
  String salesProductCount = "0";
  String nonSalesProductCount = "0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJSONAllproduct();
    getJSONSaleProduct();
    getJSONNonSaleProduct();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("떨이마켓"),
        ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Container(
              height: 100,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "상품 목록",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
              ),
              )
            ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        labelText: "검색어를 입력하세요.",
                        border: OutlineInputBorder(),
                        ),
                      keyboardType: TextInputType.text,
                    )
                  ),
                  ),
                Flexible(
                  flex: 1,
                  child: Container(
                    child:  IconButton(
                        onPressed: (){
                          print(searchController.text);
                          FocusScope.of(context).unfocus();

                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return SearchProduct();
                          }));
                        }, 
                        icon: Icon(
                          Icons.search,
                          )
                        )
                  ),
                  ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Card(
                    child: InkWell(
                      onTap: (){
                        print("총상품 클릭");
                      },
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 70,
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                    "총 상품",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                    ),
                              ),
                            )
                            ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 70,
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                    "$allProductCount 건",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                    ),
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                  )
                ),
                Flexible(
                  flex: 1,
                  child: Card(
                    child: InkWell(
                      onTap: (){
                        print("판매중 클릭");
                      },
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 70,
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                    "판매중",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                    ),
                              ),
                            )
                            ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 70,
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                    "$salesProductCount 건",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                    ),
                              ),
                                )
                              ),
                            ],
                          ),
                    ),
                  )
                    ),
                Flexible(
                  flex: 1,
                  child: Card(
                    child: InkWell(
                      onTap: (){
                        print("품절 클릭");
                      },
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 70,
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                    "품절",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                              ),
                              )
                            ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 70,
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                    "$nonSalesProductCount 건",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                    ),
                              ),
                            )
                            ),
                        ],
                       ),
                    ),
                  ) 
                ),
              ],
            )
            ),
          Flexible(
            // flex: 4,
            child: Container(
              height: 300,
              alignment: Alignment.bottomCenter,
              child: Flexible(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    minimumSize: Size(300, 50)
                  ),
                  onPressed: (){}, 
                  child: Text("상품 등록",
                  style: TextStyle(
                    fontSize: 20
                  ),)
                  ),
              ),
            )
            )
        ],
      ),
      ),
      
    );
  }

  Future<String> getJSONAllproduct() async {
    var url = Uri.parse("http://localhost:8080/Market/seller_product.jsp");
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON["results"];
      print("총상품 : ${result[0]["count"]}");
      allProductCount = result[0]["count"];
    });

    return "a";
  }

  Future<String> getJSONSaleProduct() async {
    var url = Uri.parse("http://localhost:8080/Market/seller_product_sale.jsp");
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON["results"];
      print("판매중 : ${result[0]["count"]}");
      salesProductCount = result[0]["count"];
    });

    return "a";
  }

  Future<String> getJSONNonSaleProduct() async {
    var url = Uri.parse("http://localhost:8080/Market/seller_product_nonsale.jsp");
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON["results"];
      print("판매중 : ${result[0]["count"]}");
      nonSalesProductCount = result[0]["count"];
    });

    return "a";
  }

}