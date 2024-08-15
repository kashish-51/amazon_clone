//! IMPORTS FROM PACKAGES
const express = require('express');
const mongoose = require("mongoose");

//! IMPORTS FROM FILES
const authRouter = require('./routes/auth');


//! INITIALIZATIONS
const app = express();
const PORT = 3000;

//!middleware
app.use(express.json());
app.use(authRouter);


//! connections
mongoose.connect("mongodb+srv://singhkashish14203:kashish14203@cluster4.dmqjs1h.mongodb.net/amazon?retryWrites=true&w=majority")
  .then(() => {
    console.log('Connected to MongoDB');
  })
  .catch((err) => {
    console.error('Error connecting to MongoDB: ', err);
  });

app.listen(PORT,"0.0.0.0", ()=>{
    console.log(`connected at ${PORT}` );
});

