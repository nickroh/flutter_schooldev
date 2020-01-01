const firebase = require("firebase");
// Required for side-effects
require("firebase/auth");

// Initialize Cloud Firestore through Firebase
firebase.initializeApp({
    apiKey: "AIzaSyDdU5r-NF7dNCMvCFV6WUoVBd0e8BkBD_w",
    authDomain: "flutter-schooldev.firebaseapp.com",
    projectId: "flutter-schooldev"
  });

var user = firebase.auth().currentUser;
var name, email, photoUrl, uid, emailVerified;

if (user != null) {
  name = user.displayName;
  email = user.email;
  photoUrl = user.photoURL;
  emailVerified = user.emailVerified;
  uid = user.uid;  // The user's ID, unique to the Firebase project. Do NOT use
                   // this value to authenticate with your backend server, if
                   // you have one. Use User.getToken() instead.
}
console.log(name);
console.log(uid);