import { Bar } from "./components/bar.js"
import { Launcher } from "./components/launcher.js"
import { DesktopWidget } from "./components/desktop.js"
import { Edges } from "./components/edges.js"

App.config({
    windows: [
        Bar(),
        Edges(),
        // Launcher,
        // DesktopWidget(),
    ],
    style: './style.css',
})
