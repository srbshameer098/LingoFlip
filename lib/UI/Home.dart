import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translater/Bloc/LanguageBloc/language_bloc.dart';
import 'package:translater/Bloc/TranslateBloc/translate_bloc.dart';
import '../../Repository/ModalClass/LanguageModel.dart';

import 'package:translater/Repository/ModalClass/TranslateModel.dart';
import 'package:translater/Repository/ModalClass/TranslateModel.dart';
import 'package:translater/Repository/ModalClass/TranslateModel.dart';

import '../Repository/ModalClass/LanguageModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

late TranslateModel data;

late List<LanguageModel> data1;
String dropdownvalue='';
TextEditingController message = TextEditingController();

class _HomeState extends State<Home> {
  @override
  void initState() {
    BlocProvider.of<LanguageBloc>(context).add(FetchLanguage());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff003366),
        leading: Icon(
          Icons.menu_outlined,
          color: Colors.white,
        ),
        title: Center(
            child: Text(
          'Language Translater',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 320,
                height: 47,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: Color(0x0c6750a4)),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 40.w,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 90.w,
                        child: Center(
                          child: Text("English",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Icon(Icons.swap_horiz_outlined),
                      SizedBox(
                        width: 20.w,
                      ),
                      BlocBuilder<LanguageBloc, LanguageState>(
                          builder: (context, state) {
                        if (state is LanguageblocLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is LanguageblocError) {
                          return Center(child: Text("ERROR"));
                        }
                        if (state is LanguageblocLoaded) {
                          data1 = BlocProvider.of<LanguageBloc>(context)
                              .languageModel;
                          return DropdownButton(
                            hint: Text("Language"),
                            value: dropdownvalue,
                            items: data1.map<DropdownMenuItem<String>>(
                                (LanguageModel item) {

                              // print(item.language);
                              return DropdownMenuItem<String>(
                                value: item.code,

                                // Assuming 'code' is a unique identifier
                                child: SizedBox(
                                  width: 90.w,
                                  child: Center(child: Text(item.language)),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                              print(dropdownvalue);
                            },
                          );
                        } else {
                          return SizedBox();
                        }
                      }),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 320,
                height: 216,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0x0c6750a4)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "English",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 9.w,
                          ),
                          Icon(
                            Icons.volume_down_sharp,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                            width: 175.w,
                          ),
                          Icon(Icons.close)
                        ],
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      SizedBox(
                        width: 300.w,
                        height: 80.h,
                        child: TextFormField(
                          controller: message,
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              hintText: "Hello how are you ?"),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 24.r,
                            backgroundColor: Color(0xff003366),
                            child: Icon(
                              Icons.mic,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 152.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              print(message.text);
                              print(dropdownvalue);
                              BlocProvider.of<TranslateBloc>(context).add(
                                  FetchTranslate(
                                      message: message.text,
                                      code: dropdownvalue));
                            },
                            child: Container(
                              width: 90.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Color(0xffFF6600)),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 14.w, right: 14.w, top: 10.h),
                                child: Text("Translate",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              Container(
                width: 320,
                height: 216,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0x0c6750a4)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dropdownvalue,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 9.w,
                          ),
                          Icon(
                            Icons.volume_down_sharp,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                            width: 175.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      BlocBuilder<TranslateBloc, TranslateState>(
                        builder: (context, state) {
                          if (state is TranslateblocLoading) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (state is TranslateblocError) {
                            return Center(
                              child: Text("ERROR"),
                            );
                          }
                          if (state is TranslateblocLoaded) {
                            data = BlocProvider.of<TranslateBloc>(context)
                                .translateModel;

                            return Text(data.trans.toString(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ));
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      SizedBox(
                        height: 76.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 195.w,
                          ),
                          Icon(
                            Icons.copy,
                            color: Color(0xff003366),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Icon(
                            Icons.ios_share_outlined,
                            color: Color(0xff003366),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Icon(Icons.star_border_outlined,
                              color: Color(0xff003366)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
