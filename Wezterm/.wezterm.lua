local wezterm=require 'wezterm'
local c={}

if wezterm.config_builder then
    c= wezterm.config_builder()
end    

c.color_scheme ='Tokyo Night'
c.font =wezterm.font('FiraMono Nerd Font Mono',{weight = 'Bold',italic=false})
c.font_size =14
c.enable_tab_bar = true

c.background = {
    -- 底层是图片
    {
        source = { File = xxx},  -- 填图片路径
        width = "Cover",
        height = "Cover",
        opacity = 1.0,
    },
    
       {
        source = { Color = "#301934" },
        opacity = 0.3,
    },
    
}


c.window_decorations = " RESIZE"
c.default_prog={xxx} --填shell的路径

return c