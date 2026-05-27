from flask import Flask, render_template, request

app = Flask(__name__)

students = {
    "101": {"password": "abc123", "name": "Rahul", "attendance": 85},
    "102": {"password": "xyz789", "name": "Priya", "attendance": 60},
    "103": {"password": "pass111", "name": "Aman", "attendance": 92}
}

@app.route("/")
def home():
    return render_template("index.html")


@app.route("/result", methods=["POST"])
def result():

    roll = request.form["roll"]
    password = request.form["password"]
    internal = int(request.form["internal"])
    external = int(request.form["external"])

    if roll not in students or students[roll]["password"] != password:
        return render_template(
            "result.html",
            error="Invalid Roll Number or Password"
        )

    student = students[roll]

    total = internal + external
    percentage = total / 2
    attendance = student["attendance"]

    if percentage >= 75 and attendance >= 75:
        status = "Scholarship Eligible"

    elif percentage >= 40:
        status = "Pass"

    else:
        status = "Fail"

    return render_template(
        "result.html",
        name=student["name"],
        roll=roll,
        attendance=attendance,
        total=total,
        percentage=percentage,
        status=status
    )


if __name__ == "__main__":
    app.run(debug=True)
