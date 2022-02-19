import 'package:flutter/material.dart';
import 'package:mazerunner/mazetheme.dart';

//เป็นตัวกลางที่นำไปใช้ในการทำงานแอพลิเคชันหลัก โดยตั้งหน้าหลักเป็น MazeRunner
void main() {
  runApp(MaterialApp(
    title: 'Maze Runner',
    home: MazeRunner(),
  ));
}

//สร้างคลาส MazeRunner ที่เอาไว้แสดงผลในหน้าจอหลัก
class MazeRunner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //เรียกตัววิดเจทจากคลาส เพื่อส่งไปยังตัวทำงานหลักของแอพลิเคชัน
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.lightBlue, //เปลี่ยนพื้นหลังเป็นสีฟ้าอ่อน
      //สร้างคอลัมน์ใหม่
      body: Column(
        mainAxisAlignment: MainAxisAlignment
            .spaceAround, //ทำให้วิดเจทแต่ละส่วนในคอลัมน์เว้นระยะห่างเท่าๆ กัน
        children: <Widget>[
          //สร้างคอนเทนเนอร์ไว้ในคอลัมน์
          Container(
            child: Image.asset(
                'images/maze-runner.png'), //เพิ่มรูปภาพที่เตรียมไว้จากไฟล์ images
            padding: EdgeInsets.all(
                20), //เพิ่มระยะห่างภายในระหว่างขอบคอนเทนเนอร์กับขอบรูปภาพทุกด้าน ด้านละ 20 หน่วย
            color: Colors.black, //เปลี่ยนพื้นหลังให้เป็นสีดำ
          ),
          //สร้างคอนเทนเนอร์ไว้ในคอลัมน์
          Container(
            child: Image.asset(
                'images/maze.png'), //เพิ่มรูปภาพที่เตรียมไว้จากไฟล์ images
            padding: EdgeInsets.all(
                20), //เพิ่มระยะห่างภายในระหว่างขอบคอนเทนเนอร์กับขอบรูปภาพทุกด้าน ด้านละ 20 หน่วย
          ),
          //สร้างคอนเทนเนอร์ไว้ในคอลัมน์
          Container(
            //เพิ่มกล่องที่สามารถตกแต่งได้โดยเปลี่ยนพื้นหลังกล่องเป็นสีแดง และมีขอบรัศมีแต่ละด้าน 5 หน่วย
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(5)),
            //เพิ่มปุ่มตัวอักษรในคอนเทนเนอร์ มีชื่อปุ่มว่า Start มีลักษณะเป็นตัวหนังสือสีขาวมีขนาด 20 หน่วย
            child: TextButton(
                child: Text('Start',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                //เมื่อกดปุ่มแล้วจะทำการเปลี่ยนหน้าแอพพลิเคชันไปยังหน้า MazeTheme
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MazeTheme()),
                  ); //
                }),
          ),
        ],
      ),
    ));
  }
}

//สร้างคลาส Record
class Record {
  int up;
  int left;
  int right;
  int down;
  //สร้าง object ที่ชื่อว่า Record
  Record(this.up, this.left, this.right, this.down) {
    this.up = up;
    this.left = left;
    this.right = right;
    this.down = down;
  }
}
