import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = xmonad =<< xmobar defaultConfig 
	{	terminal = "urxvt"
	,	modMask = mod4Mask
	,	borderWidth = 1
    ,   manageHook = manageDocks <+> manageHook defaultConfig
    ,   layoutHook = avoidStruts $ layoutHook defaultConfig
    }
