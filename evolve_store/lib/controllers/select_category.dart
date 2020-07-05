import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class SelectCategory extends ChangeNotifier{

  var products = Firestore.instance.collection('products').reference();
}