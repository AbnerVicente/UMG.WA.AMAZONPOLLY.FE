using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Amazon;
using Amazon.Polly;
using Amazon.Polly.Model;
using System.IO;

using System.Threading.Tasks;
using Amazon.Auth.AccessControlPolicy;
using System.Security.Claims;
using System.Security.Cryptography;

//using Org.BouncyCastle.Asn1.Ocsp;


namespace UMG.WA.AMAZONPOLLY.FE
{
    public partial class frmAmazonPolly : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEscuchar_Click(object sender, EventArgs e)
        {
            // Crea una instancia de AmazonPollyClient con las credenciales de acceso
            AmazonPollyClient clientePolly = new AmazonPollyClient("ACCESS_KEY_ID", "SECRET_ACCESS_KEY", Amazon.RegionEndpoint.USWest2);

            // Obtiene el texto a convertir a voz desde el TextBox
            string textoAConvertir = txtTextoEntrada.Text;

            // Crea una instancia de SynthesizeSpeechRequest con el texto a convertir y la configuración de la voz y el formato de salida
            SynthesizeSpeechRequest solicitudSynthesizeSpeech = new SynthesizeSpeechRequest
            {
                Text = textoAConvertir,
                VoiceId = VoiceId.Joanna,
                OutputFormat = OutputFormat.Mp3
            };

            // Llama al método SynthesizeSpeechAsync para obtener el audio resultante
            SynthesizeSpeechResponse respuestaSynthesizeSpeech = clientePolly.SynthesizeSpeechAsync(solicitudSynthesizeSpeech).Result;

            // Guarda el audio resultante en un archivo de audio en formato MP3
            using (Stream audioStream = File.Create("audio.mp3"))
            {
                respuestaSynthesizeSpeech.AudioStream.CopyTo(audioStream);
                audioStream.Flush();
                audioStream.Close();
            }

            //// Opcionalmente, reproduce el audio resultante en una página web ASP.NET C# usando un reproductor de audio
            //audioPlayer.Src = "audio.mp3";
            //audioPlayer.Play();
        }

       
    }


}