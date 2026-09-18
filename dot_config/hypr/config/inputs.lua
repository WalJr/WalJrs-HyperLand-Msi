-- Input configuration

hl.config({
    input = {
        kb_layout = "tr, us",
        kb_options = "grp:win_space_toggle",
        numlock_by_default = true,
        follow_mouse = 1,
        mouse_refocus = false,
        -- sensitivity = -0.25,
        accel_profile = "flat",
    },
    -- Uncomment the section below to enable software cursors; this can help with cursor display or behavior issues
    cursor = {
        no_hardware_cursors = 1,
    },
})

hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down",       action = "close" })
hl.gesture({ fingers = 3, direction = "up",         action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
