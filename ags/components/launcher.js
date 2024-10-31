const { query } = await Service.import("applications")

const AppItem = (app) => Widget.Button({
    on_clicked: () => {
        App.closeWindow("boblauncher")
        app.launch()
    },
    attribute: { app },
    child: Widget.Label({
        // class_name: "app-item",
        label: app.name,
        xalign: 0,
        vpack: "center",
        truncate: "end",
    }),
})

const LauncherItems = ({ width = 480, height = 0 }) => {
    let applications = query("").map(AppItem)

    const appList = Widget.Box({
        vertical: true,
        children: applications,
        spacing: 16,
    })

    function repopulate() {
        applications = query("").map(AppItem)
        appList.children = applications
    }

    const entryBox = Widget.Entry({
        hexpand: true,
        placeholder_text: "Search for app",
        class_name: "app-launcher-entry",

        on_accept: ({ text }) => {
            const results = applications.filter((item) => item.visible);

            let searchQuery = text.split(" ")
            searchQuery.shift()
            searchQuery = searchQuery.toString()
            searchQuery = searchQuery.replaceAll(",", " ")

            if (text.split(" ").shift() == "!ff") {
                Utils.execAsync([
                    "librewolf-bin",
                    "https://duckduckgo.com/?q=" + searchQuery])
                    .catch(err => print(err));

                App.toggleWindow("boblauncher")
            }

            if (results[0]) {
                App.toggleWindow("boblauncher")
                results[0].attribute.app.launch()
            }
        },

        on_change: ({ text }) => applications.forEach(item => {
            const appName = text.split(" ")[0]

            item.visible = item.attribute.app.match(appName ?? "")
        }),
    })

    return Widget.Box({
        vertical: true,
        class_name: "app-launcher-box",
        children: [
            Widget.Box({
                // class_name: "entry-holder",
                css: `min-width: ${width}px;`
                    + `min-height: ${height}px;`,
                children: [
                    Widget.Label({
                        class_name: "entry-decorator",
                        label: "•",
                        xalign: 0,
                    }),
                    entryBox,
                ],
            }),

            // Widget.Scrollable({
            //     hscroll: "never",
            //     css: `min-width: ${width}px;`
            //     + `min-height: ${height}px;`,
            //     child: appList,
            // })
        ],

        setup: (self) => self.hook(App, (_, windowName, visible) => {
            if (windowName !== "boblauncher")
                return

            if (visible) {
                repopulate()
                entryBox.text = ""
                entryBox.grab_focus()
            }
        }),
    })
}

export const Launcher = Widget.Window({
    name: "boblauncher",
    visible: false,
    class_name: "app-launcher-box",
    keymode: "exclusive",
    layer: "top",
    exclusivity: "ignore",
    child: LauncherItems({}),
    setup: self => self.keybind("Escape", () => {
        App.closeWindow("boblauncher")
    }),
})
