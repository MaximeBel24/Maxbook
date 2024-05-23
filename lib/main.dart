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
      body: maxBody()
    );
  }
}

AppBar maxAppBar() {
  return AppBar(
    title: const Text(
        "Maxbook",
      style: TextStyle(
        color: Colors.white
      ),
    ),
    backgroundColor: Colors.teal,
  );
}

Column maxBody() {
  return Column(
    children: [
      maxStack(),
      myName(),
      citation(),
      Padding(
          padding: const EdgeInsets.only(top:20),
          child: buttonRow(),
      ),
      const Divider(),
      


    ],
  );
}

Row buttonRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        height: 50,
        width: 350,
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
    "Si l'herbe est plus verte dans le jardin de ton voisin, laisse-le s'emmerder à la tondre.",
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
      const Padding(
          padding: EdgeInsets.only(top: 100),
        child: CircleAvatar(
          radius: 78,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 75,
            foregroundImage: AssetImage("images/moi.png"),
          ),
        ),
      )
    ],
  );
}
