/*
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutte_app/models/exec.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenficationServices
{
  final FirebaseAuth auth=FirebaseAuth.instance;
  final BuildContext context;
  final CollectionReference couturier=FirebaseFirestore.instance.collection("couturiers");
  AuthenficationServices(this.context);
  Future signWithEmailAndPassword(AppUser appUser,String email,String password, String id)async
  {

    try{
      UserCredential userCredential= await auth.signInWithEmailAndPassword(email: email, password: password);
      User user=userCredential.user;
      if(id.length==0)
      {
        DbCoutureManager manager=new DbCoutureManager();
        manager.insertCouture(new AppUser(id: user.uid,infos: appUser.infos,description: appUser.description,photo: appUser.photo,connecte: true),);

      }
      return user.uid;
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'user-disabled')
      {

        showSnackBar("Votre compte est désactive, contactez admin");
      } else if (e.code == 'user-not-found') {
        showSnackBar("Compte inexistant");
      } else if (e.code == 'invalid-email')
      {
        showSnackBar("Email invalide");
      } else if (e.code == 'wrong-password') {
        showSnackBar("Mot de passe incorrect");
      }
    } on SocketException catch (_) {
      showSnackBar("Veuillez vous connecter à internet");
    } catch (e) {
      showSnackBar("Erreur inconnue...Veuillez réessayer !");
      return null;
    }
    // catch(exception)
    // {
    //   return null;
    // }
  }
  Future change_user_email(String email,String new_email, String password,)
  async{
    DbCoutureManager manager1=new DbCoutureManager();
    DbClientManager manager2=new DbClientManager();
    DbCommandeManager manager3=new DbCommandeManager();
    DbExecManager manager4=new DbExecManager();
    DbChargesManager manager5=new DbChargesManager();
    DbModelManager manager6=new DbModelManager();
    try
    {
      UserCredential userCredential= await auth.signInWithEmailAndPassword(email: email,
          password: password);
      await userCredential.user.updateEmail(new_email);
      await manager1.delete_all_table();
      await manager2.delete_all_table();
      await manager3.delete_all_table();
      await manager4.delete_all_table();
      await manager5.delete_all_table();
      await manager6.delete_all_table();
      User user=userCredential.user;
      manager1.insertCouture(new AppUser(id: user.uid,infos:"",description:"",photo:"",connecte: true),);
      return user.uid;
    }
    catch(e)
    {
      return null;
    }
  }
  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
  AppUser appuserformfire( User user)
  {
    return user!=null? AppUser(id: user.uid):null;
  }
  Stream<AppUser> get users
  {
    return auth.authStateChanges().map((event) => appuserformfire(event));
  }
  Stream<String> get user
  {
    return auth.authStateChanges().map((event)
    {
      return event==null?null:event.uid;
    });
  }
  Future inscription(AppUser appUser,String email,String password, String id)
  async
  {
    try{
      UserCredential userCredential=await auth.createUserWithEmailAndPassword(email: email, password: password);
      User user=userCredential.user;
      bool succes = await DataCoutureServices(id: user.uid).enregistrement(appUser);
      if(id.length==0 && succes)
      {
        appUser.connecte=true;
        appUser.mjr=DateTime.now().toString();
        DbCoutureManager manager=new DbCoutureManager();
        manager.insertCouture(new AppUser(id: user.uid,infos: appUser.infos,description: appUser.description,photo: appUser.photo,connecte:appUser.connecte,mjr: appUser.mjr));

      }
      // await DataCoutureServices(id: user.uid).enregistrement(infos,photo);
      return user;
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar("Mot de passe facile à deviner");
      }
      else if (e.code == 'email-already-in-use') {
        showSnackBar("Email déjà en cours d'utilisation");
      } else if (e.code == 'invalid-email') {
        showSnackBar("Email invalide");
      }
    }
    on SocketException catch (_) {
      showSnackBar("Veuillez vous connecter à internet");
    } catch (e) {
      showSnackBar("Erreur inconnue...Veuillez réessayer !");
      return null;}
    // catch(exception)
    // {
    //   return null;
    // }
  }
  Future  fetchotp(String phone) async
  {
    await auth.verifyPhoneNumber(phoneNumber:phone,
        verificationCompleted:(PhoneAuthCredential credential) async
        {
          await auth.signInWithCredential(credential);

        },
        verificationFailed: (FirebaseAuthException e)
        {
          if(e.code=='invalid-phone-number')
            showSnackBar('Numero invalid');
        }, codeSent: (String verificationid,int resendToken)
        async
        {

        },
        codeAutoRetrievalTimeout:(String verificationid){});
  }
  Future signwithphone(PhoneAuthCredential phoneAuthCredential)
  async{
    try{
      final authuser= await auth.signInWithCredential(phoneAuthCredential);
      return authuser.user;
    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar("Mot de passe facile à deviner");
      }
      else if (e.code == 'email-already-in-use') {
        showSnackBar("Numéro déjà en cours d'utilisation");
      } else if (e.code == 'invalid-email') {
        showSnackBar("Email invalide");
      }
    }on SocketException catch (_) {
      showSnackBar("Veuillez vous connecter à internet");
    }catch (e) {
      showSnackBar("Erreur inconnue...Veuillez réessayer !");
      return null;}
  }

  Future passwordReset(String email)
  async
  {
    try
    {
      await auth.sendPasswordResetEmail(email: email,);
      return true;
    }
    catch (e)
    {
      print("exception is");
      print(e);
      return false;
    }
  }


  // Future<void> registerWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     await auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     showSnackBar("Votre compte a bien été créé");
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       // FlushbarHelper.createError(message: "Mot de passe facile à deviner")
  //       //     .show(context);
  //       showSnackBar("Mot de passe facile à deviner");
  //     } else if (e.code == 'email-already-in-use') {
  //       // FlushbarHelper.createError(message: "Email déjà en cours d'utilisation")
  //       //     .show(context);
  //       showSnackBar("Email déjà en cours d'utilisation");
  //     } else if (e.code == 'invalid-email') {
  //       //FlushbarHelper.createError(message: "Email invalide").show(context);
  //       showSnackBar("Email invalide");
  //     }
  //   } on SocketException catch (_) {
  //     // FlushbarHelper.createError(message: "Veuillez vous connecter à internet")
  //     //     .show(context);
  //     showSnackBar("Veuillez vous connecter à internet");
  //   } catch (e) {
  //     showSnackBar("Erreur inconnue...Veuillez réessayer !");
  //   }
  // }


  Future signOut()async
  {
    try{
      return await auth.signOut();
    }
    catch(exception)
    {
      return null;
    }
  }

}
*/