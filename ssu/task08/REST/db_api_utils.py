

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
    cursor.execute("SELECT * FROM Cityes where id=%s" % id)
    row = cursor.fetchone()
    return row[1]

def get_id_by_name(name, obj=None, conn=None):
    if not obj:
        return

    cursor = conn.cursor()
    if obj == 'city':
        cursor.execute("SELECT id from Cityes where name='%s'" % name)
        return cursor.fetchone()[0]
    if obj == 'team':
        cursor.execute("SELECT id from Teams where name='%s'" % name)
        return cursor.fetchone()[0]
    if obj == 'player':
        cursor.execute("SELECT id from Players where name='%s'" % name)
        return cursor.fetchone()[0]
    if obj == 'stadion':
        cursor.execute("SELECT id from Stadions where name='%s'" % name)
        return cursor.fetchone()[0]
    if obj == 'match':
        cursor.execute("SELECT id from Matches where name='%s'" % name)
        return cursor.fetchone()[0]
    if obj == 'league':
        cursor.execute("SELECT id from League where name='%s'" % name)
        return cursor.fetchone()[0]
    if obj == 'position':
        cursor.execute("SELECT id from Positions where name='%s'" % name)
        return cursor.fetchone()[0]
