

def _get_position(id, conn=None):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Positions where id=%s" % id)
    row = cursor.fetchone()
    return row[1    ]


def _get_team(id, conn=None):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Teams where id=%s" % id)
    row = cursor.fetchone()
    return row[1]

def _get_stadion(id, conn=None):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Stadions where id=%s" % id)
    row = cursor.fetchone()
    return row[1]

def _get_league(id, conn=None):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM League where id=%s" % id)
    row = cursor.fetchone()
    return row[1]


def _get_city(id, conn=None):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Cityes where id=%s" %id)
    row = cursor.fetchone()
    return row[1]
