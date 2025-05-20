import 'package:full_leads_v01/controllers/home_controller.dart';
import 'package:full_leads_v01/controllers/login_controller.dart';
import 'package:full_leads_v01/views/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());
  final LoginController authController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Full Leads',
          style: TextStyle(color: AppColor.blanco, fontWeight: FontWeight.w500),
        ),
        backgroundColor: AppColor.verde,
        leading: IconButton(
          icon: Icon(Icons.menu), // Icono de hamburguesa
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      endDrawer: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
          child: Drawer(
            semanticLabel: "Menu Principal",
            child: ListView(
              children: [
                TopMenuHeader(), // Widget constructor del header
                TopMenuItem(icon: Icon(Icons.group), text: "Elemento"),
                TopMenuItem(icon: Icon(Icons.group), text: "Elemento"),
                InkWell(
                  onTap: () {
                    authController.logout();
                  },
                  child: TopMenuItem(icon: Icon(Icons.group), text: "Logout"),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Opción 1'),
              onTap: () {
                // Manejar la selección de la opción 1
                Get.back();
              },
            ),
            ListTile(
              title: Text('Opción 2'),
              onTap: () {
                // Manejar la selección de la opción 2
                Get.back();
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: MobileScanner(
              controller: MobileScannerController(
                facing: CameraFacing.back,
                detectionSpeed: DetectionSpeed.normal,
                detectionTimeoutMs: 250,
              ),
              onDetect: (BarcodeCapture capture) {
                for (final barcode in capture.barcodes) {
                  final String? code = barcode.rawValue;
                  if (code != null) {
                    controller.handleQRCode(code);
                  }
                  break;
                }
              },
            ),
          ),

          // Overlay opcional (cuadro guía para escanear)
          Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.verde, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          // Texto de último código escaneado
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Obx(
              () => Center(
                child: Text(
                  "Último código: ${controller.lastScannedCode.value}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    backgroundColor: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.blanco,
        selectedItemColor: AppColor.verde,
        unselectedItemColor: AppColor.verde,
        elevation: 20,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configuración',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Salir',
          ),
        ],
      ),
    );
  }
}

class TopMenuItem extends StatelessWidget {
  const TopMenuItem({super.key, required this.icon, required this.text});

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 35, right: 15),
      height: 40,
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: icon,
        selected: false,
        title: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          // alignment: Alignment(-1,0),
          child: Text(text),
        ),
      ),
    );
  }
}

class TopMenuHeader extends StatelessWidget {
  const TopMenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 182, //Alto del header
      child: DrawerHeader(
        decoration: BoxDecoration(color: AppColor.verde),
        child: Column(
          children: [
            SizedBox(
              //searchbar
              height: 30,
              width: double.infinity,
              child: TextFormField(
                //searchbar
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search, color: AppColor.verde),
                  contentPadding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: AppColor.blanco,
                  filled: true,
                ),
              ),
            ),
            Divider(color: AppColor.blanco, thickness: 1, height: 35.0),
            ProfileName(),
            Divider(color: AppColor.blanco, thickness: 1, height: 35.0),
          ],
        ),
      ),
    );
  }
}

class ProfileName extends StatelessWidget {
  const ProfileName({super.key});
  final String _name = "Nombre";
  final String _mail = "email@mail.com";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/bla.png'),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 8, 2),
                child: Text(
                  _name, // nombre usuario
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColor.blanco,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 2, 8, 0),
                child: Text(
                  _mail, // mail usuario
                  textAlign: TextAlign.left,
                  style: TextStyle(color: AppColor.blanco),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
