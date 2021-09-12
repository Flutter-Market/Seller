import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllProduct extends StatefulWidget {
  const AllProduct({ Key? key }) : super(key: key);

  @override
  _AllProductState createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  String result = "";
  late List productList;
  late List saleProductList;
  late List nonSaleProductList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productList = [];
    saleProductList = [];
    nonSaleProductList = [];

    productList.clear();
    saleProductList.clear();
    nonSaleProductList.clear();

    getJSONAllproduct();
    getJSONSaleProduct();
    getJSONNonSaleProduct();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          title: Text("상품 목록"),
          bottom: TabBar(
            tabs: [
              Tab(text: "총 상품"),
              Tab(text: "판매중"),
              Tab(text: "품절"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            productList.isEmpty
            ? Text("정보가 없습니다.")
            : ListView.builder(
                itemBuilder: (context, position) {
                  return GestureDetector(
                    child: Card(
                      child: Column(
                        children: [
                        // Image.network(
                        //   searchData[position]["image"],
                        //   height: 100, width: 100, fit: BoxFit.fill,
                        //   ),
                          Column(
                            children: [
                              Text(
                                "상품번호 : ${productList[position]["code"]}"
                                ),
                              Text(
                                "${productList[position]["name"]}"
                                ),
                              Text(
                                "${productList[position]["category"]}"
                                ),
                                Row(
                                  children: [
                                    Text("${productList[position]["status"]}"),
                                  ],
                                )
                            ],
                          )
                        ],
                      ),
                    ),
                    );
                },
                itemCount: productList.length,
                ),
            saleProductList.isEmpty
            ? Text("정보가 없습니다.")
            : ListView.builder(
                itemBuilder: (context, position) {
                  return GestureDetector(
                    child: Card(
                      child: Column(
                        children: [
                        // Image.network(
                        //   searchData[position]["image"],
                        //   height: 100, width: 100, fit: BoxFit.fill,
                        //   ),
                          Column(
                            children: [
                              Text(
                                "상품번호 : ${saleProductList[position]["code"]}"
                                ),
                              Text(
                                "${saleProductList[position]["name"]}"
                                ),
                              Text(
                                "${saleProductList[position]["category"]}"
                                ),
                                Row(
                                  children: [
                                    Text("${saleProductList[position]["status"]}"),
                                  ],
                                )
                            ],
                          )
                        ],
                      ),
                    ),
                    );
                },
                itemCount: saleProductList.length,
                ),
            nonSaleProductList.isEmpty
            ? Text("정보가 없습니다.")
            : ListView.builder(
                itemBuilder: (context, position) {
                  return GestureDetector(
                    child: Card(
                      child: Column(
                        children: [
                        // Image.network(
                        //   searchData[position]["image"],
                        //   height: 100, width: 100, fit: BoxFit.fill,
                        //   ),
                          Column(
                            children: [
                              Text(
                                "상품번호 : ${nonSaleProductList[position]["code"]}"
                                ),
                              Text(
                                "${nonSaleProductList[position]["name"]}"
                                ),
                              Text(
                                "${nonSaleProductList[position]["category"]}"
                                ),
                                Row(
                                  children: [
                                    Text("${nonSaleProductList[position]["status"]}"),
                                  ],
                                )
                            ],
                          )
                        ],
                      ),
                    ),
                    );
                },
                itemCount: nonSaleProductList.length,
                ),
          ],
        ),
      ));
  }

  Future<String> getJSONAllproduct() async {
    var url = Uri.parse("http://localhost:8080/Market/seller_product_list.jsp");
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON["results"];
      productList.addAll(result);
      // print(productList);
    });

    return "a";
  }

  Future<String> getJSONSaleProduct() async {
    var url = Uri.parse("http://localhost:8080/Market/seller_product_sale_list.jsp");
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON["results"];
      saleProductList.addAll(result);
    });

    return "a";
  }

  Future<String> getJSONNonSaleProduct() async {
    var url = Uri.parse("http://localhost:8080/Market/seller_product_nonsale_list.jsp");
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON["results"];
      nonSaleProductList.addAll(result);
    });

    return "a";
  }

}