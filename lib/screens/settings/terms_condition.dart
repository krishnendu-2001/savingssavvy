import 'package:flutter/material.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple[50],
            title: const Center(
              child: Text(
                "Terms & Conditions",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          body: ListView(
            children: const [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  'Savingssavy',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  """  
By using or downloading the app, you automatically agree to these terms. It is crucial that you carefully review them before utilizing the app. Prohibited actions include copying or modifying the app, any of its components, or our trademarks. You are not permitted to attempt to extract the app's source code, translate it into other languages, or create derivative versions. All rights to the app, including trademarks, copyrights, database rights, and other intellectual property rights, remain the property of Krishnendu Babu.

Krishnendu Babu is dedicated to optimizing the app's utility and efficiency. Consequently, we retain the right to modify the app or impose charges for its services at any time and for any reason. You will only be charged for the app or its services after a clear explanation of the associated costs.

The Savingssavvy app processes and stores personal data provided by you to deliver the service. It is your responsibility to secure your phone and app access. We advise against jailbreaking or rooting your phone, as it can expose your device to malware, viruses, and security risks, potentially causing the Savingssavvy app to malfunction.

The app utilizes third-party services, each with its own Terms and Conditions. You can find links to the Terms and Conditions of these third-party service providers in the app.
                """,
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ),
            ],
          )),
    );
  }
}
