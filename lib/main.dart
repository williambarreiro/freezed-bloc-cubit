import 'package:bloc_studies/features/contacts/list/contacts_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/contacts/list/bloc/contacts_list_bloc.dart';
import 'repositories/contacts_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ContactsRepository(),
      child: MaterialApp(
          title: 'Bloc & Freezed Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BlocProvider(
            create: (context) => ContactsListBloc(
              repository: context.read<ContactsRepository>(),
            )..add(const ContactsListEvent.findAll()),
            child: const ContactsListPage(),
          )),
    );
  }
}
