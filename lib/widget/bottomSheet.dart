import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ElevatedButton(
        child: const Text("Modal Bottom Sheet"),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext){
              return SizedBox(
                height: 400,
                child: Center(
                  child: ElevatedButton(
                    child: const Text("close"),
                    onPressed: () {
                      Navigator.pop(context);
                    }, 
                    ), 
                  ),
              );
            },
          );
        },
      ),
    );
  }
}
