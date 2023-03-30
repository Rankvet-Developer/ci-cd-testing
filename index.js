const express = require("express");


const app = express();

app.use(express.json());


app.get("/",(req,res) => {
    res.send("hello from testing express server");
})

app.get("/test",(req,res) => {
    res.send("from testing routes...");
})



app.listen(5000,() => {
    console.log("listening from 5000 port");
})