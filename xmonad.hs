import Data.List ( isPrefixOf )
import XMonad
import System.Exit

import System.IO
import System.Time
import System.Locale
import System.Environment

	--import System.IO.UTF8
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.FadeInactive as FI
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Themes
import XMonad.Layout.Grid
import XMonad.Layout.Cross
import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.DecorationMadness
import XMonad.Layout.TwoPane
import XMonad.Layout.LimitWindows
import XMonad.Layout.Magnifier
import XMonad.Layout.FixedColumn
import XMonad.Layout.Combo
import XMonad.Layout.ComboP
import XMonad.Layout.Tabbed
import XMonad.Layout.IM
import XMonad.Layout.Fullscreen
import XMonad.Layout.Reflect
import XMonad.Actions.GridSelect
import XMonad.Util.NamedScratchpad
import Data.Ratio ((%))
import XMonad.Util.Scratchpad 
import XMonad.Hooks.SetWMName
import Data.List

pythonDzenPP :: PP
pythonDzenPP = defaultPP {
  ppCurrent  = dzenColor "#000001" "#000010" . pad
    , ppVisible  = dzenColor "#000002" "#000020" . pad
    , ppHidden   = dzenColor "#000003" "#000030" . pad
    , ppHiddenNoWindows = dzenColor "#000004" "#000040"
    , ppUrgent   = dzenColor "#000005" "#000050"
    , ppWsSep    = ""
    , ppSep      = ""
    , ppLayout   = dzenColor "#000007" "#000070" 
    , ppTitle    = dzenColor "#000006" "#000060". shorten 20
}

main = xmonad =<< xmobar defaultConfig 
	{	terminal = "urxvt"
	,	modMask = mod4Mask
	,	borderWidth = 1
	}

