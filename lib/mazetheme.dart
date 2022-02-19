import 'package:flutter/material.dart';
import 'package:mazerunner/mazeresult.dart';
import 'package:mazerunner/main.dart';

//สร้างคลาส MazeTheme ที่นำไปแสดงผลในหน้าจอ
class MazeTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //เปลี่ยนพื้นหลังให้เป็นสีฟ้าอ่อน และเรียกคลาส Progress มาแสดงผลใน MazeTheme
        home: Scaffold(backgroundColor: Colors.lightBlue, body: Progress()));
  }
}

//สร้างคลาส Progress ที่เอาไว้ไปแสดงผลในหน้าจอหลัก ที่เปลี่ยนค่าที่แสดงผลระหว่างการทำงานของแอพลิเคชัน
class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  String route =
      "Right"; //กำหนดค่าตัวอักษร เป็นตัวแปร route ให้เท่ากับคำว่า Right
  //กำหนดค่าตัวอักษร เป็นตัวแปร correct
  String correct =
      "Right, Up, Up, Up, Up, Right, Up, Up, Right, Up, Right, Down, Down, Left, Down, Right, Right, Right, Down, Down, Left, Up, Left, Down, Left, Left, Down, Right, Down, Right, Down, Right, Up, Right, Right, Right, Down, Down, Right, Right, Up, Left, Up, Right, Up, Up, Left, Up, Right, Up, Left, Up, Up, Left, Down, Left, Left, Left, Up, Right, Up, Right, Right, Right, Right, Down, Down, Right";
  Record record =
      Record(0, 0, 1, 0); //กำหนดค่าเริ่มต้นเป็น object ที่ชื่อว่า record
  final correctdata = Record(19, 12, 23,
      14); //กำหนดค่าที่ถูกต้องเป็น object ที่ชื่อว่า correctdata เป็นตัวที่ไม่สามารถแก้ไขค่าใน object ได้
  int sumCorrect = 0,
      sumAnswer = 0; //กำหนดตัวแปรผลรวมของค่า sumAnswer และ sumCorrect เท่ากับ 0

  @override
  Widget build(BuildContext context) {
    //จัดวิดเจทให้อยู่ตรงส่วนกลางของหน้าจอ
    return Center(
      //สร้างคอลัมน์ในส่วนตรงกลางของวิดเจท
      child: Column(
        mainAxisAlignment: MainAxisAlignment
            .spaceAround, //จัดส่วนต่างๆ ในคอลัมน์ให้เว้นระยะห่างเท่าๆ กัน
        children: <Widget>[
          //สร้างคอนเทนเนอร์ในคอลัมน์
          Container(
            child: Image.asset(
                'images/maze-runner.png'), //เพิ่มรูปภาพที่เตรียมไว้จากไฟล์ images
            padding: EdgeInsets.all(
                20), //เพิ่มระยะห่างภายในระหว่างขอบคอนเทนเนอร์กับขอบรูปภาพทุกด้าน ด้านละ 20 หน่วย
            color: Colors.black, //เปลี่ยนพื้นหลังให้เป็นสีดำ
          ),
          //สร้างคอนเทนเนอร์ในคอลัมน์
          Container(
            //ทำวิดเจทให้สามารถซ้อนทับกันได้ เช่น นำไอคอนมาวางบนรูปภาพขนาดใหญ่
            child: Stack(
              children: <Widget>[
                Image.asset(
                    'images/maze.png'), //เพิ่มรูปภาพที่เตรียมไว้จากไฟล์ images
                //จัดตำแหน่งให้ได้ตามที่ต้องการ
                Positioned(
                  bottom: 60, //จัดตำแหน่งห่างจากข้างล่างของขอบรูปภาพ 60 หน่วย
                  //เรียกไอคอนลูกศรที่ชี้ไปทางขวาจาก flutter material
                  child: Icon(
                    Icons.arrow_right_alt_rounded,
                    color: Colors.deepOrange, //เปลี่ยนไอคอนลูกศรเป็นสีส้มเข้ม
                    size: 35, //เปลี่ยนขนาดไอคอนลูกศรเป็น 35 หน่วย
                  ),
                ),
                //จัดตำแหน่งให้ได้ตามที่ต้องการ
                Positioned(
                  top: 60, //จัดตำแหน่งห่างจากข้างบนของขอบรูปภาพ 60 หน่วย
                  right: 0, //จัดตำแหน่งห่างจากข้างขวาของขอบรูปภาพ 0 หน่วย
                  //เรียกไอคอนลูกศรที่ชี้ไปทางขวาจาก flutter material
                  child: Icon(
                    Icons.arrow_right_alt_rounded,
                    color: Colors.deepOrange, //เปลี่ยนไอคอนลูกศรเป็นสีส้มเข้ม
                    size: 35, //เปลี่ยนขนาดไอคอนลูกศรเป็น 35 หน่วย
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.all(
                20), //เพิ่มระยะห่างภายในระหว่างขอบคอนเทนเนอร์กับขอบรูปภาพทุกด้าน ด้านละ 20 หน่วย
          ),
          //สร้างคอนเทนเนอร์ในคอลัมน์
          Container(
              //สร้างแถวใหม่ไว้ในคอนเทนเนอร์
              child: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, //ทำให้วิดเจทในแถวบนสุดและล่างสุดชิดขอบ และเว้นระยะห่างเท่าๆ กันในแต่ละส่วนของคอนเทนเนอร์
            children: <Widget>[
              //สร้างคอนเทนเนอร์ใหม่ในแถว
              Container(
                  color: Colors.white, //เปลี่ยนพื้นหลังเป็นสีขาว
                  height: 300, //จัดคอนเทนเนอร์เป็นขนาดสูง 300 หน่วย
                  width: 300, //จัดคอนเทนเนอร์เป็นขนาดกว้าง 300 หน่วย
                  //สร้างคลาสที่เว้นระยะห่างจากขอบของคอนเทนเนอร์
                  child: Padding(
                      padding: EdgeInsets.all(
                          5), //เพิ่มระยะห่างภายในระหว่างขอบคอนเทนเนอร์กับวิดเจทที่อยู่ในคลาส Padding ทุกด้าน ด้านละ 5 หน่วย
                      //สร้างคอลัมน์ในคลาส Padding
                      child: Column(
                        children: <Widget>[
                          //สร้าง Text ที่ชื่อว่า Your Record Route โดยมีขนาด 24 หน่วย และมีสีน้ำตาล
                          Text('Your Record Route',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.brown),
                              textAlign: TextAlign
                                  .center //จัด Text ให้อยู่ตรงกลางของคอนเทนเนอร์
                              ),
                          //สร้างกล่องขนาดความสูง 10 หน่วย ความกว้าง 20 หน่วย เพื่อมาคั่นกลางระหว่าง Text
                          SizedBox(
                            height: 10,
                            width: 20,
                          ),
                          //สร้าง Text โดยการนำตัวแปร guide มาเพิ่มเข้าไปในคอนเทนเนอร์ โดยมีขนาด 16 หน่วย และมีสีดำ
                          Text(route,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                              textAlign: TextAlign
                                  .start //จัด Text ให้อยู่ที่จุดเริ่มต้นของคอนเทนเนอร์
                              ),
                        ],
                      ))),
              //สร้างคอลัมน์ใหม่ในแถวของคอนเทนเนอร์
              Column(
                children: <Widget>[
                  //สร้างคอนเทนเนอร์ใหม่ในคอลัมน์
                  Container(
                    margin: EdgeInsets.all(
                        5), //เพิ่มระยะห่างภายนอกระหว่างขอบคอนเทนเนอร์กับขอบรูปภาพทุกด้าน ด้านละ 5 หน่วย
                    //ตั้งค่ากล่องคอนเนอร์ให้เป็น สีม่วง และมีขอบรัศมีทุกด้าน ด้านละ 10 หน่วย
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10)),
                    //เพิ่มปุ่มตัวอักษร
                    child: TextButton(
                        //หลังจากกดปุ่มแล้ว จะเพิ่มคำว่า ", Up" ในตัวแปร route และเพิ่มค่า record.up ไป 1 ครั้ง
                        onPressed: () {
                          setState(() {
                            route = route + ", Up";
                            record.up = record.up + 1;
                            //ให้ sumCorrect เท่ากับ ค่าใน object ของ correctdata มารวมกัน
                            sumCorrect = correctdata.up +
                                correctdata.left +
                                correctdata.right +
                                correctdata.down;
                            //ให้ sumAnswer เท่ากับ ค่าใน object ของ record มารวมกัน
                            sumAnswer = record.up +
                                record.left +
                                record.right +
                                record.down;
                            //ตรวจสอบว่า sumAnswer มากกว่าหรือเท่ากับ sumCorrect หรือไม่ ถ้าใช่จะทำการแสดงข้อความแจ้งเตือน
                            if (sumAnswer >= sumCorrect) {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Notice !'),
                                  content: Text(
                                      'Your route is incorrect! \nThe Correct is "(Up,Left,Right,Down) = (${correctdata.up},${correctdata.left},${correctdata.right},${correctdata.down})"'),
                                  //การทำงานหลังจากกดปุ่ม
                                  actions: <Widget>[
                                    //กดปุ่ม Edit เพื่อรับทราบและปิดข้อความแจ้งเตือน
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Edit'),
                                      child: const Text('Edit'),
                                    ),
                                    //กดปุ่ม Next เพื่อไปยังหน้า MazeResult
                                    TextButton(
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MazeResult()),
                                      ),
                                      child: const Text('Next'),
                                    )
                                  ],
                                ),
                              );
                            }
                          });
                        },
                        //มี Text คำว่า Up อยู่ใน TextButton โดยตัวหนังสือมีสีขาว
                        child: Text('Up ${record.up}',
                            style: TextStyle(color: Colors.white))),
                  ),
                  //สร้างคอนเทนเนอร์ใหม่ในคอลัมน์
                  Container(
                    margin: EdgeInsets.all(
                        5), //เพิ่มระยะห่างภายนอกระหว่างขอบคอนเทนเนอร์กับขอบรูปภาพทุกด้าน ด้านละ 5 หน่วย
                    //ตั้งค่ากล่องคอนเนอร์ให้เป็น สีม่วง และมีขอบรัศมีทุกด้าน ด้านละ 10 หน่วย
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10)),
                    //เพิ่มปุ่มตัวอักษร
                    child: TextButton(
                        //หลังจากกดปุ่มแล้ว จะเพิ่มคำว่า ", Left" ในตัวแปร route และเพิ่มค่า record.left ไป 1 ครั้ง
                        onPressed: () {
                          setState(() {
                            route = route + ", Left";
                            record.left = record.left + 1;
                            //ให้ sumCorrect เท่ากับ ค่าใน object ของ correctdata มารวมกัน
                            sumCorrect = correctdata.up +
                                correctdata.left +
                                correctdata.right +
                                correctdata.down;
                            //ให้ sumAnswer เท่ากับ ค่าใน object ของ record มารวมกัน
                            sumAnswer = record.up +
                                record.left +
                                record.right +
                                record.down;
                            //ตรวจสอบว่า sumAnswer มากกว่า sumCorrect หรือไม่ ถ้าใช่จะทำการแสดงข้อความแจ้งเตือน
                            if (sumAnswer > sumCorrect) {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Notice !'),
                                  content: Text(
                                      'Your route is incorrect! \nThe Correct is "(Up,Left,Right,Down) = (${correctdata.up},${correctdata.left},${correctdata.right},${correctdata.down})"'),
                                  //การทำงานหลังจากกดปุ่ม
                                  actions: <Widget>[
                                    //กดปุ่ม Edit เพื่อรับทราบและปิดข้อความแจ้งเตือน
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Edit'),
                                      child: const Text('Edit'),
                                    ),
                                    //กดปุ่ม Next เพื่อไปยังหน้า MazeResult
                                    TextButton(
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MazeResult()),
                                      ),
                                      child: const Text('Next'),
                                    )
                                  ],
                                ),
                              );
                            }
                          });
                        },
                        //มี Text คำว่า Left อยู่ใน TextButton โดยตัวหนังสือมีสีขาว
                        child: Text('Left ${record.left}',
                            style: TextStyle(color: Colors.white))),
                  ),
                  //สร้างคอนเทนเนอร์ใหม่ในคอลัมน์
                  Container(
                    margin: EdgeInsets.all(
                        5), //เพิ่มระยะห่างภายนอกระหว่างขอบคอนเทนเนอร์กับขอบรูปภาพทุกด้าน ด้านละ 5 หน่วย
                    //ตั้งค่ากล่องคอนเนอร์ให้เป็น สีม่วง และมีขอบรัศมีทุกด้าน ด้านละ 10 หน่วย
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10)),
                    //เพิ่มปุ่มตัวอักษร
                    child: TextButton(
                        //หลังจากกดปุ่มแล้ว จะเพิ่มคำว่า ", Right" ในตัวแปร route และเพิ่มค่า record.right ไป 1 ครั้ง
                        onPressed: () {
                          setState(() {
                            route = route + ", Right";
                            record.right = record.right + 1;
                            //ให้ sumCorrect เท่ากับ ค่าใน object ของ correctdata มารวมกัน
                            sumCorrect = correctdata.up +
                                correctdata.left +
                                correctdata.right +
                                correctdata.down;
                            //ให้ sumAnswer เท่ากับ ค่าใน object ของ record มารวมกัน
                            sumAnswer = record.up +
                                record.left +
                                record.right +
                                record.down;
                            //ตรวจสอบว่า sumAnswer มากกว่า sumCorrect หรือไม่ ถ้าใช่จะทำการแสดงข้อความแจ้งเตือน
                            if (sumAnswer > sumCorrect) {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Notice !'),
                                  content: Text(
                                      'Your route is incorrect! \nThe Correct is "(Up,Left,Right,Down) = (${correctdata.up},${correctdata.left},${correctdata.right},${correctdata.down})"'),
                                  //การทำงานหลังจากกดปุ่ม
                                  actions: <Widget>[
                                    //กดปุ่ม Edit เพื่อรับทราบและปิดข้อความแจ้งเตือน
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Edit'),
                                      child: const Text('Edit'),
                                    ),
                                    //กดปุ่ม Next เพื่อไปยังหน้า MazeResult
                                    TextButton(
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MazeResult()),
                                      ),
                                      child: const Text('Next'),
                                    )
                                  ],
                                ),
                              );
                            }
                          });
                        },
                        //มี Text คำว่า Right อยู่ใน TextButton โดยตัวหนังสือมีสีขาว
                        child: Text('Right ${record.right}',
                            style: TextStyle(color: Colors.white))),
                  ),
                  //สร้างคอนเทนเนอร์ใหม่ในคอลัมน์
                  Container(
                      margin: EdgeInsets.all(
                          5), //เพิ่มระยะห่างภายนอกระหว่างขอบคอนเทนเนอร์กับขอบรูปภาพทุกด้าน ด้านละ 5 หน่วย
                      //ตั้งค่ากล่องคอนเนอร์ให้เป็น สีม่วง และมีขอบรัศมีทุกด้าน ด้านละ 10 หน่วย
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10)),
                      //เพิ่มปุ่มตัวอักษร
                      child: TextButton(
                          //หลังจากกดปุ่มแล้ว จะเพิ่มคำว่า ", Down" ในตัวแปร route และเพิ่มค่า record.down ไป 1 ครั้ง
                          onPressed: () {
                            setState(() {
                              route = route + ", Down";
                              record.down = record.down + 1;
                              //ให้ sumCorrect เท่ากับ ค่าใน object ของ correctdata มารวมกัน
                              sumCorrect = correctdata.up +
                                  correctdata.left +
                                  correctdata.right +
                                  correctdata.down;
                              //ให้ sumAnswer เท่ากับ ค่าใน object ของ record มารวมกัน
                              sumAnswer = record.up +
                                  record.left +
                                  record.right +
                                  record.down;
                              //ตรวจสอบว่า sumAnswer มากกว่า sumCorrect หรือไม่ ถ้าใช่จะทำการแสดงข้อความแจ้งเตือน
                              if (sumAnswer > sumCorrect) {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Notice !'),
                                    content: Text(
                                        'Your route is incorrect! \nThe Correct is "(Up,Left,Right,Down) = (${correctdata.up},${correctdata.left},${correctdata.right},${correctdata.down})"'),
                                    //การทำงานหลังจากกดปุ่ม
                                    actions: <Widget>[
                                      //กดปุ่ม Edit เพื่อรับทราบและปิดข้อความแจ้งเตือน
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Edit'),
                                        child: const Text('Edit'),
                                      ),
                                      //กดปุ่ม Next เพื่อไปยังหน้า MazeResult
                                      TextButton(
                                        onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MazeResult()),
                                        ),
                                        child: const Text('Next'),
                                      )
                                    ],
                                  ),
                                );
                              }
                            });
                          },
                          //มี Text คำว่า Down อยู่ใน TextButton โดยตัวหนังสือมีสีขาว
                          child: Text('Down ${record.down}',
                              style: TextStyle(color: Colors.white)))),
                ],
              )
            ],
          )),
          //สร้างแถวใหม่ในคอลัมน์ชุดแรก
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //จัดวิดเจตในแถวให้อยู่ตรงกลาง
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(
                      5), //เพิ่มระยะห่างภายนอกระหว่างขอบคอนเทนเนอร์กับขอบรูปภาพทุกด้าน ด้านละ 5 หน่วย
                  //ตั้งค่ากล่องคอนเนอร์ให้เป็น สีแดง และมีขอบรัศมีทุกด้าน ด้านละ 10 หน่วย
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  //เพิ่มปุ่มตัวอักษร
                  child: TextButton(
                      //เมื่อกดปุ่มแล้วจะทำการเซ็ตค่า route = "Right" และ record.up,record.left,record.down = 0 record.right = 1
                      onPressed: () {
                        setState(() {
                          route = "Right";
                          record.up = 0;
                          record.left = 0;
                          record.right = 1;
                          record.down = 0;
                        });
                      },
                      //มี Text คำว่า Reset อยู่ใน TextButton มีตัวหนังสือสีขาวขนาด 20 หน่วย
                      child: Text('Reset',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20)))),
              //สร้างกล่องขนาดความกว้าง 10 หน่วย และความยาว 10 หน่วย เพื่อเว้นระยะห่างระหว่างคอนเทนเนอร์
              SizedBox(
                height: 10,
                width: 10,
              ),
              //สร้างคอนเทนเนอร์ในแถว
              Container(
                  margin: EdgeInsets.all(
                      5), //เพิ่มระยะห่างภายนอกระหว่างขอบคอนเทนเนอร์กับขอบรูปภาพทุกด้าน ด้านละ 5 หน่วย
                  //ตั้งค่ากล่องคอนเนอร์ให้เป็น สีเขียว และมีขอบรัศมีทุกด้าน ด้านละ 10 หน่วย
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  //เพิ่มปุ่มตัวอักษร
                  child: TextButton(
                      //เมื่อกดปุ่มแล้วจะทำการเช็คว่าได้ใส่ข้อมูลอะไรไปบ้างหรือไม่
                      onPressed: () {
                        //ให้ sumCorrect เท่ากับ ค่าใน object ของ correctdata มารวมกัน
                        sumCorrect = correctdata.up +
                            correctdata.left +
                            correctdata.right +
                            correctdata.down;
                        //ให้ sumAnswer เท่ากับ ค่าใน object ของ record มารวมกัน
                        sumAnswer = record.up +
                            record.left +
                            record.right +
                            record.down;
                        //ถ้ามีการใส่ข้อมูลแล้วจะทำการเช็คเงื่อนไขถัดไป
                        if (route != "Right") {
                          //เมื่อค่า route ไม่เท่ากับ ค่า correct หรือ sumAnswer มากกว่า sumCorrect จะทำการแสดงข้อความแจ้งเตือนว่าไม่ถูกต้อง
                          if ((route != correct) || (sumAnswer > sumCorrect)) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Notice !'),
                                content: Text(
                                    'Your route is incorrect! \nThe Correct is "(Up,Left,Right,Down) = (${correctdata.up},${correctdata.left},${correctdata.right},${correctdata.down})"'),
                                //การทำงานหลังจากกดปุ่ม
                                actions: <Widget>[
                                  //กดปุ่ม Edit เพื่อรับทราบและปิดข้อความแจ้งเตือน
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Edit'),
                                    child: const Text('Edit'),
                                  ),
                                  //กดปุ่ม Next เพื่อไปยังหน้า MazeResult
                                  TextButton(
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MazeResult()),
                                    ),
                                    child: const Text('Next'),
                                  )
                                ],
                              ),
                            );
                            //ถ้าคำตอบที่เราใส่มาถูกต้อง จะมีหน้าต่างแจ้งเตือนว่า ถูกต้อง
                          } else {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Notice !'),
                                content: const Text('Your route is correct!'),
                                //การทำงานหลังจากกดปุ่ม
                                actions: <Widget>[
                                  //หลังจาก OK จะทำการปิดข้อความแจ้งเตือน และจะแสดงหน้า MazeResult
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MazeResult()),
                                      );
                                    },
                                    child: const Text('OK'),
                                  )
                                ],
                              ),
                            );
                          }
                          //ถ้าไม่มีการใส่ข้อมูลจะมีข้อความเตือนขึ้นมาบนหน้าจอ ว่าคุณไม่ได้ใส่คำตอบ
                        } else {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Notice !'),
                              content: const Text(
                                  'You don\'t have any progress.\nPlease try again.'),
                              //การทำงานหลังจากกดปุ่ม
                              actions: <Widget>[
                                //กดปุ่ม OK เพื่อรับทราบและปิดข้อความแจ้งเตือน
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                )
                              ],
                            ),
                          );
                        }
                      },
                      //มี Text คำว่า Finish อยู่ใน TextButton มีตัวหนังสือสีขาวขนาด 20 หน่วย
                      child: Text('Finish',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20)))),
            ],
          ),
        ],
      ),
    );
  }
}
