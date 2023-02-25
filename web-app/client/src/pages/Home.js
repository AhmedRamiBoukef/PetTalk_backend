import { useState } from "react";
import Nav from "../component/nav";
import send from '../images/send.svg'
const Home = () => {
    const [text ,setText]=useState('')
    const [msg , setMsg]=useState('Please enter a text ')
    const [err ,setErr] = useState(false)
    const [result ,setResult]=useState('No result yet please submit a text  to get a resopnse ')
    
    const generate =()=>{
        setErr(false)
        if(text.length===0)
        {
            setMsg('Please enter a text ')
            setErr(true)
        }
        else{
            setMsg('Loading ...')
            setResult('Loading ... ')
            setErr(true)
            console.log(text);
            fetch("http://localhost:5000/chat", { 
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                   },
                   body: JSON.stringify({
                    "prompt" : text
                  })
                }).then(res=>{
                 return res.json()
              }).then(data=>{
                setErr(false)
                setResult(data.bot.trim())
              }).catch(err=>{
                setErr(true)
                setResult('Error : please rewrite your text  ')
                setMsg("Error in getting result ")
              })
        }

    }
    // top-[-28%]  right-[-17px] lg:w-[18%] md:w-[23%] sm:w-[23%] w-[25%] sm:p-2 p-1
    return ( 
    <div className="bg-white text-[#000]  h-screen">
        <Nav />
        <div className="flex flex-col items-center justify-center bg-white text-[#000] ">
            <p className=" lg:mt-8 md:mt-6 sm:mt-4 mt-2 max-w-[50%] font-bold text-center lg:text-[22px] md:text-[20px] sm:text-[16px] text-[12px] ">This is a space where you can ask any questions you have about animals, and our website will provide you with the best possible answers.</p>
            <p className="md:mt-4 mt-2  lg:text-[16px] md:text-[14px] sm:text-[12px] text-[10px]">To get started, simply type your question into the box below and hit "send."</p>
            <div className="md:mt-4 mt-2 w-[45%] lg:ml-16 md:ml-14 sm:ml-12 ml-10 flex justify-center items-center">
                <input value={text} onChange={(e)=>{setText(e.target.value)}} maxLength="" className="bg-[#FFD600] lg:text-[16px] md:text-[14px] sm:text-[12px] text-[10px] bg-opacity-[35%] rounded-full w-full md:py-2 py-1 md:px-4 px-2 lg:pr-10 md:pr-8 sm:pr-6 pr-4"></input>
                <button className=" relative lg:right-16 md:right-14 sm:right-14 right-12 "  onClick={generate}><img src={send} alt='send button' /></button>
        </div>
        <div className="flex flex-col items-center justify-center  w-[40%]">
            <div className="font-bold text-sm lg:mt-8 md:mt-6 sm:mt-4 mt-2 text-left self-start">The answer : </div>
            <div className="bg-[#FFD600] bg-opacity-[75%] w-full p-2 mt-4 lg:h-[300px]  md:h-[200px] rounded-[12px] overflow-auto border-2 border-black shadow-inner">
                <p className="lg:text-[16px] md:text-[14px] sm:text-[12px] text-[10px] font-semibold ">{result}</p>
            </div>
            {err && <h3 className="text-red-600 font-bold lg:text-[18px] md:text-[16px] sm:text-[14px] text-[12px] mb-1 ">{msg}</h3> }
        </div>
       
       
       </div>
    </div>
       
     );
}
 
export default Home;