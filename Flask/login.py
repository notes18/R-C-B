from flask import Flask, render_template, request, redirect, url_for
from datetime import datetime
app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def home():

    if request.method == 'POST':

        email = request.form['email']
        password = request.form['password']
        dob=request.form['dob']
        # Validation
        birth_date = datetime.strptime(dob,"%Y-%m-%d")
        if email == "" or password == "":
            return "Fields cannot be empty"

        if len(password) < 6:
            return "Password must contain at least 6 characters"

        if '@' not in email:
            return "Invalid Email"

        # Login Check

        if email == "admin" and password == "admin123":
            return redirect(url_for('success'))
        

        else:
            return redirect(url_for('error'))

    return render_template('index.html')


@app.route('/success')
def success():
    return render_template('success.html')


@app.route('/error')
def error():
    return render_template('error.html')


if __name__ == '__main__':
    app.run(debug=True)