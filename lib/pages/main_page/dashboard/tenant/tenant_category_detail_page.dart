import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quantri_app/component/input_form/qa_search_form.dart';
import 'package:quantri_app/constant/color.dart';
import 'package:quantri_app/constant/router_name.dart';

class TenantCategoryDetailPage extends StatefulWidget {
  final String? categoryName;
  const TenantCategoryDetailPage({ Key? key, this.categoryName }) : super(key: key);

  @override
  _TenantCategoryDetailPageState createState() => _TenantCategoryDetailPageState();
}

class _TenantCategoryDetailPageState extends State<TenantCategoryDetailPage> {

  // search text controller
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // get app screen size
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
        title: Text("Tenant - ${widget.categoryName}", style: TextStyle(color: Colors.black),),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(92),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: QASearchForm(
              autofocus: widget.categoryName == "Search",
              hintText: "Cari tenan",
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 7,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(24, 14, 24, 14),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(TENANT_DETAIL_ROUTE, arguments: "Pemkot Bandung");
                  },
                  child: Ink(
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: primaryColor),
                    ),
                    padding: EdgeInsets.all(14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 1, child: CircleAvatar(radius: 36, backgroundColor: primaryColor,)),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pemkot Bandung", style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 8,),
                              Text("Dinas Catatan Sipil dan Kependudukan"),
                              SizedBox(height: 8,),
                              Text("Jl. Sangkuriang No.10A, Dago, Kecamatan Coblong, Kota Bandung, Jawa Barat", maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey[600]),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}