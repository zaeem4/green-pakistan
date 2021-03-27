import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class IconCard extends StatelessWidget {
  const IconCard({Key key, this.icon, this.details}) : super(key: key);

  final String icon;
  final String details;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
        padding: EdgeInsets.all(kDefaultPadding / 2),
        height: 62,
        width: 62,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 15),
              blurRadius: 22,
              color: kPrimaryColor.withOpacity(0.22),
            ),
            BoxShadow(
              offset: Offset(-15, -15),
              blurRadius: 20,
              color: Colors.white,
            ),
          ],
        ),
        child: SvgPicture.asset(icon),
      ),
      onTap: () {
        showAlertDialog(context, details);
      },
    );
  }
}

showAlertDialog(BuildContext context, details) {
  // set up the button

  Widget okButton = FlatButton(
    color: kPrimaryColor,
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Container(
        child: AlertDialog(
          backgroundColor: kBackgroundColor.withOpacity(0.8),
          title: Text(details),
          content: Text("This is my message."),
          actions: [
            okButton,
          ],
        ),
      );
    },
  );
}
