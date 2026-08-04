local function apply_edp_monitor()
    if hl.get_monitor("HDMI-A-1") then
        hl.monitor({
            output = "eDP-1",
            mode = "1920x1080@60",
            position = "2560x540",
            scale = 1.2,
        })
    else
        hl.monitor({
            output = "eDP-1",
            mode = "1920x1080@60",
            position = "0x0",
            scale = 1,
        })
    end
end

hl.monitor({
    output = "HDMI-A-1",
    mode = "2560x1440@144",
    position = "0x0",
    scale = 1,
})

apply_edp_monitor()

hl.on("monitor.added", apply_edp_monitor)
hl.on("monitor.removed", apply_edp_monitor)
