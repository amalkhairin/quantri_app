import 'package:flutter/material.dart';
import 'package:quantri_app/component/input_form/qa_search_form.dart';
import 'package:quantri_app/constant/color.dart';
import 'package:quantri_app/constant/router_name.dart';

class DashboardTenantCategory extends StatefulWidget {
  const DashboardTenantCategory({ Key? key }) : super(key: key);

  @override
  _DashboardTenantCategoryState createState() => _DashboardTenantCategoryState();
}

class _DashboardTenantCategoryState extends State<DashboardTenantCategory> {

  // text search controller
  TextEditingController _searchController = TextEditingController();

  List _tenantCategoryList = ["Pemerintah", "Bank", "RS", "Klinik", "Travel"];

  @override
  Widget build(BuildContext context) {
    // get app screen size
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24,),
            QASearchForm(
              onTap: (){
                Navigator.of(context).pushNamed(TENANT_CATEGORY_DETAIL_ROUTE, arguments: "Search");
              },
              readOnly: true,
              controller: _searchController,
              hintText: "Cari tenan",
            ),
            SizedBox(height: 24,),
            Text("Kategori", style: TextStyle(fontSize: 18),),
            SizedBox(height: 14,),

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _tenantCategoryList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(TENANT_CATEGORY_DETAIL_ROUTE, arguments: _tenantCategoryList[index]);
                  },
                  child: Column(
                    children: [
                      Flexible(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: itemBackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.home_filled, color: Colors.blue, size: 42,),
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text(_tenantCategoryList[index]),
                    ],
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3/4,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}