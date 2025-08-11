from flask import Flask, jsonify
import yaml
#from windguru import get_forecast, is_windy

app = Flask(__name__)

@app.route('/api/alerts')
def alerts():
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
    print("=== running alerts flask ===")
if __name__ == '__main__':
    app.run(debug=True, port=5000, host='0.0.0.0')
