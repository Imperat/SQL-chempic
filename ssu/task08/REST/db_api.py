import pymssql

from db_api_utils import _get_city, _get_position, _get_team, _get_league, _get_stadion

def get_connection():
    """
    get connecion for my specific DataBase
    """
    conn = pymssql.connect(server="127.0.0.1",
                           user="Marmon",
                           password="Marmon",
			                     database="FinalIteration",
                           tds_version="7.0",
			   port="2079")
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

