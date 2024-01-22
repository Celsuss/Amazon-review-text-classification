from flask import Flask

app = Flask(__name__)

@app.get("/get_inference")
def get_inference():
    return text

@app.post('/inference')
def inference():
    text = request.args.get("text")
