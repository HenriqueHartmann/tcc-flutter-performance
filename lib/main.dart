import 'package:flutter/material.dart';
import 'package:tcc_performance_app/src/features/bloc/main_bloc.dart';
import 'package:tcc_performance_app/src/features/provider/main_provider.dart';
import 'package:tcc_performance_app/src/features/setState/main_setState.dart';
import 'package:tcc_performance_app/src/utils/common/widgets/app_bar_widget.dart';
import 'package:tcc_performance_app/src/utils/common/widgets/lib_selection_item.dart';
import 'package:tcc_performance_app/src/utils/data/item_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: {
        'setState': (_) => const MainSetState(),
        'provider': (_) => const MainProvider(),
        'bloc': (_) => const MainBloc(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final data = ItemClient.getData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Escolha uma biblioteca',),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: LibSelectionItem(
                      imageSrc:
                          'https://www.shihoriobata.com/wp-content/uploads/2020/12/daisy-phone-wallpaper-background2-576x1024.jpg',
                      title: 'SetState',
                      route: 'setState',
                      data: data,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: LibSelectionItem(
                      imageSrc:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfqYzstsYvq2OUkTbG7QXqWjs6Sd5f1OYFiEcXE6z92VMjFnfyLP_VQHGOk764btZhgqI&usqp=CAU',
                      title: 'Provider',
                      route: 'provider',
                      data: data,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: LibSelectionItem(
                      imageSrc:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLnVDA7fm4holbOOF70MM-KBsdT_1Y50VuB8t4reWmEMrbWYB1h3qNcLDP1zB79UJSgUM&usqp=CAU',
                      title: 'Bloc',
                      route: 'bloc',
                      data: data,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
