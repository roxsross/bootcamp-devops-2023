from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return '¡Hola, mundo! Este es un ejemplo de Flask en Docker.'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
