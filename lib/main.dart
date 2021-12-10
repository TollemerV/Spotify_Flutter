import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'music.dart';

bool selected = true;
int i = 0;
List<Music> myMusicList = [
Music("Ma grosse Chanson","Joe L'artiste Peintre","assets/image1.jpg","assets/music1.mp3","00:04:37"),
Music("Musique Libre de droit","Jardinho","assets/image2.jpg","assets/music2.mp3","00:03:04")
];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage> {
 @override
  final _player = AudioPlayer();
  void initState() {
    super.initState();
    _init(i);
  }

  Future<void> _init(int i) async {
    await _player
        .setAudioSource(AudioSource.uri(Uri.parse(myMusicList[i].urlSong)));
  }



  Widget build(BuildContext context) {
    
  String title_music = myMusicList[i].title;
  String title_artist = myMusicList[i].singer;
  String title_image = myMusicList[i].imagePath;
  String title_music_url = myMusicList[i].urlSong;
  String title_duree = myMusicList[i].duree;
    




 return SafeArea(
   child: Scaffold(
     backgroundColor:Colors.blueGrey[900],
     appBar: AppBar(
      title: const Text('YNOVIFY'),
      centerTitle: true,
      backgroundColor:Colors.black,
     ),
     body: ListView(children: [
     Center(
       heightFactor: 1,
       child: Image.network(title_image,width: 400,height: 400),
       ),
       Text(title_music,textAlign:TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 25)),
       Padding(padding: EdgeInsetsDirectional.only(top: 10),child : Text(title_artist,textAlign:TextAlign.center, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15))),
       Container(
         margin: EdgeInsets.only(top: 20),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
        children: [

           IconButton(onPressed: (){setState(() {
             if (i == 0){
             i++;
             }else{
               i--;
             }
             _init(i);
         });}, icon: const Icon(Icons.fast_rewind),color: Colors.white),

           IconButton(onPressed: (){setState(() {
             selected = !selected;
              if (selected){
                 _player.pause();
              }else{
                _player.play();
              }
         });}, icon: Icon(selected ? Icons.play_arrow :Icons.pause ,color: Colors.white)),

           IconButton(onPressed: (){setState(() {
             if( i==0){
             i++;
             }else{
               i--;
             }
            _init(i);
         });}, icon: const Icon(Icons.fast_forward),color: Colors.white),
         ],
         ),
       ),
       Padding(padding: EdgeInsetsDirectional.only(top: 20),child : Text(title_duree,textAlign:TextAlign.center, style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 15))),
      ]),
     )
  );
 }
}