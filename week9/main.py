import psycopg2
from geopy.geocoders import Nominatim

geolocator = Nominatim(user_agent='dbATui')

conn = psycopg2.connect("dbname=database3 user=postgres password=postgres")
cur = conn.cursor()

cur.execute('''ALTER TABLE address
               ADD IF NOT EXISTS latitude FLOAT,
               ADD IF NOT EXISTS longitude FLOAT;''')

cur.execute('select * from func();')
anss = cur.fetchall()
for id, address in anss:
    try:
        coord = geolocator.geocode(address)
        cur.execute(f'''UPDATE address
                        SET latitude = {coord.latitude},
                            longitude = {coord.longitude}
                        WHERE address_id = {id};''')
        print(coord.latitude, coord.longitude)
    except BaseException:
        cur.execute(f'''UPDATE address
                        SET latitude = 0,
                            longitude = 0
                        WHERE address_id = {id};''')
        print(0, 0)

    conn.commit()

cur.close()
conn.close()
