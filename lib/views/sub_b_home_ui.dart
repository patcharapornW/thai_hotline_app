import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SubBHomeUI extends StatefulWidget {
  const SubBHomeUI({super.key});

  @override
  State<SubBHomeUI> createState() => _SubBHomeUIState();
}

class _SubBHomeUIState extends State<SubBHomeUI> {
  //? เก็บที่อยู่รุปภาพในรูปแบบ List
  List<String> imageShow = [
    'assets/images/emergency01.png',
    'assets/images/emergency02.png',
    'assets/images/emergency03.png',
    'assets/images/emergency02.png',
    'assets/images/emergency04.png',
    'assets/images/emergency05.png',
    'assets/images/emergency06.png',
    'assets/images/emergency07.png',
    'assets/images/emergency08.png',
  ];
  //? เก็บข้อความในรูปแบบ List
  List<String> messageShow = [
    'เหตด่วนเหตุร้าย',
    'แจ้งไฟไหม้สัตว์เข้าบ้าน',
    'สายด่วนรถหาย',
    'อุบัติเหตุทางน้ำ',
    'แจ้งคนหาย',
    'ศูนย์ปลอดภัยคมนาคม',
    'หน่วยแพทย์กู้ชีพ',
    'ศูนย์เอราวัณ',
    'เจ็บป่วยฉุกเฉิน',
  ];
  //? เก็บเบอร์โทรในรูปแบบ List
  List<String> phoneShow = [
    '191',
    '199',
    '1192',
    '1196',
    '1300',
    '1356',
    '1554',
    '1646',
    '1669',
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
              "สายด่วน\nอุบัติเหตุ-เหตุฉุกเฉิน",
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
