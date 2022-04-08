import psycopg2
import numpy as np


ids = np.arange(0, 1e5)
names = ['Slava', 'Zhenya', 'Ilya', 'Kolya', 'Alisa', 'Nadya', 'Misha', 'Stepa', 'Oleg', 'Marina', 'Olya', 'Lena']
addresses = ['Voronezh', 'Moscow', 'Innopolis', 'Kazan', 'Belgorod', 'Kiev', 'Lugansk']
reviews = [
    'Development was rushed after Sonic co-creator Yuji Naka (pictured) resigned from the team to form his own company, and half of the team was diverted to work on the Wii game Sonic and the Secret Rings.',
    'Sonic the Hedgehog was released for the Xbox 360 in November and for the PlayStation 3 the following month;',
    'versions for Wii and Windows were canceled. Praised in prerelease showings, the game was a critical failure, described as one of the worst games in the series.',
    'Reviewers criticized its loading times, camera system, story, stability, and controls. In 2010, Sega delisted the game from retailers.',
    'that the 32-story Bridge Apartments in New York City were built directly above a 12-lane freeway?',
]
commands = []
for id in ids:
    review_choice = np.random.randint(0, len(reviews))
    address_choice = np.random.randint(0, len(addresses))
    name_choice = np.random.randint(0, len(names))
    command = f"INSERT INTO Customer VALUES ({id}, \'{names[name_choice]}\', \'{addresses[address_choice]}\', \'{reviews[review_choice]}\');\n"
    commands.append(command)

try:
    conn = psycopg2.connect("dbname=postgres user=postgres password=postgres")
    cur = conn.cursor()

    for command in commands:
        cur.execute(command)
    cur.close()
    conn.commit()
except (Exception, psycopg2.DatabaseError) as error:
    print(error)



