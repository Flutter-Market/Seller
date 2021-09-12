import 'package:flutter/material.dart';

class NonSaleProduct extends StatefulWidget {
  const NonSaleProduct({ Key? key }) : super(key: key);

  @override
  _NonSaleProductState createState() => _NonSaleProductState();
}

class _NonSaleProductState extends State<NonSaleProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("NonSaleProduct"),
    );
  }
}