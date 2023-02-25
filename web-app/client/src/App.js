import Nav from './component/nav';
import {BrowserRouter,  Routes , Route} from "react-router-dom" 
import InfoImg from './pages/InfoImg';
import Home from './pages/Home';
import Leading from './pages/Leading';


function App() {
  return (
  <BrowserRouter className=''>
    <Routes>
      <Route path='/'  element={<Leading />} ></Route>
      <Route path='/home' element={<Home />}></Route>
      <Route path='/InfoImg' element={<InfoImg/>}></Route>
    </Routes>
  </BrowserRouter>
 );
}

export default App;
/* */