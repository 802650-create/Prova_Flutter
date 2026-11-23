import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServico {
FirebaseAuth auth = FirebaseAuth.instance;

    Future<bool> signInWithEmailPassword(String email, String password) async {
                    try {
                      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
                      return true; 
                      
                    } on FirebaseAuthException catch (e) { return false; }
                  }

     Future<bool> createUserWithEmailPassword(String email, String password) async {
          try {
          UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
            return true;
    } on FirebaseAuthException catch (e) { return false; }
}

}