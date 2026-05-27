from flask import Flask, jsonify, request

app = Flask(__name__)

# In-memory data store (simulating a database)
tasks = [
    {"id": 1, "title": "Learn Flask", "done": False},
    {"id": 2, "title": "Build an API", "done": False}
]

# 1. GET: Retrieve all tasks
@app.route('/tasks', methods=['GET'])
def get_tasks():
    return jsonify({"tasks": tasks})

# 2. POST: Create a new task
@app.route('/tasks', methods=['POST'])
def create_task():
    # Ensure the request contains JSON data
    if not request.json or not 'title' in request.json:
        return jsonify({"error": "Title is required"}), 400
    
    new_task = {
        "id": tasks[-1]['id'] + 1 if tasks else 1,
        "title": request.json['title'],
        "done": False
    }
    tasks.append(new_task)
    return jsonify(new_task), 201

# 3. PUT: Update an existing task
@app.route('/tasks/<int:task_id>', methods=['PUT'])
def update_task(task_id):
    task = next((t for t in tasks if t['id'] == task_id), None)
    if task is None:
        return jsonify({"error": "Task not found"}), 44
    
    task['title'] = request.json.get('title', task['title'])
    task['done'] = request.json.get('done', task['done'])
    return jsonify(task)

# 4. DELETE: Remove a task==
@app.route('/tasks/<int:task_id>', methods=['DELETE'])
def delete_task(task_id):
    global tasks
    tasks = [t for t in tasks if t['id'] != task_id]
    return jsonify({"result": True}), 200

if __name__ == '__main__':
    app.run(debug=True)


