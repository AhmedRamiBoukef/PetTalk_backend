import React, { useCallback, useState } from 'react';
import DropBox from './DropBox';
import Image from './Image';

import { useEffect } from "react";

function DragDrop({setImages ,images}) {
  const [alert,setAlert]=useState(false)
  
  useEffect (()=>{
    //console.log(images[0].src);
   let i = images.findIndex(e=> e.src.slice(5,10) !== "image") 
    if(i !==-1){
      setAlert(true)
    }
  },[images])

  const accept = ()=>{
   
    let i = images.findIndex(e=> e.src.slice(5,10) !== "image") 
    images.splice(i, 1);
    setImages([...images]);
    setAlert(false)
  }
  const removeFile = (name) => {
    console.log(images);
    // find the index of the item
    // remove the item from array
  
    const validFileIndex = images.findIndex(e => e.src === name);
    images.splice(validFileIndex, 1);
    setImages([...images]);

}
  const onDrop = useCallback((acceptedFiles) => {
    acceptedFiles.map((file, index) => {
      const reader = new FileReader();
      reader.onload = function (e) {
        setImages(
         [ { id: index, src: e.target.result }]
        );
      };
      reader.readAsDataURL(file);
      return file;
    });
  }, []);
  const show = (image) => {
    return <Image image={image } removeFile={removeFile}/>
  };
  return (
    <div className="my-2">
      
      <DropBox onDrop={onDrop} />
    {alert &&  <div className="alert alert-error shadow-lg mt-2 flex justify-between w-[90%] mx-auto">
          <div className="flex ">
            <svg xmlns="http://www.w3.org/2000/svg" className="stroke-current flex-shrink-0 lg:h-6 md:h-5 sm:h-4 h-3 lg:w-6 md:w-5 sm:h-4 h-3" fill="none" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
            <span className='lg:text-[16px] md:text-[14px] sm:text-[12px] text-[10px] '>Error! one of the files selected is not an image it will be delted automticaly </span>
          </div>
          <div>
            <button className=" lg:text-[16px] md:text-[14px] sm:text-[12px] text-[10px] btn btn-sm btn-primary" onClick={accept}>Accept</button>
          </div>
      </div> }
      <div className="container flex items-center flex-warp w-[%] mt-2 relative ">
        {images.map(show)}
      </div>
    </div>
  );
}


export default DragDrop



// i need to make images as a generale compnant using redux later 
// i need to virfy the validation of files 