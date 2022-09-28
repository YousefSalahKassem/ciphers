import 'package:ciphers/controller/cipher_controller.dart';
import 'package:ciphers/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children:  [
                    ListTile(
                      leading: const Icon(Icons.enhanced_encryption),
                      title: const Text('Caeser Cipher', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      onTap: (){
                        Responsive.isDesktop(context)?null:Navigator.pop(context);
                        Provider.of<CipherController>(context,listen: false).changeIndex(0);
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.enhanced_encryption_outlined),
                      title: const Text('RailFence Cipher', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      onTap: (){
                        Responsive.isDesktop(context)?null:Navigator.pop(context);
                        Provider.of<CipherController>(context,listen: false).changeIndex(1);
                      },
                    ),
                    const Divider(),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
