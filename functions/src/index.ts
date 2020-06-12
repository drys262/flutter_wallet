import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

try {
  admin.initializeApp();
} catch (e) {}

export const onCreateuser = functions.auth.user().onCreate((user) => {
  console.log('on create user here', user);
  return admin
    .firestore()
    .doc(`users/${user.uid}`)
    .set({
      userId: user.uid,
      displayName: user.displayName,
      email: user.email,
      photoUrl: user.photoURL,
      jsonString: JSON.stringify(user.toJSON()),
      balance: 0,
    });
});
