import 'package:coda_wallet/global/global.dart';
import 'package:coda_wallet/widget/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

const _testAddress = 'B62qiXEBsYJtFDxyjPU5kEqKpbFibxrkj5CGERR8NN4uhqNjwoN3Q3S';

class ReceiveAccountScreen extends StatefulWidget {
  ReceiveAccountScreen({Key key}) : super(key: key);

  @override
  _ReceiveAccountScreenState createState() => _ReceiveAccountScreenState();
}

class _ReceiveAccountScreenState extends State<ReceiveAccountScreen> {
  final GlobalKey _qrImageKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812), allowFontScaling: false);
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: buildAccountsAppBar(),
      body: _buildReceiveAccountBody(),
    );
  }

  _buildReceiveAccountBody() {
    return Column(
      children: [
        Container(height: 24.h),
        Container(width: 58.w, height: 58.h, color: Colors.grey),
        Container(height: 42.h),
        QrImage(data: _testAddress, size: 200.w, version: QrVersions.auto),
        Container(height: 54.h),
        Text('Your Address', textAlign: TextAlign.center, style: TextStyle(fontSize: 14.sp, color: Colors.black)),
        Container(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Color(0xffe6e5eb),
            borderRadius: BorderRadius.circular(7.w),
            shape: BoxShape.rectangle,
          ),
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 13.h, bottom: 13.h),
          margin: EdgeInsets.only(left: 51.w, right: 51.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset('images/copy_gray.png', width: 18.w, height: 18.w,),
              Container(width: 20.w),
            Flexible(child:
              Text(_testAddress, textAlign: TextAlign.left, softWrap: true,
                style: TextStyle(fontSize: 12.sp, color: Color(0xff786666)), maxLines: 2, overflow: TextOverflow.visible,)),
            ],
          )
        ),
        Container(height: 16.h),
        RaisedButton(
          padding: EdgeInsets.only(top: 11.h, bottom: 11.h, left: 100.w, right: 100.w),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.w))),
          onPressed: null,
          color: Colors.blueAccent,
          child: Text('Save Image', style: TextStyle(fontSize: 17.sp, color: Colors.white, fontWeight: FontWeight.w600))
        )
      ],
    );
  }

}
