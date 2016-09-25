import pymssql


def get_connection():
	"""
	get connecion for my specific DataBase
	"""
	conn = pymssql.connect(server="imperat.database.windows.net",
                           user="Michael@imperat.database.windows.net",
                           password="Liederlich2(", database="ADFS",
                           tds_version="7.0", port="1433")
	return conn

def get_cityes(conn):
	cursor = conn.cursor()
	cursor.execute("SELECT * FROM Cityes")
	cityes = []
	for city in cursor:
		new_city = dict(id=city[0], name=city[1])
		cityes.append(new_city)
	return cityes



