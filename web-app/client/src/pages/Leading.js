import ss from '../images/Group 7.png'
import cat1 from '../images/cat1.png'
import cat2 from '../images/cat2.png'
import cat3 from '../images/cat3.png'
import cat4 from '../images/cat4.png'
import dog from '../images/dog.png'
import grp1 from '../images/Group4.png'
import grp2 from '../images/Group46.png'
import grp3 from '../images/Grogrp21.png'
import logo from '../images/logo.png'


import ep from '../images/eplips.png'
import { Link } from 'react-router-dom'


const Leading = () => {
    return ( 
        <div  className='h-screen w-screen bg-white text-[#000]  flex flex-col '>
            <div className='flex flex-col justify-start items-center h-screen'>
                <div className='w-full relative flex flex-col justify-between '>
                    <img src={ep} alt="vector" className='md:block w-screen z-0 absolute lg:top-[-150px] md:top-[-75px] top-[-10px] '  />
                    <div className='z-1 flex md:justify-around justify-around items-center w-[80%] mx-auto'>
                        <img src={grp1} alt='group1 ' className='lg:w-[100px] md:w-[75px] md:block hidden z-0  '/>
                        <div className=' z-1 flex flex-col items-center justify-center lg:mt-6 md:mt-2 mt-2  '>
                            <img src={grp3} alt='group1 ' className=' z-0 lg:w-[450px] md:w-[350px] w-[250px] '/>
                            <img src={dog} alt='dog' className=' z-0 lg:w-[250px] md:w-[200px] sm:w-[150px]  w-[100px] '/>
                        </div>
                        <img src={grp2} alt='group1 ' className=' z-0 lg:w-[100px] md:w-[75px] md:block hidden'/>
                    </div>
                </div>
                <img src={logo} alt="logo" className='w-[50px] sm:mt-[7%] mt-[15%] md:hidden'/>
                <div className='w-full flex justify-between items-center mt-[5%]'>
                    <div className='flex flex-col justify-around w-[25%]'>
                        <img src={cat1} alt='cat1' className='mb-2 self-end w-[100px]' />
                        <img src={cat2} alt='cat1'  className='mb-2 self-start w-[100px]'/>
                    </div>
                    <div className='w-[50%] flex flex-col justify-center items-center' >
                        <h3 className="lg:text-[22px] md:text-[18px] sm:text-[14px] text-[12px]  text-center md:font-bold font-semibold w-[85%] ">Welcome to our website dedicated to providing helpful information about animals! We understand that animals are fascinating creatures and that there is always something new to learn about them. That's why we've created this website to be your go-to source for all things animal-related.</h3>
                        <Link to='/home' className='rounded-full p-2 text-center text-white lg:text-[18px] md:text-[16px]  sm:text-[14px] text-[12px] md:w-[150px] hover:bg-[#4f4410] font-bold mt-4 bg-[#FFD600] '>Get Started</Link>
                    </div>
                    <div className='flex flex-col justify-around w-[25%]'>
                        <img src={cat3} alt='cat1' className='mb-2 self-start w-[100px]'/>
                        <img src={cat4} alt='cat1'  className='mb-2 self-end w-[100px]'/>
                    </div>
                </div>
            </div>
            
           

        </div>

     );
}
 
export default Leading;

/*<div className="h-[100vh] flex flex-col items-center bg-white text-[#000] ">
        <div className='h-2/5 w-full '>
            <div className='h-full w-full  '>
                <img className='h-full w-full' src={ss} alt='ss' />
            </div>
            <div calssName='w-full h-full '>            
                <img calssName='w-[0px] h-[2px]' src={dog} alt='dog' />
            </div>

        </div>
        <div className=' h-1/3 flex  justify-center mt-[5%] '><p className='max-w-[30%] font-medium justify-center items-center'>   Welcome to our website dedicated to providing helpful information about animals! We understand that animals are fascinating creatures and that there is always something new to learn about them. That's why we've created this website to be your go-to source for all things animal-related.</p></div>
        <div className='h-1/3 mt-[5%]'><button className='font-bold text-white bg-[#FFD600] rounded-full p-3 '>Get started</button></div>
    </div>*/