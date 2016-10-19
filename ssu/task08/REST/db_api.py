import pymssql

from db_api_utils import _get_city, _get_position, _get_team, _get_league, _get_stadion, _get_player, _get_match, _get_championship, _get_position
from db_api_utils import get_id_by_name


def get_connection():
    """
    get connecion for my specific DataBase
    """
    conn = pymssql.connect(server="127.0.0.1",
                           user="marmon",
                           password="marmon",
                           database="FinalIteration",
                           tds_version="7.0",
                           port="1433")
    return conn


def get_cityes(conn):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Cityes")
    cityes = []
    for city in cursor.fetchall():
        new_city = dict(id=city[0], name=city[1])
        cityes.append(new_city)
    return cityes


def get_players(conn):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Players")
    players = []
    for player in cursor.fetchall():
        new_player = dict(id=player[0], first_name=player[1],
                          last_name=player[2], birth_day=player[3],
                          position=_get_position(player[4], conn=conn),
                          salary=str(player[5]))
        players.append(new_player)
    return players


def get_matches(conn):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Matches")
    matches = []
    def _match_is_active(match):
      try:
        return match[8]
      except IndexError:
        return "null"
    for match in cursor.fetchall():
        new_match = dict(home=_get_team(match[0],conn=conn),
                         away=_get_team(match[1],conn=conn),
                         home_goals=match[2],
                         away_goals=match[3],
                         league=_get_league(match[4], conn=conn),
                         stadion=_get_stadion(match[5], conn=conn),
                         date=str(match[6]), id=match[7], active=_match_is_active(match))
        matches.append(new_match)
    return matches


def get_teams(conn):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Teams")
    teams = []
    for team in cursor.fetchall():
        new_team = dict(id=team[0], name=team[1],
                        city=_get_city(team[2], conn=conn),
                        making=team[3], budget=str(team[4]))
        teams.append(new_team)
    return teams


def get_stadions(conn):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Stadions")
    stadions = []
    for stadion in cursor.fetchall():
        new_stadion = dict(id=stadion[0], name=stadion[1],
                           city=_get_city(stadion[2], conn=conn))
        stadions.append(new_stadion)
    return stadions


def get_chempionships(conn):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM League")
    leagues = []
    for league in cursor.fetchall():
        new_league = dict(id=league[0], name=league[1],
                          start_date=str(league[2]), end_date=str(league[3]))
        leagues.append(new_league)
    return leagues


def create_city(conn, request):
    cursor = conn.cursor()
    cursor.execute("INSERT INTO Cityes VALUES ('%s')" % request.form['name'])
    conn.commit()


def create_player(conn, request):
    cursor = conn.cursor()
    position_id = get_id_by_name(request.form['position'], obj='position', conn=conn)
    first_name = request.form['first_name']
    last_name = request.form['last_name']
    birth_day = request.form['birth_day']
    salary = request.form['salary']
    data = (first_name, last_name, birth_day, position_id, salary)
    cursor.execute("INSERT INTO Players VALUES ('%s', '%s', '%s', %s, %s)" % data)
    conn.commit()


def create_team(conn, request):
    city_id = get_id_by_name(request.form['city'], obj='city', conn=conn)
    cursor = conn.cursor()
    data = (request.form['name'], city_id, request.form['birth_day'], request.form['budget'])
    cursor.execute("INSERT INTO Teams VALUES('%s', '%s', '%s', %s)" % data)
    conn.commit()


def create_match(conn, request):
    home_id = get_id_by_name(request.form['home_team'], obj='team', conn=conn)
    away_id = get_id_by_name(request.form['away_team'], obj='team', conn=conn)
    home_goals = request.form['home_goals']
    away_goals = request.form['away_goals']
    league_id = get_id_by_name(request.form['league'], obj='league', conn=conn)
    stadion_id = get_id_by_name(request.form['stadion'], obj='stadion', conn=conn)
    date = request.form['date']
    is_active = 0
    cursor = conn.cursor()
    data = (home_id, away_id, home_goals, away_goals, league_id, stadion_id, date)
    cursor.execute("INSERT INTO Matches VALUES (%s, %s, %s, %s, %s, %s, '%s')" % data)
    conn.commit()


def create_league(conn, request):
    name = request.form['name']
    start_date = request.form['start_date']
    end_date = request.form['end_date']
    cursor = conn.cursor()
    data = (name, start_date, end_date)
    cursor.execute("INSERT INTO League VALUES('%s', '%s', '%s')" % data)
    conn.commit()


def create_stadion(conn, request):
    cursor = conn.cursor()
    city_id = get_id_by_name(request.form['city'], obj='city', conn=conn)
    name = request.form['name']
    cursor.execute("INSERT INTO Stadions VALUES('%s', %s)" % (name, city_id))
    conn.commit()


def update_city(conn, request, id=0):
    cursor = conn.cursor()
    data = (
        request.form['name'],
        id
    )
    cursor.execute("update cityes set name='%s' where id=%s" % data)
    conn.commit()

def update_team(conn, request, id=0):
    cursor = conn.cursor()
    city_name = request.form['city']
    birth_day = request.form['birth_day']
    name = request.form['name']
    budget = request.form['budget']
    city_id = get_id_by_name(city_name, obj='city', conn=conn)
    data = (
        name,
        city_id,
        birth_day,
        budget,
        id
    )
    str = "update teams set name='%s', city=%s, making='%s', budget=%s where id=%s"
    cursor.execute(str % data)
    conn.commit()


def update_stadion(conn, request, id=0):
    cursor = conn.cursor()
    city_name = request.form['city']
    name = request.form['name']
    city_id = get_id_by_name(city_name, obj='city', conn=conn)
    data = (
        name,
        city_id,
        id
    )
    str = "update stadions set name='%s', city=%s where id=%s"
    cursor.execute(str % data)
    conn.commit()


def update_match(conn, request, id=0):
    cursor = conn.cursor()
    league = request.form['league']
    home_goals = request.form['home_goals']
    away_goals = request.form['away_goals']
    away_team = request.form['away_team']
    home_team = request.form['home_team']
    stadion_name = request.form['stadion']
    date = request.form['date']
    stadion_id = get_id_by_name(stadion_name, obj='stadion', conn=conn)
    home_id = get_id_by_name(home_team, obj='team', conn=conn)
    away_id = get_id_by_name(away_team, obj='team', conn=conn)
    league_id = get_id_by_name(league, obj='league', conn=conn)
    data = (
        home_id,
        away_id,
        home_goals,
        away_goals,
        league_id,
        stadion_id,
        date,
        id
    )
    str = "update matches set home=%s, away=%s, home_goals=%s, away_goals=%s, league_id=%s, stadion=%s, date='%s' where id=%s"
    cursor.execute(str % data)
    conn.commit()


def update_league(conn, request, id=0):
    cursor = conn.cursor()
    name = request.form['name']
    start_date = request.form['start_date']
    end_date = request.form['end_date']
    data = (
        name,
        start_date,
        end_date,
        id
    )
    str = "update league set name='%s', start_date='%s', end_date='%s' where id=%s"
    cursor.execute(str % data)
    conn.commit()


def update_player(conn, request, id=0):
    cursor = conn.cursor()
    first_name = request.form['first_name']
    last_name = request.form['last_name']
    birth_day = request.form['birth_day']
    position_name = request.form['position']
    positin = get_id_by_name(position_name, 'position', conn=conn)
    salary = request.form['salary']
    data = (
        first_name,
        last_name,
        birth_day,
        positin,
        salary,
        id
    )
    str = "update Players set First_Name='%s', Last_Name='%s', Birth_Day='%s', Position=%s, salary=%s where id=%s"
    cursor.execute(str % data)
    conn.commit()


def delete_city(conn, request, id):
    cursor = conn.cursor()
    str = "delete from Cityes where id=%s" % id
    cursor.execute(str)
    conn.commit()

def delete_stadion(conn, request, id):
    cursor = conn.cursor()
    str = "delete from Stadions where id=%s" % id
    cursor.execute(str)
    conn.commit()


def delete_team(conn, request, id):
    cursor = conn.cursor()
    str = "delete from Teams where id=%s" % id
    cursor.execute(str)
    conn.commit()


def delete_player(conn, request, id):
    cursor = conn.cursor()
    str = "delete from Players where id=%s" % id
    cursor.execute(str)
    conn.commit()


def delete_league(conn, request, id):
    cursor = conn.cursor()
    str = "delete from League where id=%s" % id
    cursor.execute(str)
    conn.commit()


def delete_match(conn, request, id):
    cursor = conn.cursor()
    str = "delete from Matches where id=%s" % id
    cursor.execute(str)
    conn.commit()

