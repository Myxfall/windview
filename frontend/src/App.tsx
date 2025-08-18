import { useEffect } from 'react'
import './App.css'

import widgets from "./widgets.json"

function App() {

    useEffect(() => {
        widgets.forEach(params => {
            const arg = Object.entries(params).map(([key, val]) => `${key}=${val}`)
            const script = document.createElement("script")
            script.src = "https://www.windguru.cz/js/widget.php?" + arg.join("&")

            document.body.appendChild(script)
        });

    }, []);

    return (
        <>
            <h1>Windguru Forecast</h1>
            <div>
                {widgets.map((widget) =>
                    <div id={widget.uid} />
                )}
            </div>
        </>
    )
}

export default App
