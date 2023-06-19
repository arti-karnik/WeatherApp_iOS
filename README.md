# WeatherApp_iOS

I have created a weather app that allows an user to search for any city and retrive it's current weather & 5 day forecast. Weather details such as temperature (in C), wind, maximum & minimum temperature & humidity for the current day are shown. If user allows location access to the app, the current location weather is displayed. If location access is not granted, the app defaults to & displays weather for Plano, TX.

If an invalid city name is entered, user receives a prompt to rectify the same.

Used Geocoding API to fetch latitude & longitude details of entered city name:
https://openweathermap.org/api/geocoding-api

Used below API to fetch weather parameter details such as wind, min & max temperature, etc.
https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

Used below API to fetch 5 day forecast details:
api.openweathermap.org/data/2.5/forecast/daily?lat={lat}&lon={lon}&cnt={cnt}&appid={API key}

Video Recording
<video src='https://github.com/arti-karnik/WeatherApp_iOS/assets/75514762/396907d2-baf7-4045-a4fa-f8f9fde90057' width=180/>





