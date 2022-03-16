import 'package:flutter/material.dart';
import 'package:tinkle/app/data/api/categories_apis.dart';
import 'package:tinkle/app/data/api/company_apis.dart';

class CompanyOffersView extends StatelessWidget {
  const CompanyOffersView(this.CategoryId, {Key? key, required})
      : super(key: key);
  final int CategoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: CompanyApis.getOffersFromCompany(CategoryId),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Container();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
