import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studio_projects/View/user_information_screen.dart';

class ComponentDesign extends StatefulWidget {
  const ComponentDesign({Key? key}) : super(key: key);

  @override
  State<ComponentDesign> createState() => _ComponentDesignState();
}

class _ComponentDesignState extends State<ComponentDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                children:[
                  Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width * .5,
                    color: Colors.white.withOpacity(0.4),
                  ),
                  Positioned(
                    top: 50,
                    child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width * .5,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16),topRight: Radius.circular(120)),
                      gradient: LinearGradient(colors: [
                        Color(0xffEDAEC0),
                        Color(0xffFFE4E1),
                      ])
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Text("Breakfast",style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                        ),),
                        const SizedBox(height: 20,),
                        const Text("Bread",style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400
                        ),),
                        const SizedBox(height: 5,),
                        const Text("Peanut Butter",style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400
                        ),),
                        const SizedBox(height: 5,),
                        const Text("Apple",style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400
                        ),),
                        const SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("525",style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.w600
                            ),),
                            SizedBox(width: 10,),
                            Text("kcal",style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600
                            ),),
                          ],
                        )
                      ],
                    ),
                ),
                  ),
                  Positioned(
                    top: 10,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.30,
                      decoration:  BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              'images/img.png',),
                          fit: BoxFit.contain

                        ),
                          color: Colors.white.withOpacity(0.4),
                        shape: BoxShape.circle,

                      ),
                    ),
                  ),
              ]
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserInformationScreen()));
              }, child: Text("Go To UserInfo Screen"))
            ],
          ),
        ),
      ),
    );
  }
}
