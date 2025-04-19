// ignore_for_file: unused_field

import 'package:absherthone/features/login/data/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  initial,
  codeSent,
  authenticated,
  error,
  loading,
}

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  AuthStatus _status = AuthStatus.initial;
  String? _verificationId;
  String? _errorMessage;
  User? _user;
  int? _resendToken;
  bool _isNewUser = false;

  // Getters
  AuthStatus get status => _status;
  String? get errorMessage => _errorMessage;
  User? get user => _user ?? _authService.currentUser;
  bool get isAuthenticated => user != null;
  bool get isNewUser => _isNewUser;

  AuthProvider() {
    // Check if user is already authenticated
    _user = _authService.currentUser;
    if (_user != null) {
      _status = AuthStatus.authenticated;
    }

    // Listen for auth state changes
    _authService.authStateChanges.listen((User? user) {
      _user = user;
      if (user != null) {
        _status = AuthStatus.authenticated;
      } else {
        _status = AuthStatus.initial;
      }
      notifyListeners();
    });
  }

  // Send OTP
  Future<void> sendOTP(String phoneNumber) async {
    try {
      // Reset status to initial before starting new authentication
      _status = AuthStatus.initial;
      _verificationId = null;
      _errorMessage = null;
      notifyListeners();

      print("AuthProvider: Sending OTP to $phoneNumber");
      _status = AuthStatus.loading;
      notifyListeners();

      await _authService.sendOTP(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print("AuthProvider: verificationCompleted callback triggered");
          await _signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print("AuthProvider: verificationFailed callback triggered");
          print("Error code: ${e.code}");
          print("Error message: ${e.message}");
          print("Error details: ${e.plugin}");

          String errorMessage;
          switch (e.code) {
            case 'invalid-phone-number':
              errorMessage =
                  'Invalid phone number format. Please check and try again';
              break;
            case 'too-many-requests':
              errorMessage = 'Too many attempts. Please try again later';
              break;
            case 'quota-exceeded':
              errorMessage = 'SMS quota exceeded. Please try again later';
              break;
            case 'internal-error':
              errorMessage =
                  'Unable to send verification code. Please check your internet connection and try again';
              break;
            default:
              errorMessage =
                  'Unable to send verification code. Please try again';
          }

          _status = AuthStatus.error;
          _errorMessage = errorMessage;
          notifyListeners();
        },
        codeSent: (String verificationId, int? resendToken) {
          print("AuthProvider: codeSent callback triggered");
          _status = AuthStatus.codeSent;
          _verificationId = verificationId;
          _resendToken = resendToken;
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("AuthProvider: codeAutoRetrievalTimeout callback triggered");
          _verificationId = verificationId;
          notifyListeners();
        },
      );
    } catch (e) {
      print("Error in sendOTP: $e");
      _status = AuthStatus.error;
      _errorMessage = "Failed to send verification code. Please try again.";
      notifyListeners();
    }
  }

  // Verify OTP
  Future<void> verifyOTP(String otp) async {
    try {
      if (_verificationId == null) {
        _status = AuthStatus.error;
        _errorMessage = "Verification ID is null. Please request OTP again.";
        notifyListeners();
        return;
      }

      _status = AuthStatus.loading;
      notifyListeners();

      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );

      await _authService.signInWithCredential(credential);
      _status = AuthStatus.authenticated;
      notifyListeners();
    } catch (e) {
      print("Error verifying OTP: $e");
      _status = AuthStatus.error;
      _errorMessage = "Invalid verification code. Please try again.";
      notifyListeners();
    }
  }

  // Update user profile
  Future<void> updateUserProfile(String displayName) async {
    try {
      await _authService.updateUserProfile(displayName: displayName);
      _user = _authService.currentUser;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _authService.signOut();
      _status = AuthStatus.initial;
      _verificationId = null;
      _errorMessage = null;
      _user = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  // Helper method to sign in with credential
  Future<void> _signInWithCredential(PhoneAuthCredential credential) async {
    try {
      await _authService.signInWithCredential(credential);
      _status = AuthStatus.authenticated;
      notifyListeners();
    } catch (e) {
      _status = AuthStatus.error;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
}
