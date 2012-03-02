-- Imports
import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog

-- Main function
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Bar Spec
myBar = "xmobar"

-- Cystom PP
myPP = xmobarPP { ppCurrent = xmobarColor"#429242" "" . wrap "<" ">" }

-- Key binding 
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main xmonad configuration
myConfig = defaultConfig{
	 borderWidth 		= 3
	, terminal		= "urxvt"
	, modMask		= mod4Mask
	, normalBorderColor 	= "#444444"
	, focusedBorderColor 	= "#164F08"
	, handleEventHook	= fullscreenEventHook
	, logHook = dynamicLog
	}
