import 'package:flutter/material.dart';

main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text(
            'Tarefas',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: opacidade ? 1 : 0,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const [
              Task("https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large","Andar de bike",1),
              Task("https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg","Aprender Flutter ate amanha de manah e depois de amanyha tb",5),
              Task("https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg","Meditar",3),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){setState(() {
          opacidade = !opacidade;
        });},child: Icon(Icons.remove_red_eye),),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String image;
  final int dificuldade;
  const Task(this.image,this.nome,this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.black,),
                color: Colors.blue
              ),
              color: null,
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black26,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                              widget.image,
                              fit: BoxFit.cover,
                              ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(fontSize: 24),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star,size: 15,color: widget.dificuldade >=1 ? Colors.blue : Colors.blue[100]),
                              Icon(Icons.star,size: 15,color: widget.dificuldade >=2 ? Colors.blue : Colors.blue[100]),
                              Icon(Icons.star,size: 15,color: widget.dificuldade >=3 ? Colors.blue : Colors.blue[100]),
                              Icon(Icons.star,size: 15,color: widget.dificuldade >=4 ? Colors.blue : Colors.blue[100]),
                              Icon(Icons.star,size: 15,color: widget.dificuldade >=5 ? Colors.blue : Colors.blue[100]),
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: 52,
                        height: 52,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(),
                            onPressed: () {
                              setState(() {
                                nivel++;
                                print(nivel);
                              });
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  "UP",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 200,
                          child: LinearProgressIndicator(
                            color: Colors.white,
                            value: widget.dificuldade > 0 ? (nivel/widget.dificuldade) / 10 : nivel/10,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nivel: $nivel',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
