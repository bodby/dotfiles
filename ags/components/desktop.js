const battery = await Service.import("battery")
const hyprland = await Service.import("hyprland")

const BatteryPercent = () => {
    const visualPercent = Widget.LevelBar({
        visible: true,
        value: battery.bind("percent").as(p => p > 0 ? p / 100 : 0.75),
        class_name: battery.bind("charging").as(ch => ch ? "battery-charging" : "battery"),
        width_request: 32,
    })

    const textPercent = Widget.Label({
        label: battery.bind("available").as(a => a
            ? battery.bind("percent").as(p => p)
            : "404").as(v => v + "%"),
        class_name: "battery-label",
    })

    return Widget.Box({
        class_name: "battery-box",
        vertical: true,
        children: [
            Widget.Label({
                label: "󱊢",
                class_name: "battery-icon"
            }),
            visualPercent,
            textPercent,
        ]
    })
}

export const DesktopWidget = (monitor = 0) => {
    let mainWidget = Widget.Window({
        monitor,
        name: `bobdesktop-${monitor}`,
        class_name: "bob-desktop",
        anchor: ["top", "left"],
        margins: [16, 0, 0, 32],
        exclusivity: "normal",
        layer: "bottom",
        child: BatteryPercent(),
    })

    mainWidget.hook(hyprland.active, (self) => {
        hyprland.connect("event", (obj, event, data) => {
            // let specialWorkspaceMod = 0

            // if (event == "activespecial") {
            //     if (data.includes("special")) {
            //         let specialWorkspaceMod = 1
            //     }
            //     else {
            //         let specialWorkspaceMod = 0
            //     }
            // }

            const workspaceId = hyprland.monitors[0].activeWorkspace.id

            const allowFloating = (hyprland.getClient(
                hyprland.getWorkspace(workspaceId)?.lastwindow)?.floating)

            // > (1 - specialWorkspaceMod).
            if (hyprland.getWorkspace(workspaceId)?.windows > 0 && !allowFloating) {
                self.visible = false
            } else {
                self.visible = true
            }
        })
    })

    return mainWidget
}
