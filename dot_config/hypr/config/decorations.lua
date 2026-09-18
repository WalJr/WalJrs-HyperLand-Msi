-- Look and feel configuration

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 8,
        border_size = 2,
        extend_border_grab_area = 10,
        resize_on_border = true,
        col = {
            active_border = {
                colors = { "rgba(d69bffff)", "rgba(7e4faeff)" },
                angle = 45,
            },
            inactive_border = "rgba(6e5a86ff)",
        },
    },
    group = {
        col = {
            border_active = CACHYLBLUE,
            border_inactive = CACHYGRAY,
            border_locked_active = CACHYDBLUE,
            border_locked_inactive = CACHYGRAY,
        },
        groupbar = {
            col = {
                active = CACHYLGREEN,
                inactive = CACHYGRAY,
                locked_active = CACHYDBLUE,
                locked_inactive = CACHYGRAY,
            },
        },
    },
    decoration = {
        dim_special = 0.3,
        dim_inactive = true,
        dim_strength = 0.08,
        rounding = 12,
        active_opacity = 0.95,
        inactive_opacity = 0.85,
        fullscreen_opacity = 1,
        blur = {
            size = 8,
            passes = 4,
            special = true,
            popups = true,
            vibrancy = 0.1696,
            noise = 0.0117,
            contrast = 0.8916,
        },
        glow = {
            enabled = true,
            range = 6,
            render_power = 3,
            color = {
                colors = { "rgba(d69bffff)", "rgba(7e4faeff)" },
                angle = 45,
            },
            color_inactive = "rgba(00000000)",
        },
        shadow = {
            enabled = true,
            range = 25,
            render_power = 3,
            color = "rgba(000000aa)",
            color_inactive = "rgba(00000055)",
        },
    },
})
