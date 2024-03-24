from flask import Flask

app = Flask(__name__)

@app.get("/get_inference")
def get_inference():
    return "inference not yet implemented"

@app.post('/inference')
def inference():
    text = request.args.get("text")
