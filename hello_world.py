from flask import Flask
import datetime

app = Flask(__name__)


@app.route('/', methods=['GET'])
def is_it_friday_yet():
    today = datetime.datetime.today().strftime('%A')
    if today == 'Friday':
        return '<h1>It is friday !</h1>'
    else:
        return '<h1>It is not friday yet :(</h1>'


if __name__ == '__main__':
    app.run(debug=True)
