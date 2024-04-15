import { config } from "dotenv";
import express, { json, urlencoded } from "express";
import normalizePort from "normalize-port";
import multer from "multer";
import cors from "cors";
import { Dropbox } from 'dropbox';
import fetch from 'node-fetch';
import rawBody from 'raw-body';
import fs from 'fs';
import path from 'path';
import {
  GoogleGenerativeAI,
  HarmBlockThreshold,
  HarmCategory,
} from "@google/generative-ai";

config();
const app = express();
const upload = multer();
app.use(express.text());
app.use(cors());
app.use(json());
app.use(urlencoded({ extended: true }));
app.use(upload.single("image"));

const dbx = new Dropbox({
  accessToken: '*dropbox access token here*',
  fetch: fetch
});

const port = normalizePort(process.env.PORT || "3000");

const safetySettings = [
  {
    category: HarmCategory.HARM_CATEGORY_HARASSMENT,
    threshold: HarmBlockThreshold.BLOCK_NONE,
  },
  {
    category: HarmCategory.HARM_CATEGORY_HATE_SPEECH,
    threshold: HarmBlockThreshold.BLOCK_NONE,
  },
  {
    category: HarmCategory.HARM_CATEGORY_SEXUALLY_EXPLICIT,
    threshold: HarmBlockThreshold.BLOCK_NONE,
  },
  {
    category: HarmCategory.HARM_CATEGORY_DANGEROUS_CONTENT,
    threshold: HarmBlockThreshold.BLOCK_NONE,
  },
];

const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY);
const model = genAI.getGenerativeModel({
  model: "gemini-pro-vision",
  safetySettings,
});

app.get("/", (req, res) => {
  res.send("Smart Pantry API");
});

app.post('/upload', (req, res) => {
  try {
    console.log("Uploading")
    let data = JSON.stringify(req.body)
    console.log(data)

    data = data.replace(/\\n/g, '\n');

    const buffer = Buffer.from(data.substring(2, data.length - 5), 'utf-8');
    const dropboxDestination = '/logs.txt';
    dbx.filesUpload({ path: dropboxDestination, contents: buffer, mode: { ".tag": "overwrite" } })
          .then(response => {
              console.log('File uploaded:', response);
          })
          .catch(error => {
              console.error('Error uploading file:', error);
          });
  } catch (exception) {
    console.log("Error occured: " + exception)
  }  
});



app.post("/get-pantry", async (req, res) => {
  if (!req.file) {
    return res.status(400).json({ error: "No image file provided" });
  }
  if (
    req.file.originalname.endsWith(".jpg") ||
    req.file.originalname.endsWith(".jpeg")
  ) {
    const prompt = `Parse this receipt and return a list of json with the following schema
      [{
        name: name of food item and no abbreviation (type: string),
        quantity: {
            value: quantity or weight (type: string),
            unit: item for non-weight quantity or a weight unit found on receipt (type: string),
            ttl: storage time of the food item with same or similar name in days by usda, if not found then give the general recommendation shelf life in days (type: integer)
        },
        price: price of each food item with no unit (type: string),
    }]
      This schema must be honored at all time without fail.
      List each food item as a separate json element. 
      Take into account discount when calculating price.
      Return only the json
      Include only final result for all fields
      Make sure the result is in a list format
      Make sure the result does not contain newline symbol`;
    const image = {
      inlineData: {
        data: req.file.buffer.toString("base64"),
        mimeType: "image/jpeg",
      },
    };
    const result = await model.generateContent([prompt, image]);
    try {
      const resultFormatted = JSON.parse(result.response.text().trim());
      console.log(resultFormatted);
      return res.status(200).send(resultFormatted);
    } catch (e) {
      return res.status(422).json({ error: e.message });
    }
  }
  return res.status(400).json({ error: "File is not a JPG image" });
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
