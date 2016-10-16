from flask import Flask
from flask import request

import db_api

import json

app = Flask(__name__)

@app.route('/cityes', methods=['GET', 'POST'])
def cityes(conn=db_api.get_connection()):
    if request.method == 'GET':
        return json.dumps({"cityes": db_api.get_cityes(conn)})
    else:
        try:
            db_api.create_city(conn, request)
            return json.dumps({"sucess": "yes"})
        except Exception as e:
            return json.dumps({"error": e.message})

@app.route('/players', methods=['GET', 'POST'])
def players(conn=db_api.get_connection()):
    if request.method == 'GET':
        return json.dumps({"players": db_api.get_players(conn)})
    else:
        try:
            db_api.create_player(conn, request)
            return json.dumps({"sucess": "yes"})
        except Exception as e:
            return json.dumps({"error": e.message})

@app.route('/teams', methods=['GET', 'POST'])
def teams(conn=db_api.get_connection()):
    if request.method == 'GET':
        return json.dumps({"teams": db_api.get_teams(conn)})
    else:
        try:
            db_api.create_team(conn, request)
            return json.dumps({"sucess": "yes"})
        except Exception as e:
            return json.dumps({"error": e.message})

@app.route('/matches', methods=['GET', 'POST'])
def matches(conn=db_api.get_connection()):
    if request.method == 'GET':
        return json.dumps({"matches": db_api.get_matches(conn)})
    else:
        try:
            db_api.create_match(conn, request)
            return json.dumps({"sucess": "yes"})
        except Exception as e:
            return json.dumps({"error": e.message})

@app.route('/championships', methods=['GET', 'POST'])
def chempionships(conn=db_api.get_connection()):
    if request.method == 'GET':
        return json.dumps({"chempionships": db_api.get_chempionships(conn)})
    else:
        try:
            db_api.create_league(conn, request)
            return json.dumps({"sucess": "yes"})
        except Exception as e:
            return json.dumps({"error": e.message})

@app.route('/stadions', methods=['GET', 'POST'])
def stadions(conn=db_api.get_connection()):
    if request.method == 'GET':
        return json.dumps({"stadions": db_api.get_stadions(conn)})
    else:
        try:
            db_api.create_stadion(conn, request)
            return json.dumps({"sucess": "yes"})
        except Exception as e:
            return json.dumps({"error": e.message})


if __name__ == '__main__':
    app.run(debug=True)