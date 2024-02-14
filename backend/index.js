const express=require('express')
const cors=require('cors')
const App=require('./config')
const app=express()
app.use(express.json())
app.use(cors())
const { getFirestore, collection, addDoc, doc, setDoc, getDocs, getDoc, snapshotEqual } = require('firebase/firestore/lite');
const { async } = require('@firebase/util')
const { setDefaultResultOrder } = require('dns/promises')
const { getStorage, ref, getDownloadURL  }=require("firebase/storage")
const storage = getStorage();
const firestore = getFirestore();
const storageRef = ref(storage, 'img/anime-naruto-itachi_uchiha-397491.jpeg');

  
const UserCollection= collection(firestore,'Users')
referece=doc(firestore,'Users/7rNjSf1jSHU6W1IzUgp')


app.get('/getid',async(req,res)=>{
    const Uid=req.body
    const id=Uid['uid']
   //UserCollection.where("author",'==',id).get()
   if (!snapshot) {
    console.log(snapshot.id)
   }else{
    console.log("Pas de valeur")
   }

})

app.post('/created', async(req,res)=>{
    const data=req.body
   const newDoc= await addDoc(UserCollection,data)
   // const se=await setDoc(referece,data)
    res.send({msg:"User added!"})
})
 
app.put('/put',async(req,res)=>{
    const data=req.body
    const se=await setDoc(referece,data)
    res.send({msg:"Information update succefull!"})
})
app.get('/file', async(req,res)=>{
    getDownloadURL(storageRef)
    .then((url)=>{
    // console.log(url)
    //     const xhr = new XMLHttpRequest();
    // xhr.responseType = 'blob';
    // xhr.onload = (event) => {
    //   const blob = xhr.response;
    // };
    // xhr.open('GET', url);
    // xhr.send();
    res.send({url})
    })
    .catch((err)=>res.json({err}))
})


app.listen(4000,()=>console.log("tp & rening 4000"))