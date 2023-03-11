let AWS = require("aws-sdk");
const uuidv1 = require("uuid");

let polly = new AWS.Polly();
let s3 = new AWS.S3();

module.exports.practicapolly = (event, context, callback) => {
  let data = JSON.parse(event.body);
  const pollyParams = {
    OutputFormat: "mp3",
    Text: data.text,
    VoiceId: data.voice,
  };

  // 1. Generate mp3 file with the text entered by user
  polly
    .synthesizeSpeech(pollyParams)
    .promise()
    .then(function (response) {
      let data = response.AudioStream;
      let key = uuidv1.v1();
      let s3BucketName = "practicapollyaws";
      // 2. Saving the audio stream to S3 bucket
      let params = {
        Bucket: s3BucketName,
        Key: key + ".mp3",
        Body: data,
      };
      s3.putObject(params)
        .promise()
        .then(function () {
          console.log("S3 Put Success!");
          let s3params = {
            Bucket: s3BucketName,
            Key: key + ".mp3",
          };
          // 3. Getting a signed URL for the saved mp3 file
          let url = s3.getSignedUrl("getObject", s3params);
          // Sending the result back to the user
          let result = {
            bucket: s3BucketName,
            key: key + ".mp3",
            url: url,
          };
          callback(null, {
            statusCode: 200,
            headers: {
              "Access-Control-Allow-Origin": "*",
            },
            body: JSON.stringify(result),
          });
        })
        .catch(function (error) {
          console.log(error);
          callback(null, {
            statusCode: 500,
            headers: {
              "Access-Control-Allow-Origin": "*",
            },
            body: JSON.stringify(error),
          });
        });
    })
    .catch(function (error) {
      console.log(error);
      callback(null, {
        statusCode: 500,
        headers: {
          "Access-Control-Allow-Origin": "*",
        },
        body: JSON.stringify(error),
      });
    });
};