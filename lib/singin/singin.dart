import 'package:flutter/material.dart';

class SingIn extends StatelessWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Anmeldung", style: TextStyle(fontSize: 25, color: Colors.white),),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment .center,
          children: [
            Text("Anmeldung", style: TextStyle(fontSize: 40, color: Colors.blue),),
            SizedBox(height: 30,),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Benutzername oder Email"
              ),
            ),
            SizedBox(height: 8,),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Kennwort"
              ),
            ),
            Row(
              children: [
                TextButton(
                    onPressed: (){},
                    child: Container(
                      height: 30,
                      width: 110,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.symmetric(),
                        color: Colors.amber,
                      ),
                      child: Text("anmelden", style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 20)),
                    )
                ),
                TextButton(
                    onPressed: (){},
                    child: Container(
                      height: 30,
                      width: 140,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.symmetric(),
                        color: Colors.amber,
                      ),
                      child: Text("registrieren", style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 20)),
                    )
                ),
              ],
            ),
            TextButton(
                onPressed: (){},
                child: Text("Das Kennwort zurücksetzen", style: TextStyle(color: Colors.blueAccent, fontSize: 13),),
            ),
          ],
        ),
      )
    );
  }
}
