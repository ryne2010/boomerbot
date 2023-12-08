from flask import Flask, jsonify
import sensor_data  # Import your sensor data script

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    data = sensor_data.read_sensor_data()
    return jsonify(data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
