import 'package:flutter/material.dart';
import 'package:product/core/styles/color_manager.dart';
import 'package:product/core/styles/styles_manager.dart';

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Row(children: [Icon(Icons.wb_sunny_outlined,color: ColorManager.primaryColor),
    const SizedBox(width: 8),
    Text('Good Morning',style: StyleManager.titleText20Style,)
    
    ],), Icon(Icons.shopping_cart_outlined, size:28)],);
  }
}