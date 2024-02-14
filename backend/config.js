const { initializeApp } = require('firebase/app');
const firebaseConfig = {
    apiKey: "AIzaSyAE_bwqI4DN5KzsTjNu6Hw8l7S0bInwy4I",
    authDomain: "freefiles-4ee33.firebaseapp.com",
    projectId: "freefiles-4ee33",
    storageBucket: "freefiles-4ee33.appspot.com",
    messagingSenderId: "972653730756",
    appId: "1:972653730756:web:e6e234332dc47ef50d2291"
  };
  const apps = initializeApp(firebaseConfig);
 
  module.exports=apps