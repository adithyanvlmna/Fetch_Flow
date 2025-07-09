import 'package:fetch_flow/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? leadingIcon;
  final IconData? actionIcon;
  final void Function()? onLeadingPressed;
  final void Function()? onActionPressed;
  final bool? isDrawer;
  final bool? istitle;
  final String? title;
  const CommonAppbar({
    super.key,
     this.leadingIcon,
     this.actionIcon,
     this.onActionPressed,
     this.onLeadingPressed,
    this.isDrawer=false,
    this.istitle=false,
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
       title:istitle!?  Text(title!, style: TextStyle(color: Colors.black)):Text(""),
      backgroundColor: whiteColor,
      leading:isDrawer!?null
      : button(leadingIcon!, onLeadingPressed),
    actions: [

       if (actionIcon != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: button(actionIcon!, onActionPressed),
          ),],
    );
  }

  IconButton button(IconData icon, void Function()? onPressed) =>
      IconButton(onPressed: onPressed, icon: Icon(icon,color: blackColor,));

  @override
  Size get preferredSize => Size.fromHeight(40);
}
