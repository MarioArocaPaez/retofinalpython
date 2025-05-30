import os

from app import create_app, db
from app.config import config_dict


env_name = os.getenv("FLASK_ENV", "development")
app = create_app(env_name)

with app.app_context():
    db.create_all()

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
