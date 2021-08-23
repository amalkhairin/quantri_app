import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quantri_app/component/input_form/qa_search_form.dart';
import 'package:quantri_app/constant/color.dart';
import 'package:quantri_app/constant/router_name.dart';
import 'package:quantri_app/models/tenant_model.dart';

class TenantCategoryDetailPage extends StatefulWidget {
  final String? categoryName;
  const TenantCategoryDetailPage({ Key? key, this.categoryName }) : super(key: key);

  @override
  _TenantCategoryDetailPageState createState() => _TenantCategoryDetailPageState();
}

class _TenantCategoryDetailPageState extends State<TenantCategoryDetailPage> {

  // search text controller
  TextEditingController _searchController = TextEditingController();
  Position? _myPosition;
  List<Tenant> _listTenant = [];

  List<List<double>> _latlong = [
    [-7.025253, 107.519760],
    [-7.374585, 108.558189],
    [-6.571589, 107.758736],
    [-6.953946, 107.677765],
    [-6.939008, 107.740753],
    [-6.595038, 106.816635],
    [-6.905977, 107.613144],
    [-6.923700, 106.928726],
  ];

  Future<void> _getMyPosition() async {
    Position pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    print(pos);
    setState(() {
      _myPosition = pos;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMyPosition();
    _listTenant = List.generate(8, (index) => Tenant(
      tenantID: index+1,
      tenantName: "Pemkot Bandung ${index+1}",
      latitude: _latlong[index][0],
      longitude: _latlong[index][1],
      address: "Jl. Sangkuriang No.10A, Dago, Kecamatan Coblong, Kota Bandung, Jawa Barat",
      description: "Dinas Catatan Sipil dan Kependudukan",
    ));
  }

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
            itemCount: _listTenant.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(24, 14, 24, 14),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(TENANT_DETAIL_ROUTE, arguments: _listTenant[index].tenantName);
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
                              Text(_listTenant[index].tenantName!, style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 8,),
                              Text(_listTenant[index].description!),
                              SizedBox(height: 8,),
                              Text(_listTenant[index].address!, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey[600]),),
                              SizedBox(height: 10,),
                              _myPosition == null
                              ? Text("...")
                              : Row(
                                children: [
                                  Icon(Icons.location_on, color: Colors.red, size: 14,),
                                  Text("${(Geolocator.distanceBetween(_myPosition!.latitude, _myPosition!.longitude, _listTenant[index].latitude!, _listTenant[index].longitude!)/10000).toStringAsFixed(2)} Km"),
                                ],
                              ),
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