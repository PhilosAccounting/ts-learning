from screen import Screen, get_oled
from netcheck import wait_for_networking
import urequests
import json
import time
import random

CONF_PATH = 'conf.json'
API_URL = 'https://api.openweathermap.org/data/2.5/weather'
CITIES = ['Berlin', 'London', 'Paris', 'Tokyo', 'Rome', 'Oslo', 'Bangkok']
WEATHER = """\
City: {city}
Temp: {temp}
Wind: {wind}
"""


def get_conf():
    content = open(CONF_PATH).read()
    return json.loads(content)


def get_weather(APPID, city):
    url = API_URL + '?units=metric&APPID=' + APPID + '&q=' + city
    return urequests.get(url).json()


def show_weather(screen, APPID, city):
    screen.oled.invert(True)
    weather = get_weather(APPID, city)
    data = {}
    data['city'] = city
    data['temp'] = weather['main']['temp']
    data['wind'] = weather['wind']['speed']
    text = WEATHER.format(**data)
    print('-------- %s --------' % city)
    print(text)
    screen.write(text)
    screen.oled.invert(False)


def show_random_weather(screen, APPID):
    city = random.choice(CITIES)
    show_weather(screen, APPID, city)


def main():
    oled = get_oled()
    screen = Screen(oled)
    wait_for_networking()
    conf = get_conf()
    APPID = conf['APPID']
    for i in range(3):
        show_random_weather(screen, APPID)


main()
