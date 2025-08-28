from flask import Flask, jsonify, send_from_directory

#import yaml
#from windguru import get_forecast, is_windy

#app = Flask(__name__)
app = Flask(__name__, static_folder="../frontend/dist", static_url_path="")

@app.route('/api/hello')
def hello():
    return jsonify({
            "message": "Hello from Flask!",
            "second": "Second unstructured message"
        })

@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def serve_frontend(path):
    if path != "" and os.path.exists(os.path.join(app.static_folder, path)):
        return send_from_directory(app.static_folder, path)
    else:
        return send_from_directory(app.static_folder, 'index.html')


#@app.route('/api/alerts')
#def alerts():
#    with open("config.yaml") as f:
#        config = yaml.safe_load(f)
#
#    all_alerts = []
#    for spot in config["spots"]:
#        forecast = get_forecast(spot["id"])
#        alerts = is_windy(forecast, spot["wind_threshold"])
#        all_alerts.append({
#            "name": spot["name"],
#            "alerts": alerts
#        })
#
#    return jsonify(all_alerts)
#    print("=== running alerts flask ===")

if __name__ == '__main__':
    app.run(debug=True, port=5000, host='0.0.0.0')
