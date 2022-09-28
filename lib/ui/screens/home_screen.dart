import 'package:ciphers/controller/cipher_controller.dart';
import 'package:ciphers/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/responsive.dart';
import '../widgets/side_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              backgroundColor: bgColor,
              elevation: 0,
              leading: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
            )
          : AppBar(
              backgroundColor: bgColor,
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
              ),
            ),
      drawer: const SideMenu(),
      body: Responsive.isDesktop(context)
          ? Row(
              children: [
                const Expanded(
                  flex: 4,
                  child: SideMenu(),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Enter your Text',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Your Text will be encrypted automatically',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: bodyTextColor.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: SingleChildScrollView(
                      child: Form(
                          key: Provider.of<CipherController>(context,
                                  listen: false)
                              .formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Welcome to the world of cryptography',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'please enter your text and select the cipher you want to use',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: bodyTextColor.withOpacity(0.5)),
                                ),
                              ),
                              SizedBox(
                                height: context.height30 * 2,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Message',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              bodyTextColor.withOpacity(0.5)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: context.width30 * 6,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: bodyTextColor.withOpacity(0.5),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: TextFormField(
                                          controller:
                                              Provider.of<CipherController>(
                                                      context,
                                                      listen: false)
                                                  .message,
                                          maxLines: 5,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter your message';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter your message',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                              SizedBox(
                                height: context.height30,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Key',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              bodyTextColor.withOpacity(0.5)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: context.width30 * 6,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: bodyTextColor.withOpacity(0.5),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: TextFormField(
                                          controller:
                                              Provider.of<CipherController>(
                                                      context,
                                                      listen: false)
                                                  .key,
                                          maxLines: 2,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter your key';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter your key',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  MaterialButton(
                                      color: primaryColor,
                                      onPressed: () {
                                        if (Provider.of<CipherController>(
                                                context,
                                                listen: false)
                                            .formkey
                                            .currentState!
                                            .validate()) {
                                          Provider.of<CipherController>(context,
                                                  listen: false)
                                              .encrypt();
                                        }
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          'Encrypt',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                    width: context.width30,
                                  ),
                                  MaterialButton(
                                      color: primaryColor,
                                      onPressed: () {
                                        if (Provider.of<CipherController>(
                                                context,
                                                listen: false)
                                            .formkey
                                            .currentState!
                                            .validate()) {
                                          Provider.of<CipherController>(context,
                                                  listen: false)
                                              .decrypt();
                                        }
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          'Decrypt',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'result',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: bodyTextColor.withOpacity(0.5)),
                              ),
                              Container(
                                width: context.width30 * 6,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: bodyTextColor.withOpacity(0.5),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: TextFormField(
                                    readOnly: true,
                                    controller:
                                        Provider.of<CipherController>(context)
                                            .result,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Result',
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            if (Provider.of<CipherController>(
                                                    context,
                                                    listen: false)
                                                .result
                                                .text
                                                .isEmpty) {
                                            } else {
                                              Clipboard.setData(ClipboardData(
                                                  text: Provider.of<
                                                              CipherController>(
                                                          context,
                                                          listen: false)
                                                      .result
                                                      .text));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    '${Provider.of<CipherController>(context, listen: false).result.text} Copied to clipboard'),
                                              ));
                                            }
                                          },
                                          child: const Icon(
                                            Icons.copy,
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ))
              ],
            )
          : Center(
              child: SingleChildScrollView(
              child: Form(
                  key: Provider.of<CipherController>(context, listen: false)
                      .formkey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome to the world of cryptography',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'please enter your text and select the cipher you want to use',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: bodyTextColor.withOpacity(0.5)),
                          ),
                        ),
                        SizedBox(
                          height: context.height30 * 2,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Message',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: bodyTextColor.withOpacity(0.5)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: bodyTextColor.withOpacity(0.5),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: TextFormField(
                                    controller: Provider.of<CipherController>(
                                            context,
                                            listen: false)
                                        .message,
                                    maxLines: 5,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your message';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter your message',
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        SizedBox(
                          height: context.height30,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Key',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: bodyTextColor.withOpacity(0.5)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: bodyTextColor.withOpacity(0.5),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: TextFormField(
                                    textInputAction: TextInputAction.done,
                                    controller: Provider.of<CipherController>(
                                            context,
                                            listen: false)
                                        .key,
                                    maxLines: 2,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your key';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter your key',
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton(
                                color: primaryColor,
                                onPressed: () {
                                  if (Provider.of<CipherController>(context,
                                          listen: false)
                                      .formkey
                                      .currentState!
                                      .validate()) {
                                    Provider.of<CipherController>(context,
                                            listen: false)
                                        .encrypt();
                                  }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Encrypt',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                )),
                            SizedBox(
                              width: context.width30,
                            ),
                            MaterialButton(
                                color: primaryColor,
                                onPressed: () {
                                  if (Provider.of<CipherController>(context,
                                          listen: false)
                                      .formkey
                                      .currentState!
                                      .validate()) {
                                    Provider.of<CipherController>(context,
                                            listen: false)
                                        .decrypt();
                                  }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Decrypt',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'result',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: bodyTextColor.withOpacity(0.5)),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: bodyTextColor.withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextFormField(
                              readOnly: true,
                              maxLines: 5,
                              controller: Provider.of<CipherController>(context).result,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Result',
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      if (Provider.of<CipherController>(context,
                                              listen: false)
                                          .result
                                          .text
                                          .isEmpty) {
                                      } else {
                                        Clipboard.setData(ClipboardData(
                                            text: Provider.of<CipherController>(
                                                    context,
                                                    listen: false)
                                                .result
                                                .text));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              '${Provider.of<CipherController>(context, listen: false).result.text} Copied to clipboard'),
                                        ));
                                      }
                                    },
                                    child: const Icon(
                                      Icons.copy,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            )),
    );
  }
}
