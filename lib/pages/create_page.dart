import 'package:flutter/material.dart';
import 'package:flutter_provider/viewmodel/create_view_model.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatefulWidget {
  static final String id = 'create_page';

  const CreatePage({Key key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
CreateViewModel viewModel = CreateViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a new post'),
        backgroundColor: Colors.deepOrange,
      ),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: SingleChildScrollView(
          child: Consumer<CreateViewModel>(
            builder: (ctx, model, index) => Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Title
                      Container(
                        height: 75,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: TextField(
                            controller: viewModel.titleTextEditingController,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            decoration: const InputDecoration(labelText: 'Title',),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10,),

                      // Body
                      Container(
                        height: 470,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: viewModel.bodyTextEditingController,
                          style: const TextStyle(fontSize: 18),
                          maxLines: 1,
                          decoration: InputDecoration(labelText: 'Body', floatingLabelBehavior: FloatingLabelBehavior.always,),
                        ),
                      ),
                    ],
                  ),
                ),

                viewModel.isLoading ? Center(child: CircularProgressIndicator(),) : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        onPressed: () {
          viewModel.apiPostCreate(context);
        },
        child: Icon(Icons.file_upload),
      ),
    );
  }
}
