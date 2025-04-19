import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Stream of auth changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Send OTP to phone number
  Future<void> sendOTP({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    try {
      // Format phone number with country code if not provided
      if (!phoneNumber.startsWith('+')) {
        // Add Saudi Arabia country code if not present
        phoneNumber =
            '+966${phoneNumber.startsWith('0') ? phoneNumber.substring(1) : phoneNumber}';
      }

      print("AuthService: Formatting phone number: $phoneNumber");

      if (Platform.isIOS) {
        print("AuthService: Running on iOS platform");
        // iOS specific implementation
        await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (credential) {
            print("AuthService iOS: verificationCompleted callback");
            verificationCompleted(credential);
          },
          verificationFailed: (e) {
            print("AuthService iOS: verificationFailed callback: ${e.message}");
            verificationFailed(e);
          },
          codeSent: (verificationId, resendToken) {
            print("AuthService iOS: codeSent callback: $verificationId");
            codeSent(verificationId, resendToken);
          },
          codeAutoRetrievalTimeout: (verificationId) {
            print("AuthService iOS: codeAutoRetrievalTimeout callback");
            codeAutoRetrievalTimeout(verificationId);
          },
          timeout: const Duration(seconds: 60),
          forceResendingToken: null,
        );
      } else {
        print("AuthService: Running on Android platform");
        // Standard approach for Android
        await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (credential) {
            print("AuthService Android: verificationCompleted callback");
            verificationCompleted(credential);
          },
          verificationFailed: (e) {
            print(
                "AuthService Android: verificationFailed callback: ${e.message}");
            verificationFailed(e);
          },
          codeSent: (verificationId, resendToken) {
            print("AuthService Android: codeSent callback: $verificationId");
            codeSent(verificationId, resendToken);
          },
          codeAutoRetrievalTimeout: (verificationId) {
            print("AuthService Android: codeAutoRetrievalTimeout callback");
            codeAutoRetrievalTimeout(verificationId);
          },
          timeout: const Duration(seconds: 60),
        );
      }
      print("AuthService: verifyPhoneNumber call completed successfully");
    } catch (e) {
      print("AuthService: Error in phone verification: $e");
      rethrow;
    }
  }

  // Verify OTP code
  Future<UserCredential> verifyOTP({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print("Error in OTP verification: $e");
      rethrow;
    }
  }

  // Sign in with credential
  Future<UserCredential> signInWithCredential(
      PhoneAuthCredential credential) async {
    try {
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print("Error signing in with credential: $e");
      rethrow;
    }
  }

  // Update user profile
  Future<void> updateUserProfile({required String displayName}) async {
    try {
      await _auth.currentUser?.updateDisplayName(displayName);
    } catch (e) {
      print("Error updating user profile: $e");
      rethrow;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Error signing out: $e");
      rethrow;
    }
  }
}
