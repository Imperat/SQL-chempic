

def _get_position(id, conn=None):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Positions where id=%s" % id)
    row = cursor.fetchone()
    return dict(id=row[0], name=row[1])


def _get_team(id, conn=None):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Teams where id=%s" % id)
    row = cursor.fetchone()
    return dict(id=row[0], name=row[1], city=row[2],
                making=str(row[3]), budget=str(row[4]),
                city_name=_get_city(row[2], conn)['name'])



def _get_stadion(id, conn=None):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Stadions where id=%s" % id)
    row = cursor.fetchone()
    return dict(id=row[0], name=row[1],city=row[2], city_name=_get_city(row[2], conn)['name'])


def _get_league(id, conn=None):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM League where id=%s" % id)
    row = cursor.fetchone()
    return dict(id=row[0], name=row[1], start_date=row[2], end_date=row[3])


def _get_city(id, conn=None):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Cityes where id=%s" % id)
    row = cursor.fetchone()
    return dict(id=row[0], name=row[1])


def _get_player(id, conn=None):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Players where id=%s" % id)
    row = cursor.fetchone()
    return dict(id=row[0], first_name=row[1], last_name=row[2],
                birth_day=str(row[3]), position=row[4],salary=str(row[5]), position_name=_get_position(row[4], conn)['name'])


def _get_match(id, conn=None):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Matches where id=%s" % id)
    row = cursor.fetchone()
    return dict(home=row[0],away=row[1], home_goals=row[2],
                away_goals=row[3],league=row[4],stadion=row[5],
                date=str(row[6]), id=row[7], league_name=_get_league(row[4],conn)['name'],
                home_team_name=_get_team(row[0], conn)['name'], away_team_name=_get_team(row[1], conn)['name'],
                stadion_name=_get_stadion(row[5], conn)['name'])


def _get_championship(id, conn=None):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM League where id=%s" % id)
    row = cursor.fetchone()
    return dict(id=row[0], name=row[1], start_date=row[2], end_date=row[3])


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
