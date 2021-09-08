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
                          onPressed: (){}, 
                          icon: Icon(
                            Icons.search,
                            )
                          )
                    ),
                    ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
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
                    )
                  ),
                  Flexible(
                    flex: 1,
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
                        )
                      ),
                  Flexible(
                    flex: 1,
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
}