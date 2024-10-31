export const Edges = (monitor = 0) => {
    return Widget.Window({
        monitor,
        name: `bobedge-${monitor}`,
        class_name: "bob-edge",
        anchor: ["bottom", "left", "right"],
        click_through: true,
        exclusivity: "normal",
        layer: "top",
        child: Widget.Box({
            class_name: "border",
            expand: true,
            child: Widget.Box({
                class_name: "corner",
                expand: true,
            }),
        })
    })
}
