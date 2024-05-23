import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Maxbook(),
    );
  }
}

class Maxbook extends StatelessWidget {
  const Maxbook({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: maxAppBar(),
      body: SingleChildScrollView(
        child: maxBody(),
      ),
      // body: maxBody(),


    );
  }
}

AppBar maxAppBar() {
  return AppBar(
    title: const Text(
        "Maxbook",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white
      ),
    ),
    backgroundColor: Colors.teal,
  );
}

Column maxBody() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      maxStack(),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          myName(),
        ],
      ),
      citation(),
      Padding(
          padding: const EdgeInsets.only(top:20),
          child: buttonRow(),
      ),
      const Divider(),
      titleSection(text: "A propos de moi :"),
      aboutMeHome(),
      aboutMeJob(),
      aboutMeLove(),
      const Divider(),
      titleSection(text: "Amis :"),
      friendsSection(),
      const Divider(),
      titleSection(text: "Mes publications :"),
      publication(image: "images/rome.jpg", description: "Une manifique photo du Vatican prise de nuit.", like: 36, comment: 12, time: 'Il y a 5 heures'),
      publication(image: "images/shibuya.jpg", description: "En plein coeur du quartier Shibuya à Tokyo.", like: 54, comment: 23, time: 'Il y a 3 semaines'),
      publication(image: "images/manhattan.jpg", description: "Vu sur les buildings dans la baie de Manhattan à New-York.", like: 47, comment: 19, time: 'Il y a 4 mois'),
      publication(image: "images/machu.jpg", description: "Randonnée dans le Machu Picchu au somment des monts du Pérou.", like: 65, comment: 31, time: 'Il y a 2 ans'),



    ],
  );
}

Row buttonRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        height: 50,
        width: 300,
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: const Text(
          "Modifier le profil",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      Container(
        height: 50,
        width: 50,
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: const Icon(
          Icons.edit_note,
          color: Colors.white,
          size: 28,
        ),
      )
    ],
  );
}

Text citation() {
  return const Text(
    "Si l'herbe est plus verte dans le jardin de ton voisin, laisse-le s'emmerder à la tondre",
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.grey,
      fontStyle: FontStyle.italic,
    ),
  );
}

Text myName() {
  return const Text(
    "Maxime Belin",
    style: TextStyle(
        fontSize: 25,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w700
    ),
  );
}

Stack maxStack() {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      Image.asset("images/colise.jpg",
        height: 200,
        fit: BoxFit.cover,
      ),
      Padding(
          padding: EdgeInsets.only(top: 100),
        child: CircleAvatar(
          radius: 78,
          backgroundColor: Colors.white,
          child: profilePicture(radius: 75),
        ),
      )
    ],
  );
}

CircleAvatar profilePicture({required double radius}) {
  return CircleAvatar(
    radius: radius,
    foregroundImage: AssetImage("images/moi.png"),
  );
}

Padding titleSection({required String text}) {
  return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800
        ),
      )
  );
}

Row aboutMeHome() {
  return Row(
    children: [
      const Icon(
          Icons.home,
      ),
      aboutMeText(text: "Noiseau, France"),
    ],
  );
}

Row aboutMeJob() {
  return Row(
    children: [
      const Icon(
          Icons.work,
      ),
      aboutMeText(text: "Apprenti développeur chez Amedia Solutions"),
    ],
  );
}

Row aboutMeLove() {
  return Row(
    children: [
      const Icon(
          Icons.favorite,
      ),
      aboutMeText(text: "Célibataire"),
    ],
  );
}

Text aboutMeText({required String text}) {
  return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500
      ),
  );
}

Row friendsSection(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      friend(image: "images/geralt.jpg" ,name: "Geralt de Riv"),
      friend(image: "images/tarnished.jpg" ,name: "Le sans éclat"),
      friend(image: "images/link.jpg" ,name: "Link"),
    ],
  );
}

Column friend({required String image, required String name}) {
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
            image,
          height: 150,
          width: 125,
        ),
      ),
      Text(name)
    ],
  );
}

Card publication({required String image,required String time, required String description, required int like, required int comment}) {
  return Card(
    color: Colors.white70,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  profilePicture(radius: 20),
                  const Text("   Maxime Belin")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(time),
            )
          ],
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset(image),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(description, textAlign: TextAlign.start,),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.favorite),
              Text("$like likes"),
              const Icon(Icons.chat),
              Text("$comment commentaires")
            ],
          ),
        )
      ],
    ),
  );
}