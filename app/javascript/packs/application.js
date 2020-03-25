import { initNavbarColor} from '../components/navbar';
import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';

require("chartkick")
require("chart.js")

initMapbox();
initNavbarColor();


