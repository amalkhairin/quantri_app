import 'package:flutter/material.dart';
import 'package:quantri_app/component/button/qa_button1.dart';
import 'package:quantri_app/constant/color.dart';

enum QADialogType {
  SUCCESS,
  FAILED,
  ERROR,
  INFO
}

class QADialog extends StatelessWidget {
  final String? title,description;
  final QADialogType? dialogType;
  final List<Widget>? action;
  const QADialog({
    Key? key, 
    @required this.title, 
    @required this.description,
    this.dialogType = QADialogType.INFO,
    this.action
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: itemBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: dialogTypeIcon(dialogType!)
            ),
            SizedBox(height: 14,),
            Text(title!, textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(height: 14,),
            Text(description!, textAlign: TextAlign.center,),
            SizedBox(height: 14,),
            Row(
              children: [
                action!.isNotEmpty? Flexible(child: action![0]) : Container(),
                action!.length > 1
                  ? SizedBox(width: 8,)
                  : Container(),
                action!.length > 1 ? Flexible(child: action![1]) : Container()
              ],
            )
          ],
        ),
      ),
    );
  }

  dialogTypeIcon(QADialogType type) {
    switch (type) {
      case QADialogType.SUCCESS:
        return Icon(Icons.check_circle, size: 100, color: Colors.green,);
      case QADialogType.FAILED:
        return Icon(Icons.cancel_rounded, size: 100, color: Colors.red,);
      case QADialogType.ERROR:
        return Icon(Icons.wifi_tethering_error_rounded, size: 100, color: Colors.red,);
      default:
        return Icon(Icons.info_rounded, size: 100, color: Colors.blue,);
    }
  }
}