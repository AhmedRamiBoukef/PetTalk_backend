const express  = require('express')
const cors = require('cors')
const dotenv = require('dotenv')
const {Configuration , OpenAIApi } = require('openai')
const Clarifai = require('clarifai');
const axios = require('axios');
const base64Img = require('base64-img');

dotenv.config()

const configuration = new Configuration({
  apiKey: process.env.OPENAI_API_KEY,
});

const openai = new OpenAIApi(configuration);

const app = express()
app.use(cors())
app.use(express.json())

app.post('/chat', async (req, res) => {
  try {
    const prompt = 'Hello ChatGPT,if i ask you about something in the theme of animals answer me else tell me that you cant answer, the answer must be in a pragraphe  , my question is : '+req.body.prompt;
    const response = await openai.createCompletion({
      model: "text-davinci-003",
      prompt: `${prompt}`,
      temperature: 0, // Higher values means the model will take more risks.
      max_tokens: 3000, // The maximum number of tokens to generate in the completion. Most models have a context length of 2048 tokens (except for the newest models, which support 4096).
      top_p: 1, // alternative to sampling with temperature, called nucleus sampling
      frequency_penalty: 0.5, // Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.
      presence_penalty: 0, // Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
    });

    res.status(200).send({
      bot: response.data.choices[0].text
    });

  } catch (error) {
    console.error(error)
    res.status(500).send(error || 'Something went wrong');
  }
})


const apps = new Clarifai.App({
    apiKey: '0fe22ba3012047928b4342c4cd6f12fd'
  });
  //const imageUrl ="https://res.cloudinary.com/dc3fxvt26/image/upload/v1677260471/mmmm_ndcsnw.jpg";


app.post('/ImgInfo',  (req,res)=>{// Set up the client and credentials

  // Fetch image data as a Blob
 const imageUrl = req.body.image
 
  axios.get(imageUrl, {responseType: 'arraybuffer'})
  .then(response => {
    // Convert response data to base64-encoded string
    const base64data = Buffer.from(response.data, 'binary').toString('base64');

        apps.models.predict(Clarifai.GENERAL_MODEL,{base64: base64data})
        .then( async response => {
              const breed =  response.outputs[0].data.concepts[0].name
              const prompt = 'my question is to give me informations about the animal '+breed
             
              const response1 =  await openai.createCompletion({
              model: "text-davinci-003",
              prompt: `${prompt}`,
              temperature: 0, // Higher values means the model will take more risks.
              max_tokens: 3000, // The maximum number of tokens to generate in the completion. Most models have a context length of 2048 tokens (except for the newest models, which support 4096).
              top_p: 1, // alternative to sampling with temperature, called nucleus sampling  
              frequency_penalty: 0.5, // Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.
              presence_penalty: 0, // Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
            });
          res.status(200).json({
              name : breed , 
              information : response1.data.choices[0].text ,
      
          })
          //res.json( {bot :response1})
          //console.log('The pet in the photo is a', breed);
        })
        .catch(err => {
        res.status(400).json("error :")
      
          })
      
        })




})




app.listen(5000, () => console.log('AI server started on http://localhost:5000'))