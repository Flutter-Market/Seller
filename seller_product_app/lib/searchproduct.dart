import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchProduct extends StatefulWidget {
  const SearchProduct({ Key? key }) : super(key: key);

  @override
  _SearchProductState createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  String result = "";
  late List searchData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchData = [];
    searchData.clear();
    getJSONSearch();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("dlqjsdksheiosehgiaohegoiw");
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("검색"),
        ),
        body: Container(
          child: searchData.length == 0
          ? Text("검색 내용이 없습니다.")
          : GestureDetector(
            child: ListView.builder(
              itemBuilder: (context, position) {
                return GestureDetector(
                  onTap: () {
                    // 상세내역으로 이동할것임
                  },
                  child: Card(
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // Image.asset(
                              //   "images/pica002.png"
                              //   ),
                                Column(
                                  children: [
                                    Text(
                                      "상품번호 : ${searchData[position]["code"]}"
                                      ),
                                    Text(
                                      "${searchData[position]["name"]}"
                                      ),
                                    Text(
                                      "${searchData[position]["category"]}"
                                      ),
                                      Row(
                                        children: [
                                          Text("판매중"),
                                          Text("품절"),
                                        ],
                                      )
                                  ],
                                )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: searchData.length,
              ),
          ),
        ),
      ),
    );
  }


  Future<String> getJSONSearch() async {
    searchData.clear();
    var url = Uri.parse("http://localhost:8080/Market/seller_product_search.jsp");
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON["results"];
      searchData.addAll(result);
    });
    return "a";
  }
}