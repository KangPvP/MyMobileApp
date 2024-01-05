import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_3/pages/veriftelpage.dart';
import 'package:flutter_app_3/utils/country_code_pick.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


int itemCount = 20;

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], 
              
              decoration: InputDecoration(  
                hintText: 'Phone Number',
                label: const Text('Ton numero'),
                border: const OutlineInputBorder(),
                prefixIcon: _countryCodeButton(context: context)
              ),
              maxLength: 10,
            ),
          ),
          
          ElevatedButton(
            child: const Text('Validé'), 
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context){ // Function for load the new page
                    return const VerifTelPage();
                  }
                ),
              );
            }, ),
        ],
      )
    );

    /*ListView.builder(
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        /*return ListTile(
          title: Text('Item ${(index + 1)}'),
          leading: Icon(Icons.person),
          trailing: const Icon(Icons.select_all),
          onTap: (){
            debugPrint('Item ${(index + 1)} selected');
          }
        );*/
      },
    );*/
  }

  Widget _countryCodeButton({required BuildContext context}){
    return Consumer(
      builder: (context, ref, _){
        final phoneCode = ref.watch(phoneCodeProvider);
        final countryCode = ref.watch(countryCodeProvider);
        final nameCountry = ref.watch(countryNameProvider);
        final flagEmoji = ref.watch(flagEmojiProvider);

        return TextButton(
          child: Text('$flagEmoji +$phoneCode'),
          onPressed: () => pickerCountryCode(context: context, onSelect: (code) {
            ref.read(phoneCodeProvider.notifier).update((state) => code.phoneCode);
            ref.read(countryNameProvider.notifier).update((state) => code.countryCode);
            ref.read(countryNameProvider.notifier).update((state) => code.name);
            ref.read(flagEmojiProvider.notifier).update((state) => countryCodeToEmoji(code.countryCode));
          })
        );
      }
    );
  }

}

String countryCodeToEmoji(String countryCode) {
  final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
  final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
  return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
}

final phoneCodeProvider = StateProvider.autoDispose<String>((ref) => '33');
final countryCodeProvider = StateProvider.autoDispose<String>((ref) => 'FR');
final countryNameProvider = StateProvider.autoDispose<String>((ref) => 'France');
final flagEmojiProvider = StateProvider.autoDispose<String>((ref) => countryCodeToEmoji('FR'));

