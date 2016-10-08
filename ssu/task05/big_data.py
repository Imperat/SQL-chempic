from __future__ import print_function
import random


string = "insert into Goal values (%s, '%s', '%s', %s, '00:%s:%s');"
id = range(8,100000);
author = range(1,69)
matches = range(1,79)
is_penalty = [0,1]
minutes = range(1,59)
seconds = range(1,59)


out = open('big_data_goals.sql', 'w')

for i in id:
    _author = random.choice(author)
    _matches = random.choice(matches)
    _is_penalty = random.choice(is_penalty)
    _minutes = random.choice(minutes)
    _seconds = random.choice(seconds)

    print(string % (i, _author, _matches, _is_penalty,
                    _minutes, _seconds),
          file=out)
out.close()
