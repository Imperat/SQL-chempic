from flask import Flask

import db_api

import json

app = Flask(__name__)

@app.route('/cityes')
def cityes(conn=db_api.get_connection()):
    return json.dumps({"cityes": db_api.get_cityes(conn)})

if __name__ == '__main__':
    app.run(debug=True)