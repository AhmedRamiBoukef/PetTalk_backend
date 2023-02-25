import Nav from "../component/nav";
import DragDrop from "../component/DragDrop";
import { useEffect, useState } from "react";
import axios from 'axios'
const UPLOAD_URL = "https://api.cloudinary.com/v1_1/dc3fxvt26/image/upload";


const InfoImg = () => {
    const [urls ,setUrls]=useState('')
    const [message , setMSg]=useState('Please select an image ')
    const [Err,setErr]=useState(false)
    const [Result , setResult] =useState('No result yet please submit an animal photo to get a resopnse ')
    const [Animal , setAnimal] =useState('')


    
    const handleClick =async ()=>{
        setErr(false)
        setAnimal('')
        setResult('No result yet please submit an animal photo to get a resopnse ')
        if (images.length!==1)
        {
            setMSg('Please select an image')
            setErr(true)
            
        }else{
            setResult('Loading ... ')
            // Promise.all(images.map(image => uploadBase64Image(image.src)))
            // .then(results => {
            //     console.log(results[0].url);
            //     setUrls(results[0].url)
               

               const res =  await uploadBase64Image(images[0].src)
               console.log(res.url);
                let headersList = {
                    "Accept": "*/*",
                    "User-Agent": "Thunder Client (https://www.thunderclient.com)",
                    "Content-Type": "application/json"
                   }
                   
                   let bodyContent = JSON.stringify({
                   "image":res.url
                   });
                  fetch("http://localhost:5000/ImgInfo", { 
                     method: "POST",
                     body: bodyContent,
                     headers: headersList
                   }).then(results=>{
                    return results.json()
                   }).then(data=>{
                    setResult(data.information)
                    setAnimal('The animal is :'+data.name)
                   })
                 
                   
                   
                   
                // fetch("http://localhost:5000/ImgInfo", { 
                
                //     method: "POST",
                //     headers: {
                //         "Content-Type": "application/json"
                //        },
                //        body: JSON.stringify({
                //         "image" : urls
                //       })
                //     }).then(res=>{
                //      return res.json()
                //   }).then(data=>{
                //     setErr(false)
                //     setResult(data.information)
                //     setAnimal('The animal is :'+data.name)
                //   }).catch(err=>{
                //     setErr(true)
                //     setMSg('Error in analzing the image')
                //     setResult('Error : please resubmit your application  ')
                //   })        
            }
       
    }
    const [images, setImages] =useState([])
    const uploadBase64Image = (base64Image) => {
        const formData = new FormData();
        formData.append('file', base64Image);
        formData.append('upload_preset', 'mipff47j');
      
        return axios.post(UPLOAD_URL, formData)
          .then(response => response.data);
      };
    return ( 
    <div className="bg-white text-[#000] h-screen">
        <Nav />
        
        <div className="flex flex-col justify-center items-center lg:mt-10 md:mt-8 sm:mt-6 mt-4 bg-white">
            <h3 className="lg:text-[22px] md:text-[20px] sm:text-[16px] text-[12px]  text-center font-bold w-[50%] ">Our easy-to-use interface allows you to upload a photo of the animal system will quickly analyze the image to provide you with accurate and detailed information about the animal's </h3>
            <p className="md:mt-3 mt-2 lg:text-[16px] md:text-[14px] sm:text-[12px] text-[10px] w-[75%] mx-auto text-center">To get started, simply type upload your photo into the box below and hit "Generate."</p>
            <div className="lg:mt-10 md:mt-8 sm:mt-6 mt-4 flex-col md:flex-row flex justify-around w-[80%] items-center ">
                <div className="flex flex-col justify-center items-center  w-[50%]"  >
                    <DragDrop setImages={setImages} images={images}   /> 
                {Err && <h3 className="text-red-600 font-bold lg:text-[18px] md:text-[16px] sm:text-[14px] text-[12px] mb-1 ">{message}</h3> }
                <button onClick={handleClick} className="lg:text-[16px] md:text-[14px] sm:text-[12px] text-[10px] shadow-lg rounded-full bg-[#FFD600] p-2 text-white font-bold">Get Info</button>
                </div>
                <div className="w-[40%] ">
                    <h3 className="lg:text-[20px] md:text-[17px] sm:text-[15px] text-[12px] font-bold ">The result :</h3>
                    <div className="border-2 overflow-auto border-[#000] rounded-md lg:h-[350px] p-4 shadow-inner mb-3 lg:text-[16px] md:text-[14px] sm:text-[12px] text-[10px] bg-[#FFD600]">
                        <p className="lg:text-[16px] md:text-[14px] sm:text-[12px] text-[10px] font-semibold">{Animal}</p>
                        <p className="lg:text-[16px] md:text-[14px] sm:text-[12px] text-[10px] font-semibold">{Result}</p>
                    </div>
                </div>
                
            </div>
        </div>
    </div> );
}
 
export default InfoImg;

// <DragDrop setImages={setImages} images={images}  /> 