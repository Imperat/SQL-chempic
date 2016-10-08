from __future__ import print_function
import random


string = "insert into UnnessesaryFan values (%s, '%s', '%s', %s, '%s.%s.%s');"
id = range(2,100000);
First_name = ['Michael', 'Slava', 'Igor', 'Kris', 'Lolek', 'Alcogolec']
Last_name = ['Kefal', 'Markefal', 'Putin', 'Feynmann']
cityes = range(0,20);
year = range(1950,2005)
month = range(1,12)
day = range(1,28)


out = open('big_data_fans.sql', 'w')

for i in id:
    _First_name = random.choice(First_name)
    _Last_name = random.choice(Last_name)
    _cityes = random.choice(cityes)
    _day = random.choice(day)
    _month = random.choice(month)
    _year = random.choice(year)

    print(string % (i, _First_name, _Last_name, _cityes,
                    _year, _month, _day),
          file=out)
out.close()
