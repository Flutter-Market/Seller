import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchProduct extends StatefulWidget {
  final String searchText;

  const SearchProduct({ Key? key, required this.searchText }) : super(key: key);

  @override
  _SearchProductState createState() => _SearchProductState(searchText);
}

class _SearchProductState extends State<SearchProduct> {
  TextEditingController searchController = TextEditingController();
  String result = "";
  late List searchData;

  _SearchProductState(String searchText) {
    this.searchText = searchText;
  }

  late String searchText;

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
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("검색"),
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
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
                                    return SearchProduct(searchText: searchController.text,);
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
                ],
              ),
              searchText.isEmpty
              ? Flexible(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "검색 내용이 없습니다."
                    ),
                ))
              : Flexible(
                child: GestureDetector(
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
                                    // Image.network(
                                    //   searchData[position]["image"],
                                    //   height: 100, width: 100, fit: BoxFit.fill,
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
            ],
          ),
        ),
      ),
    );
  }


  Future<String> getJSONSearch() async {
    searchData.clear();
    var url = Uri.parse("http://localhost:8080/Market/seller_product_search.jsp?searchText=$searchText");
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON["results"];
      searchData.addAll(result);
    });
    return "a";
  }
}