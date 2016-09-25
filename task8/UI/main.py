import pymssql

conn = pymssql.connect(server="imperat.database.windows.net",
                       user="Michael@imperat.database.windows.net",
                       password="Liederlich2(", database="ADFS",
                       tds_version="7.0", port="1433")

cursor = conn.cursor()
l = cursor.execute("SELECT * FROM Cityes")
l = cursor.fetchone()
print l
conn.commit()
conn.close()


