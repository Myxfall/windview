# windview
Windguru agglomerator for spots overview and wind condition notification

## Running Locally

1. **Clone the repository:**
   ```bash
   git clone https://github.com/myxfall/windview.git
   cd windview
   ```

2. **Install dependencies:**
   ```bash
   # If using Python
   pip install -r requirements.txt

   # If using Node.js
   npm install
   ```

3. **Start the application:**
   ```bash
   # Python example
   python main.py

   # Node.js example
   npm run dev
   ```

## Running with Docker Compose

1. **Ensure Docker and Docker Compose are installed.**

2. **Start the services:**
   ```bash
   docker compose up --build
   ```

3. **Access the application:**
   - Visit [http://localhost:5000](http://localhost:5000) (or the port specified in your `docker-compose.yml`).

## Configuration

- Edit configuration files as needed (e.g., `.env`, `config.yaml`).

## Features

- Aggregates wind conditions from Windguru for multiple spots.
- Sends notifications based on wind conditions.

## License
