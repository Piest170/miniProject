import 'package:flutter/material.dart';
import 'package:mazerunner/main.dart';

//สร้างคลาส MazeResult เพื่อนำไปแสดงผลในหน้าจอ
class MazeResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.lightBlue, //เปลี่ยนพื้นหลังเป็นสีฟ้าอ่อน
      body: Route(), //เรียกคลาส Route มาแสดงผลใน MazeResult
    ));
  }
}

//สร้างคลาส Route ที่เอาไว้แสดงผลในหน้าจอหลัก
class Route extends StatefulWidget {
  const Route({Key? key}) : super(key: key);

  @override
  _RouteState createState() => _RouteState();
}

class _RouteState extends State<Route> {
  Record correctdata = Record(
      19, 12, 23, 14); //กำหนดค่าที่ถูกต้องใน Record เป็นรูปแบบ object ที่ชื่อว่า correctdata
  //กำหนดค่าตัวอักษร เป็นตัวแปร correct
  String correct =
      "Right, Up, Up, Up, Up, Right, Up, Up, Right, Up, Right, Down, Down, Left, Down, Right, Right, Right, Down, Down, Left, Up, Left, Down, Left, Left, Down, Right, Down, Right, Down, Right, Up, Right, Right, Right, Down, Down, Right, Right, Up, Left, Up, Right, Up, Up, Left, Up, Right, Up, Left, Up, Up, Left, Down, Left, Left, Left, Up, Right, Up, Right, Right, Right, Right, Down, Down, Right";

  @override
  Widget build(BuildContext context) {
    //จัดวิดเจทให้อยู่ตรงส่วนกลางของหน้าจอ
    return Center(
        //สร้างคอลัมน์อยู่ตรงส่วนกลางของวิดเจท
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
                    //สร้าง Text ที่ชื่อว่า Correct Route โดยมีขนาด 24 หน่วย และมีสีน้ำตาล
                    Text(
                      'Correct Route',
                      style: TextStyle(fontSize: 24, color: Colors.brown),
                      textAlign: TextAlign
                          .center, //จัด Text ให้อยู่ตรงกลางของคอนเทนเนอร์
                    ),
                    //สร้างกล่องขนาดความสูง 10 หน่วย ความกว้าง 20 หน่วย เพื่อมาคั่นกลางระหว่าง Text
                    SizedBox(
                      height: 10,
                      width: 20,
                    ),
                    //สร้าง Text โดยจะแสดงคำตอบที่ถูก มาเพิ่มเข้าไปในคอนเทนเนอร์ โดยมีขนาด 16 หน่วย และมีสีดำ
                    Text(correct,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        textAlign: TextAlign
                            .start //จัด Text ให้อยู่ที่จุดเริ่มต้นของคอนเทนเนอร์
                        ),
                  ],
                ))), 
                //สร้าง Text แสดง ค่าทั้งหมดใน object correctdata
                    Text(
                      '(Up,Left,Right,Down) : ${correctdata.up},${correctdata.left},${correctdata.right},${correctdata.down}',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      textAlign:
                          TextAlign.center, //จัดตำแหน่งของ Text ให้อยู่ตรงกลาง
                    ),
        //สร้างคอนเทนเนอร์ใหม่ในคอลัมน์
        Container(
          //เพิ่มกล่องที่สามารถตกแต่งได้โดยเปลี่ยนพื้นหลังกล่องเป็นสีแดง และมีขอบรัศมีแต่ละด้าน 5 หน่วย
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(5)),
          //เพิ่มปุ่มตัวอักษรในคอนเทนเนอร์ มีชื่อปุ่มว่า Start มีลักษณะเป็นตัวหนังสือสีขาวมีขนาด 20 หน่วย
          child: TextButton(
              child: Text('Main Page',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              //เมื่อกดปุ่มแล้วจะทำการเปลี่ยนหน้าแอพพลิเคชันไปยังหน้า MazeRunner
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MazeRunner()),
                ); //
              }),
        ),
      ],
    ));
  }
}
