-- Layer rules wiki https://wiki.hypr.land/Configuring/Basics/Layer-Rules/

-- Blur the vicinae launcher overlay
hl.layer_rule({
    name          = "vicinae-blur",
    match         = { namespace = "vicinae" },
    blur          = true,
    ignore_alpha  = 0,
})

-- Disable animations for vicinae only
hl.layer_rule({
    name          = "vicinae-no-animation",
    match         = { namespace = "vicinae" },
    no_anim       = true,
})
