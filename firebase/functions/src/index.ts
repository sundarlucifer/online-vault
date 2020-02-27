import * as functions from 'firebase-functions';

export const appInfo = functions.https.onRequest((request, response) => {
 response.send("An android app where people can store their personal data in encrypted format and retrieve with a key anytime, anywhere and from any device.");
});
