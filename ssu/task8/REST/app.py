from flask import Flask

import db_api

import json

app = Flask(__name__)

@app.route('/cityes')
def cityes(conn=db_api.get_connection()):
    return json.dumps({"cityes": db_api.get_cityes(conn)})

@app.route('/players')
def players(conn=db_api.get_connection()):
    return json.dumps({"players": db_api.get_players(conn)})

@app.route('/teams')
def teams(conn=db_api.get_connection()):
    return json.dumps({"teams": db_api.get_teams(conn)})

@app.route('/matches')
def matches(conn=db_api.get_connection()):
    return json.dumps({"matches": db_api.get_matches(conn)})

@app.route('/championships')
def chempionships(conn=db_api.get_connection()):
    return json.dumps({"chempionships": db_api.get_chempionships(conn)})

@app.route('/stadions')
def stadions(conn=db_api.get_connection()):
    return json.dumps({"stadions": db_api.get_stadions(conn)})

if __name__ == '__main__':
    app.run(debug=True)