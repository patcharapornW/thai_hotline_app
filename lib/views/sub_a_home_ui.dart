import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SubAHomeUI extends StatefulWidget {
  const SubAHomeUI({super.key});

  @override
  State<SubAHomeUI> createState() => _SubAHomeUIState();
}

class _SubAHomeUIState extends State<SubAHomeUI> {
  //? เก็บที่อยู่รุปภาพในรูปแบบ List
  List<String> imageShow = [
    'assets/images/travelling01.png',
    'assets/images/travelling02.png',
    'assets/images/travelling03.png',
    'assets/images/travelling04.png',
    'assets/images/travelling05.png',
    'assets/images/travelling06.png',
    'assets/images/travelling07.png',
    'assets/images/travelling08.png',
    'assets/images/travelling09.png',
  ];
  //? เก็บข้อความในรูปแบบ List
  List<String> messageShow = [
    'ข้อมูลจราจร',
    'ตำรวจท่องเที่ยว',
    'ตำรวจทางหลวง',
    'ข้อมูลจราจร',
    'ขสมก.',
    'บขส.',
    'เส้นทางบนทางด่วน',
    'กรมทางหลวง',
    'การรถไฟแห่งประเทศไทย',
  ];
  //? เก็บเบอร์โทรในรูปแบบ List
  List<String> phoneShow = [
    '1146',
    '1155',
    '1193',
    '1197',
    '1348',
    '1490',
    '1543',
    '1586',
    '1690',
  ];
  //? func ที่เอาไว้โทรหาเบอร์ โดยรับ parameter เป็น phoneNumber
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Text(
              "สายด่วน\nการเดินทาง",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: imageShow.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _makePhoneCall(phoneShow[index]);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.02,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(imageShow[index]),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  messageShow[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  phoneShow[index],
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(FontAwesomeIcons.phone),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
