# windview
Windguru agglomerator for spots overview and wind condition notification

## Development

1. **Install dependencies**
   ```sh
   # Node.js example
   npm install
   # Python example
   pip install -r requirements.txt
   ```

2. **Run in development mode**
   ```sh
   # Node.js
   npm run dev
   # Python
   python main.py
   ```

## Production

1. **Build the project**
   ```sh
   # Node.js
   npm run build
   # Python: usually no build step
   ```

2. **Run in production**
   ```sh
   # Node.js
   npm start
   # Python
   python main.py
   ```

## Docker

1. **Build the Docker image**
   ```sh
   docker build -t windview .
   ```

2. **Run the Docker container**
   ```sh
   docker run --rm -p 8080:8080 windview
   ```

   Adjust the port mapping as needed.

---
*Replace language-specific commands with your stack's actual commands