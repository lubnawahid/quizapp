import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/questionmodel.dart';

class quizapp extends StatefulWidget {
  const quizapp({Key? key}) : super(key: key);

  @override
  State<quizapp> createState() => _quizappState();
}

class _quizappState extends State<quizapp> {
  List question = [
  QuestionModel(question:"1.A baby has more bones than an adult ",answer:true),
  QuestionModel(question:"2.A shark can blink its eyes",answer:true),
  QuestionModel(question:"3.The U S dollars are made from fiber",answer:false),
  QuestionModel(question:"4.Sandwich is named after a person",answer:true),
  QuestionModel(question: "5.the great wall of china is visible from space", answer: false),
  QuestionModel(question: "6.Harry Edward Styles was born on February 1, 1994", answer: true),
    QuestionModel(question: "7.it's one of the biggest bones in your forearm", answer: false),
    QuestionModel(question: "8.Skylar Malfoy is his younger sister", answer: false),
    QuestionModel(question: "9.The atomic number for lithium is 17", answer: false),
    QuestionModel(question: "10.Alliumphobia is a fear of garlic", answer: true),
  ];
  List<IconData>icon = [];
int qnum = 0;
int count = 0;
int count1 = 0;

  String getQuestion(){
    return question[qnum].question;

  }
bool getAnswer(){
    return question[qnum].answer;
}
void getnextquestion(){
if(qnum< question!.length){
  qnum++;
}
}
void clearQn(){
    count=0;
    count1=0;
    qnum=0;
    icon=[];

}
bool finshQn(){
    if(qnum>=question!.length - 1) {
      return true;
    }
    else
      return false;
    }
    void answerQn(bool answer){
    bool getanswer = getAnswer();
    setState(() {
      if (getanswer == answer){
        icon.add(Icons.check);
        count ++;
      }
      else{
        icon.add(Icons.close);
        count1++;
      }
      if(count>= 4){
        openalert();
        clearQn();
        icon=[];
      }
      else if(count1 >= 4){
        failalert();
        clearQn();
        icon=[];
      }
      else{
        getnextquestion();
      }
    });

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 240),
        child: Text(
              getQuestion(),
               textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.w600),
               ),
            ),

            ElevatedButton(
              onPressed: () {
setState(() {
  answerQn(true);
});
              },
              child: Text(
                'True',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                fixedSize: Size(350, 55),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
setState(() {
  answerQn(false);
});
              },
              child: Text(
                'False',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                fixedSize: Size(350, 55),
              ),
            ),
            SizedBox(height: 20,),
          Padding( padding:const EdgeInsets.only(left: 12,right:12 ),
              child: Row(
                children: [
                  for(var iconData in icon)
                    Icon(iconData,color:Colors.green[800],size: 35),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
void openalert(){
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text("Congratz",style: TextStyle(fontWeight: FontWeight.bold),),
      content: Text("You answered  4 questions correctly"),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        },
        child: Text("OK",style: TextStyle(fontSize: 20),),)
      ],
    ),);
}

  void failalert(){
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text("Oops",style: TextStyle(fontWeight: FontWeight.bold),),
      content: Text("You answered 4 questions wrongly"),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        },
          child: Text("OK",style: TextStyle(fontSize: 20),),)
      ],
    ),);
  }



}