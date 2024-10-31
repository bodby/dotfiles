import { BobSeparator } from "./misc/separator.js"

const hyprland = await Service.import("hyprland")
const audio = await Service.import("audio")

const date = Variable("", {
    poll: [1000, "date -dnow '+%H:%M on %a %Y-%m-%d'"],
})

// In GiB.
const memoryUsage = Variable(0, {
    poll: [1000, "free", out => (parseInt(out.split("\n")
        .find(line => line.includes("Mem:"))
        .split(/\s+/)
        .splice(1, 2)[1]) / 1024 / 1024)
        .toFixed(2)
        .toString() + " GiB"],
})

const cpuTemp = Variable(0, {
    poll: [
        1000,
        "cat /sys/class/hwmon/hwmon4/temp3_input",
        out => ((parseInt(out) / 1000).toString() + " C"),
    ]
})

// Modules.
const Memory = () => Widget.Label({
    class_name: "memory",
    label: memoryUsage.bind()
})

const CpuTemperature = () => Widget.Label({
    class_name: "cpu",
    label: cpuTemp.bind()
})

const Clock = () => Widget.Label({
    class_name: "clock",
    label: date.bind(),
})

const Volume = () => {
    return Widget.Label().hook(audio.speaker, (self) => {
        const vol = audio.speaker.volume * 100

        self.class_name = "volume"
        self.label = vol.toFixed(0).toString() + "%"
    })
}

function Left() {
    return Widget.Box({
        spacing: 16,
        children: [
            Memory(),
            BobSeparator(),
            CpuTemperature(),
        ],
        css: "margin-left: 16px;",
    })
}

function Center() {
    return Widget.Box({
        spacing: 16,
        children: [
            Clock(),
        ],
    })
}

// TODO: Prayer time API.
// https://api.aladhan.com/v1/timingsByCity/now?city=Riyadh&country=SA

// const apiSample = `{
//     "Fajr": "02:52",
//     "Sunrise": "05:33",
//     "Dhuhr": "13:18",
//     "Asr": "17:31",
//     "Sunset": "20:11",
//     "Maghrib": "20:10",
//     "Isha": "22:11",
//     "Imsak": "03:33",
//     "Midnight": "00:58"
// }`

// print(JSON.parse(apiSample).Sunrise)

function Right() {
    return Widget.Box({
        hpack: "end",
        spacing: 16,
        children: [
            Volume(),
        ],
        css: "margin-right: 16px;",
    })
}

export const Bar = (monitor = 0) => Widget.Window({
    monitor,
    name: `bobbar-${monitor}`,
    class_name: "bob-bar",
    anchor: ["bottom", "left", "right"],
    click_through: true,
    // margins: [0, 16, 16, 16],
    exclusivity: "exclusive",
    layer: "top",
    child: Widget.CenterBox({
        class_name: "bob-bar-box",
        start_widget: Left(),
        center_widget: Center(),
        end_widget: Right(),
    }),
})
