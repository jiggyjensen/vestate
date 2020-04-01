import { initNavbarColor} from '../components/navbar';
import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import "../plugins/flatpickr"
import {mapViewToggle} from '../components/toggle';
import {sliderCalc} from '../components/slider';
import {featuredProp} from '../components/featured_prop';

require("chartkick")
require("chart.js")

initMapbox();
initNavbarColor();
mapViewToggle();
sliderCalc();
featuredProp();
