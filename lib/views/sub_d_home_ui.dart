import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SubDHomeUI extends StatefulWidget {
  const SubDHomeUI({super.key});

  @override
  State<SubDHomeUI> createState() => _SubDHomeUIState();
}

class _SubDHomeUIState extends State<SubDHomeUI> {
  //? เก็บที่อยู่รุปภาพในรูปแบบ List
  List<String> imageShow = [
    'assets/images/utility02.png',
    'assets/images/utility01.png',
    'assets/images/utility03.png',
    'assets/images/utility04.png',
    'assets/images/utility05.png',
    'assets/images/utility06.png',
    'assets/images/utility09.png',
    'assets/images/utility07.png',
    'assets/images/utility08.png',
  ];
  //? เก็บข้อความในรูปแบบ List
  List<String> messageShow = [
    'ไฟฟ้านครหลวง',
    'ไฟฟ้าส่วนภูมิภาค',
    'ไฟฟ้าฝ่ายผลิต',
    'การประปานครหลวง',
    'การประปาส่วนภูมิภาค',
    'True',
    'Dtac',
    'AIS',
    'TOT',
  ];
  //? เก็บเบอร์โทรในรูปแบบ List
  List<String> phoneShow = [
    '1130',
    '1129',
    '1416',
    '1125',
    '1662',
    '1242',
    '1678',
    '1175',
    '1100',
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
              "สายด่วน\nสาธารณูปโภค",
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
