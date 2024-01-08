import 'package:e_commerce_flutter_crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset(AssetsPath.logoNav),
        actions: [
          CircleIconButton(
            onTap: () {},
            iconData: Icons.account_circle_rounded,
          ),
          const SizedBox(width: 8,),

          CircleIconButton(
            onTap: () {},
            iconData: Icons.call,
          ),
          const SizedBox(width: 8,),
          CircleIconButton(
            onTap: () {},
            iconData: Icons.notifications_active_outlined,
          ),
          const SizedBox(width: 12,),
        ],
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.onTap,
    required this.iconData,
  });

  final VoidCallback onTap;

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: CircleAvatar(
        radius: 15,
        child: Icon(
          iconData,
          color: Colors.grey,
          size: 20,
        ),
        backgroundColor: Colors.grey.shade300,
      ),
    );
  }
}
