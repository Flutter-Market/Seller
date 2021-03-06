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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productList = [];
    productList.clear();
    // getJSONAllproduct();
    // getJSONSaleProduct();
    // getJSONNonSaleProduct();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("AllProduct"),
      // body: Container(
      //   child: productList.isEmpty
      //   ? Text("데이터가 없습니다.")
      //   : ListView.builder(
      //     itemBuilder: (context, position) {
      //       return GestureDetector(
      //         child: Card(
      //           child: Column(
      //             children: [
      //             // Image.network(
      //             //   searchData[position]["image"],
      //             //   height: 100, width: 100, fit: BoxFit.fill,
      //             //   ),
      //               Column(
      //                 children: [
      //                   Text(
      //                     "상품번호 : ${productList[position]["code"]}"
      //                     ),
      //                   Text(
      //                     "${productList[position]["name"]}"
      //                     ),
      //                   Text(
      //                     "${productList[position]["category"]}"
      //                     ),
      //                     Row(
      //                       children: [
      //                         Text("${productList[position]["status"]}"),
      //                       ],
      //                     )
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //         );
      //     },
      //     itemCount: productList.length,
      //     ),
      // ),
    );
  }

  Future<String> getJSONAllproduct() async {
    var url = Uri.parse("http://localhost:8080/Market/seller_product_list.jsp");
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON["results"];
      productList.addAll(result);
      print(productList);
    });

    return "a";
  }
}
