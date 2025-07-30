import os
port = int(os.environ.get("PORT", 8000))  # Render provides $PORT
app.run(host="0.0.0.0", port=port)
