import 'package:flutter/material.dart';

class CardMusica extends StatelessWidget {
  const CardMusica({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4.0, 12.0, 4.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              blurRadius: 2.0,
              color: Colors.black,
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  'assets/wavekeeperlogo.jpg',
                  width: 120.0,
                  height: 120.0,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 4.0),
                        child: Text(
                          'Música1',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          'Data que vendeu a música',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 12.0,
                            color: Colors.black
                          ),
                        ),
                      ),
                      Text(
                        'Quem comprou',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 14.0,
                          color: Colors.black
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  // A lógica do que vai acontecer qnd clicar, contrato?
                },
                child: Icon(
                  Icons.text_snippet,
                  color: Colors.black,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}