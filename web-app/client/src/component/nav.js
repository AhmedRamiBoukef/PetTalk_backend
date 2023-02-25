import { Link } from "react-router-dom";
import name from '../images/PetTalk.png'
import logo from '../images/logo.png'
const Nav = () => {
    return ( 
    <div className='flex justify-between items-center p-3'>
        <p className="w-[33%]"><img src={logo} alt="logo" className="lg:w-[50px] md:w-[45px]  sm:w-[35px]  w-[25px] "/></p>
        <div className="w-[33%] flex flex-col justify-center items-center">
            <Link to='/' className ='  text-center p-1 rounded-lg lg:text-[24px] md:text-[21px] sm:text-[18px] text-[14px]font-bold text-[#FFD600] lg:w-[150px] md:w-[130px]  sm:w-[110px]  w-[90px]'><img src={name} alt="name app" /></Link>
        </div>
        <div className="flex items-center justify-end w-[33%] ">
            <Link to='/home' className="lg:text-[18px] md:text-[16px] sm:text-[14px] text-[12px] lg:mr-8 md:mr-6 sm:mr-4 mr-2 hover:font-bold">Home</Link>
            <Link to='/InfoImg'className=" md:py-2 py-1 px-2 md:px-4  text-white lg:text-[18px] md:text-[16px] sm:text-[14px] text-[12px] font-bold rounded-full hover:bg-[#2c270f8d] bg-[#FFD600]">InfoImg</Link>
        </div>
    </div> );
}
 
export default Nav;