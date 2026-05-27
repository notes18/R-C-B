from flask import Flask ,send_file

app = Flask(__name__)

@app.route("/")
def home():
    return "i am amit !"
@app.route("/download")
def download():
    return send_file("Flask_MOCK.pdf", as_attachment=True)

app.run(host="0.0.0.0", port=5000)