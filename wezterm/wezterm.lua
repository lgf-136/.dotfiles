local function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
  end
local wezterm = require "wezterm"
local SOLID_LEFT_ARROW = utf8.char(0xe0ba)
local SOLID_LEFT_MOST = utf8.char(0x2588)
local SOLID_RIGHT_ARROW = utf8.char(0xe0bc)

local ADMIN_ICON = utf8.char(0xf49c)

local CMD_ICON = utf8.char(0xe62a)
local NU_ICON = utf8.char(0xe7a8)
local PS_ICON = utf8.char(0xe70f)
local ELV_ICON = utf8.char(0xfc6f)
local WSL_ICON = utf8.char(0xf83c)
local YORI_ICON = utf8.char(0xf1d4)
local NYA_ICON = utf8.char(0xf61a)

local VIM_ICON = utf8.char(0xe62b)
local PAGER_ICON = utf8.char(0xf718)
local FUZZY_ICON = utf8.char(0xf0b0)
local HOURGLASS_ICON = utf8.char(0xf252)
local SUNGLASS_ICON = utf8.char(0xf9df)

local PYTHON_ICON = utf8.char(0xf820)
local NODE_ICON = utf8.char(0xe74e)
local DENO_ICON = utf8.char(0xe628)
local LAMBDA_ICON = utf8.char(0xfb26)

local SUP_IDX = {"¹","²","³","⁴","⁵","⁶","⁷","⁸","⁹","¹⁰",
				 "¹¹","¹²","¹³","¹⁴","¹⁵","¹⁶","¹⁷","¹⁸","¹⁹","²⁰"}
local SUB_IDX = {"₁","₂","₃","₄","₅","₆","₇","₈","₉","₁₀",
				 "₁₁","₁₂","₁₃","₁₄","₁₅","₁₆","₁₇","₁₈","₁₉","₂₀"}

local launch_menu = {}

local ssh_cmd = {"ssh"}
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	ssh_cmd = {"powershell.exe", "ssh"}
 	-- config.term = "" -- Set to empty so FZF works on windows
    -- config.term = "xterm"  -- fix bug in command "git log" with "terminal is not fully functional" or delete this term = "xxxx" (using default term value)
	table.insert(launch_menu,{label = "msys2",args = { "D:\\msys64\\usr\\bin\\zsh.exe"}})
	table.insert(launch_menu,{label = "Bash",args = { "C:\\Program Files\\Git\\bin\\bash.exe"}})
	table.insert(launch_menu,{label = "NuShell",args = { "C:\\Program Files\\nu\\bin\\nu.exe"}})
	table.insert(launch_menu, { label = "Command Prompt", args = { "cmd.exe" } })
    table.insert(launch_menu, { label = "PowerShell 5", args = { "powershell.exe", "-NoLogo" } })
    table.insert(launch_menu, { label = "PowerShell 7", args = { "pwsh.exe", "-NoLogo" } })
    table.insert(launch_menu,
        { label = "VS PowerShell 2022", args = { "powershell", "-NoLogo", "-NoExit", "-Command", "devps 17.0" } })
    table.insert(launch_menu,
        { label = "VS PowerShell 2019", args = { "powershell", "-NoLogo", "-NoExit", "-Command", "devps 16.0" } })
    
    table.insert(launch_menu,
        { label = "VS Command Prompt 2022", args = { "powershell", "-NoLogo", "-NoExit", "-Command", "devcmd 17.0" } })
    table.insert(launch_menu,
        { label = "VS Command Prompt 2019", args = { "powershell", "-NoLogo", "-NoExit", "-Command", "devcmd 16.0" } })

    -- Enumerate any WSL distributions that are installed and add those to the menu
    local success, wsl_list, wsl_err = wezterm.run_child_process({ "wsl", "-l" })
    -- `wsl.exe -l` has a bug where it always outputs utf16:
    -- https://github.com/microsoft/WSL/issues/4607
    -- So we get to convert it
    wsl_list = wezterm.utf16_to_utf8(wsl_list)

    for idx, line in ipairs(wezterm.split_by_newlines(wsl_list)) do
        -- Skip the first line of output; it's just a header
        if idx > 1 then
            -- Remove the "(Default)" marker from the default line to arrive
            -- at the distribution name on its own
            local distro = line:gsub(" %(Default%)", "")

            -- Add an entry that will spawn into the distro with the default shell
            table.insert(launch_menu, {
                label = distro .. " (WSL default shell)",
                args = { "wsl", "--distribution", distro },
            })

            -- Here's how to jump directly into some other program; in this example
            -- its a shell that probably isn't the default, but it could also be
            -- any other program that you want to run in that environment
            table.insert(launch_menu, {
                label = distro .. " (WSL zsh login shell)",
                args = { "wsl", "--distribution", distro, "--exec", "/bin/zsh", "-l" },
            })
        end
    end
else
    table.insert(launch_menu, { label = "zsh", args = { "zsh", "-l" } })
	table.insert(launch_menu, { label = "bash", args = { "bash", "-l" } })
	table.insert(launch_menu, { label = "sh", args = { "sh", "-l" } })

end

local ssh_config_file = wezterm.home_dir .. "/.ssh/config"
local f = io.open(ssh_config_file)
if f then
	local line = f:read("*l")
	while line do
		if line:find("Host ") == 1 then
			local host = line:gsub("Host ", "")
			table.insert(
				launch_menu,
				{
					label = "SSH " .. host,
					args = {"ssh", host}
				}
			)
		end
		line = f:read("*l")
	end
	f:close()
end

local mouse_bindings = {
	{
		event = {Down = {streak = 1, button = "Right"}},
		mods = "NONE",
		action = wezterm.action {PasteFrom = "Clipboard"}
	},
	-- Change the default click behavior so that it only selects
	-- text and doesn't open hyperlinks
	{
		event = {Up = {streak = 1, button = "Left"}},
		mods = "NONE",
		action = wezterm.action {CompleteSelection = "PrimarySelection"}
	},
	-- and make CTRL-Click open hyperlinks
	{
		event = {Up = {streak = 1, button = "Left"}},
		mods = "CTRL",
		action = "OpenLinkAtMouseCursor"
	}

}



wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local edge_background = "#121212"
  local background = "#4E4E4E"
  local foreground = "#1C1B19"
  local dim_foreground = "#3A3A3A"

  if tab.is_active then
	background = "#FBB829"
	foreground = "#1C1B19"
  elseif hover then
	background = "#FF8700"
	foreground = "#1C1B19"
  end

  local edge_foreground = background
  local process_name = tab.active_pane.foreground_process_name
  local pane_title = tab.active_pane.title
  local exec_name = basename(process_name):gsub("%.exe$", "")
  local title_with_icon

  if exec_name == "nu" then
	title_with_icon = NU_ICON .. " NuShell"
  elseif exec_name == "pwsh" then
	title_with_icon = PS_ICON .. " PS"
  elseif exec_name == "cmd" then
	title_with_icon = CMD_ICON .. " CMD"
  elseif exec_name == "elvish" then
	title_with_icon = ELV_ICON .. " Elvish"
  elseif exec_name == "wsl" or exec_name == "wslhost" then
	title_with_icon = WSL_ICON .. " WSL"
  elseif exec_name == "nyagos" then
	title_with_icon = NYA_ICON .. " " .. pane_title:gsub(".*: (.+) %- .+", "%1")
  elseif exec_name == "yori" then
	title_with_icon = YORI_ICON .. " " .. pane_title:gsub(" %- Yori", "")
  elseif exec_name == "nvim" then
	title_with_icon = VIM_ICON .. pane_title:gsub("^(%S+)%s+(%d+/%d+) %- nvim", " %2 %1")
  elseif exec_name == "bat" or exec_name == "less" or exec_name == "moar" then
	title_with_icon = PAGER_ICON .. " " .. exec_name:upper()
  elseif exec_name == "fzf" or exec_name == "hs" or exec_name == "peco" then
	title_with_icon = FUZZY_ICON .. " " .. exec_name:upper()
  elseif exec_name == "btm" or exec_name == "ntop" then
	title_with_icon = SUNGLASS_ICON .. " " .. exec_name:upper()
  elseif exec_name == "python" or exec_name == "hiss" then
	title_with_icon = PYTHON_ICON .. " " .. exec_name
  elseif exec_name == "node" then
	title_with_icon = NODE_ICON .. " " .. exec_name:upper()
  elseif exec_name == "deno" then
	title_with_icon = DENO_ICON .. " " .. exec_name:upper()
  elseif exec_name == "bb" or exec_name == "cmd-clj" or exec_name == "janet" or exec_name == "hy" then
	title_with_icon = LAMBDA_ICON .. " " .. exec_name:gsub("bb", "Babashka"):gsub("cmd%-clj", "Clojure")
  else
	-- title_with_icon = HOURGLASS_ICON .. " " .. exec_name
	title_with_icon = WSL_ICON .. " " .. exec_name
  end
  if pane_title:match("^Administrator: ") then
	title_with_icon = title_with_icon .. " " .. ADMIN_ICON
  end
  local left_arrow = SOLID_LEFT_ARROW
  if tab.tab_index == 0 then
	left_arrow = SOLID_LEFT_MOST
  end
  local id = SUB_IDX[tab.tab_index+1]
  local pid = SUP_IDX[tab.active_pane.pane_index+1]
  local title = " " .. wezterm.truncate_right(title_with_icon, max_width-6) .. " "

  return {
	{Attribute={Intensity="Bold"}},
	{Background={Color=edge_background}},
	{Foreground={Color=edge_foreground}},
	{Text=left_arrow},
	{Background={Color=background}},
	{Foreground={Color=foreground}},
	{Text=id},
	{Text=title},
	{Foreground={Color=dim_foreground}},
	{Text=pid},
	{Background={Color=edge_background}},
	{Foreground={Color=edge_foreground}},
	{Text=SOLID_RIGHT_ARROW},
	{Attribute={Intensity="Normal"}},
  }
end)

wezterm.on(
	"update-right-status",
	function(window)
		local date = wezterm.strftime("%Y-%m-%d %H:%M:%S ")
		window:set_right_status(
			wezterm.format(
				{
					{Text = date}
				}
			)
		)
	end
)

-- local default_prog = {"pwsh.exe"}

local is_windows = 1
if wezterm.target_triple == "x86_64-unknown-linux-gnu"  or wezterm.target_triple == "x86_64-apple-darwin" then
	is_windows = 2
	shell = excute_cmd(cmd)
end
-- local default_shell = {"pwsh.exe","zsh"}
-- local default_shell = {"C:\\Program Files\\Git\\bin\\bash.exe","zsh"}
local default_shell = {"D:\\msys64\\usr\\bin\\zsh.exe","zsh"}
local default_prog = {default_shell[is_windows]}

return {
	set_environment_variables = {
		PATH = wezterm.executable_dir .. ";" .. os.getenv("PATH"),
	 },
	window_frame = window_frame, -- needed only if using fancy tab
	window_background_opacity = 0.8,
	launch_menu = launch_menu,
	mouse_bindings = mouse_bindings,
	disable_default_key_bindings = true,
	default_prog = default_prog,
	-- font = wezterm.font("Fira Code"),
	font = wezterm.font_with_fallback({
		"FiraCode Nerd Font",
        "Cascadia Code",
        "Fira Code"
    }),
  colors = {
	  tab_bar = {
		  background = TAB_BAR_BG,
	  },
  },
	  text_background_opacity = 0.95,

	leader = { key="x", mods = "CTRL"},
	  keys = {
		{ key = "`", mods = "LEADER|CTRL",  action=wezterm.action{SendString="`"}},
		{ key = "v", mods = "CTRL",  action=wezterm.action{PasteFrom = "Clipboard"}},
		{ key = "-", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
		{ key = "\\",mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
		{ key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
		{key="h",mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Left"}},
		{key="j", mods = "LEADER",action=wezterm.action{ActivatePaneDirection="Up"}},
		{key="k", mods = "LEADER",action=wezterm.action{ActivatePaneDirection="Down"}},
		{key="l", mods = "LEADER",action=wezterm.action{ActivatePaneDirection="Right"}},
		{key = ",", mods = "LEADER", action = "ShowLauncher"},
		{key = "z", mods = "ALT", action = "ShowLauncher"},
		{key = "b", mods = "LEADER", action = "ShowTabNavigator"},
		{ key = "f", mods = "LEADER", action = "QuickSelect" },
		{ key = "\t", mods = "LEADER",       action="ActivateLastTab"},
		{ key = "1", mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
		{ key = "2", mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
		{ key = "3", mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
		{ key = "4", mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
		{ key = "5", mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
		{ key = "6", mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
		{ key = "7", mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
		{ key = "8", mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
		{ key = "9", mods = "LEADER",       action=wezterm.action{ActivateTab=8}},
		-- { key = "l", mods = "LEADER",       action=wezterm.action{EmitEvent="toggle-ligature"}},
		{ key = "n", mods = "LEADER",       action=wezterm.action{ActivateTabRelative=1}},
		{ key = "p", mods = "LEADER",       action=wezterm.action{ActivateTabRelative=-1}},
		{ key = "&", mods = "LEADER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
		{ key = "x", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},
		{ key = "w", mods = "ALT", action = wezterm.action({ CopyTo = "Clipboard" }) },
		{ key = "y", mods = "CTRL", action = wezterm.action({ PasteFrom = "Clipboard" }) },
		{ key = "Tab", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = 1 }) },
   },

}