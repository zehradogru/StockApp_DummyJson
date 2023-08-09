import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;


class UserDetailPage extends StatelessWidget {
  final Users user;

  const UserDetailPage({super.key, required this.user});



  Future<String> delete (BuildContext context) async {
    final String url = "https://dummyjson.com/products/${user.id}";
    final res = await http.delete(Uri.parse(url));

    if (res.statusCode == 200) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);

      print('Deleted');
    }
    else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Couldnt deleted'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    return '';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //title: Text('${user.firstName} ${user.lastName}'),
        backgroundColor: Colors.purple,
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          delete(context);
        },
        backgroundColor: Colors.black87,
        child: const Icon(Icons.delete),
      ),


      body: ListView(children: [

        Container(
          color: Colors.purple,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(user.image ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 25),



              Container(
               /* decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),*/

                child: Column(
                  children: [

                    Text(
                      '${user.firstName ?? 'No Name'} ${user.lastName ?? 'No LastName'} ',
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),

                  ],
                ),
              ),


            ],

          ),
        ),


        //const SizedBox(height: 50),


        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.purple[50],
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    'Personal Info:',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),

                ),

                const SizedBox(height: 10),

                Text(
                    'MaidenName: ${user.maidenName ?? 'No maidenName'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),

                ),

                const SizedBox(height: 10),


                Text(
                    'Age: ${user.age ?? 'No age'}',
                  style: const TextStyle(
                  fontSize: 20,
                ),

                ),

                const SizedBox(height: 10),


                Text(
                    'Gender: ${user.gender ?? 'No Gender'}',
                  style: const TextStyle(
                  fontSize: 20,
                ),


                ),
                const SizedBox(height: 10),


                Text(
                    'Email: ${user.email ?? 'No email'}',
                  style: const TextStyle(
                  fontSize: 20,
                ),

                ),
                const SizedBox(height: 10),

                Text(
                    'Phone: ${user.phone ?? 'No phone'}',
                  style: const TextStyle(
                  fontSize: 20,
                ),
                ),
                const SizedBox(height: 10),

                Text(
                    'birthDate: ${user.birthDate ?? 'No birthDate'}',
                  style: const TextStyle(
                  fontSize: 20,
                ),


                ),
                const SizedBox(height: 10),

                Text(
                    'bloodGroup: ${user.bloodGroup ?? 'No bloodGroup'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'height: ${user.height ?? 'No height'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'weight: ${user.weight ?? 'No weight'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'eyeColor: ${user.eyeColor ?? 'No eyeColor'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'hair color: ${user.hair?.color ?? 'No color'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'hair type: ${user.hair?.type ?? 'No type'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),

              ],

            ),
          ),





        ),


        const SizedBox(width: 5),


        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.purple[50],
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(0),
            ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'username: ${user.username ?? 'No username'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'password: ${user.password ?? 'No password'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(

                    'domain: ${user.domain ?? 'No domain'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'ip: ${user.ip ?? 'No ip'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'address: ${user.address ?? 'No address'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'city: ${user.address?.city ?? 'No city'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'coordinates: ${user.address?.coordinates ?? 'No coordinates'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'postalCode: ${user.address?.postalCode ?? 'No postalCode'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'state: ${user.address?.state ?? 'No state'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'lat: ${user.address?.coordinates?.lat ?? 'No lat'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),

                const SizedBox(height: 10),

                Text(
                    'lng: ${user.address?.coordinates?.lng ?? 'No lng'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),

                const SizedBox(height: 10),

                Text(
                    'macAddress: ${user.macAddress ?? 'No macAddress'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),

                const SizedBox(height: 10),

                Text(
                    'bank: ${user.bank ?? 'No bank'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),

                const SizedBox(height: 10),

                Text(
                    'cardExpire: ${user.bank?.cardExpire ?? 'No cardExpire'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),

                const SizedBox(height: 10),

                Text(
                    'cardNumber: ${user.bank?.cardNumber ?? 'No cardNumber'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),

                const SizedBox(height: 10),

                Text(
                    'cardType: ${user.bank?.cardType ?? 'No cardType'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'currency: ${user.bank?.currency ?? 'No currency'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),

                const SizedBox(height: 10),

                Text(
                    'iban: ${user.bank?.iban ?? 'No iban'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),


                Text(
                    'company address: ${user.company?.address ?? 'No address'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'department: ${user.company?.department ?? 'No department'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'company name: ${user.company?.name ?? 'No name'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'company title: ${user.company?.title ?? 'No title'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'ein: ${user.ein ?? 'No ein'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'ssn: ${user.ssn ?? 'No ssn'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),
                const SizedBox(height: 10),

                Text(
                    'userAgent: ${user.userAgent ?? 'No userAgent'}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),



                ),




              ],
            ),
          )
        )



















      ]),
    );
  }
}
