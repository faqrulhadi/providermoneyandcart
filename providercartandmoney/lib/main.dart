import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cartprovider.dart';
import 'moneyprovider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: Money(),),
            ChangeNotifierProvider.value(value: Cart(),),
          ],
          child: Scaffold(
            floatingActionButton: Consumer<Money>(
              builder:(context, money,_) => Consumer<Cart>(
                builder: (contex, cart, _) => FloatingActionButton( 
                  child: Icon(Icons.shopping_basket),
                  onPressed: (){
                    if(money.balance>=500)
                    {cart.quantity +=1;
                    money.balance -=500;}
                    return null;
                  }),
              ),
            ),
            appBar: AppBar(backgroundColor: Colors.amber,
              title: Text("MultiProvider")
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Balance"),
                      Container(
                        child: Align(
                          alignment: Alignment.centerRight,
                              child: Consumer<Money>(
                                builder:(context,money, _) => Text(money.balance.toString(),  
                                style: TextStyle(
                                  color: Colors.white, 
                                  fontWeight: FontWeight.w700),
                                  ),
                              ),
                        ),
                        width: 150,
                        height: 30,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          shape: BoxShape.rectangle, 
                          color: Colors.purple,
                          border: Border.all(color: Colors.black, width:2,)
                          ),
                      )
                    ],
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Consumer<Cart>( builder: (context, cart, _) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Apple (500) x " +cart.quantity.toString() , 
                                style: TextStyle(
                                  color: Colors.black, 
                                  fontWeight: FontWeight.w500),),

                                Text((500* cart.quantity).toString(), 
                                style: TextStyle(
                                  color: Colors.black, 
                                  fontWeight: FontWeight.w500),),
                              ],
                        ),
                      ),
                    ),
                   
                    height: 30,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle, 
                     borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width:2,)
                      ),
                  )
                ],
              ),
              
            ),
          ),
        
      ),
    );
  }
}
